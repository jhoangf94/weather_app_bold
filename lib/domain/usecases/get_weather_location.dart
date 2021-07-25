import 'package:wather_app/domain/entities/location.dart';
import 'package:wather_app/domain/repositories/location_repository.dart';

class GetWeatherLocationUseCase {
  GetWeatherLocationUseCase(this._repository);

  final LocationRepository _repository;

  Future<Location> call(Location location) async {
    final forecast = await _repository.getForecastLocation(location);
    location.forecast = forecast;

    return location;
  }
}
