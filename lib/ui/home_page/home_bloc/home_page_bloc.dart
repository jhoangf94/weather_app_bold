import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:wather_app/domain/entities/location.dart';
import 'package:wather_app/domain/usecases/get_weather_location.dart';
import 'package:wather_app/domain/usecases/search_location_usecase.dart';
import 'package:wather_app/shared/exceptions/ApiException.dart';
import 'package:wather_app/ui/home_page/home_bloc/home_page_state.dart';

const _UNEXPECTED_ERROR_MESSAGE = 'Unexpected error';

class HomePageBloc extends Cubit<HomepageState> {
  HomePageBloc(
    this._searchLocationUseCase,
    this._getWeatherLocationUseCase,
  ) : super(HomepageState.initial);

  final SearchLocationUseCase _searchLocationUseCase;
  final GetWeatherLocationUseCase _getWeatherLocationUseCase;

  searchLocation(String text) async {
    try {
      emit(state
          .copyWith(loadingLocations: true, error: '', locationsResult: []));
      final locations = await _searchLocationUseCase(text);
      emit(state.copyWith(locationsResult: locations, loadingLocations: false));
    } on ApiException catch (e) {
      emit(state.copyWith(
        loadingLocations: false,
        error: _getApiExceptionMessage(e),
      ));
      print(e);
    } catch (e) {
      _emitUnexpectedError();
    }
  }

  loadForecastLocation(Location loc) async {
    try {
      emit(state.copyWith(loadingForecast: true, error: ''));
      final location = await _getWeatherLocationUseCase(loc);
      emit(state.copyWith(loadingForecast: false, selectedLocation: location));
    } on ApiException catch (e) {
      emit(state.copyWith(
        loadingForecast: false,
        error: _getApiExceptionMessage(e),
      ));
    } catch (e) {
      _emitUnexpectedError();
    }
  }

  void _emitUnexpectedError() {
    emit(
      state.copyWith(
        loadingLocations: false,
        loadingForecast: false,
        error: _UNEXPECTED_ERROR_MESSAGE,
      ),
    );
  }

  String _getApiExceptionMessage(ApiException exception) {
    switch (exception.code) {
      case 500:
        return 'Server error';
      default:
        return 'Oops, we had an unexpected error, please try again.';
    }
  }
}
