import 'dart:convert';

import 'package:wather_app/domain/entities/weather.dart';

class Location {
  Location({
    required this.woeid,
    required this.title,
    required this.locationType,
    required this.lattLong,
  }) : forecast = [];

  final int woeid;
  final String title;
  final String locationType;
  final String lattLong;
  List<Forecast> forecast;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        title: utf8.decode((json["title"] as String).codeUnits),
        locationType: json["location_type"],
        woeid: json["woeid"],
        lattLong: json["latt_long"],
      );
}
