import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import 'data/location/metaweather_location_repository.dart';
import 'package:wather_app/domain/usecases/get_weather_location.dart';
import 'package:wather_app/domain/usecases/search_location_usecase.dart';
import 'package:wather_app/ui/home_page/home_bloc/home_page_bloc.dart';
import 'package:wather_app/ui/weather_app.dart';

void main() async {
  final repo = MetaWeatherLocationRepository(http.Client());
  final searchLocationUseCase = SearchLocationUseCase(repo);
  final getWeatherLocationUseCase = GetWeatherLocationUseCase(repo);

  runApp(
    BlocProvider(
      create: (_) => HomePageBloc(
        searchLocationUseCase,
        getWeatherLocationUseCase,
      ),
      child: WeatherApp(),
    ),
  );
}
