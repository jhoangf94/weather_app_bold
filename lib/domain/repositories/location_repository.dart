import 'package:wather_app/domain/entities/location.dart';
import 'package:wather_app/domain/entities/weather.dart';

abstract class LocationRepository {
  Future<List<Location>> searchLocation(String text);
  Future<List<Forecast>> getForecastLocation(Location location);
}
