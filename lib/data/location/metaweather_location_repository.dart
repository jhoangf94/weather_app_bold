import 'dart:convert';

import 'package:http/http.dart';
import 'package:wather_app/domain/entities/location.dart';
import 'package:wather_app/domain/entities/weather.dart';
import 'package:wather_app/domain/repositories/location_repository.dart';
import 'package:wather_app/shared/exceptions/ApiException.dart';

class MetaWeatherLocationRepository implements LocationRepository {
  MetaWeatherLocationRepository(this._client);

  final Client _client;
  static const _baseUrl = 'https://www.metaweather.com';

  @override
  Future<List<Location>> searchLocation(String text) async {
    final url = Uri.parse('$_baseUrl/api/location/search/?query=$text');
    final response = await _client.get(url);

    var jsonResponse = _parseResponse(response) as List;
    final listLocations =
        jsonResponse.map((json) => Location.fromJson(json)).toList();

    return listLocations;
  }

  @override
  Future<List<Forecast>> getForecastLocation(Location location) async {
    final url = Uri.parse('$_baseUrl/api/location/${location.woeid}/');
    final response = await _client.get(url);

    final jsonResponse = _parseResponse(response) as Map<String, dynamic>;
    final weather = jsonResponse['consolidated_weather'] as List;
    final loc = weather.map((json) => Forecast.fromJson(json)).toList();

    return loc;
  }

  dynamic _parseResponse(Response response) {
    final isBadRequest =
        response.statusCode >= 400 && response.statusCode < 500;
    final isServerError = response.statusCode >= 500;

    if (isServerError || isBadRequest) {
      throw ApiException(code: response.statusCode);
    }

    return jsonDecode(response.body);
  }
}
