import 'package:flutter/material.dart';

import 'package:wather_app/domain/entities/location.dart';
import 'package:wather_app/ui/home_page/components/bottom_details_card.dart';
import 'package:wather_app/ui/home_page/components/forcecast_days.dart';
import 'package:wather_app/ui/home_page/components/today_weather_information.dart';

class HomePageProtrait extends StatelessWidget {
  const HomePageProtrait({
    Key? key,
    required this.location,
  }) : super(key: key);

  final Location location;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: TodayWeatherInformation(
            location: location,
            forecast: location.forecast[0],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ForcecastDays(
            forecastWeek: location.forecast,
          ),
        ),
        SizedBox(height: 25),
        BottomDetailsCard(
          forecast: location.forecast[0],
        ),
      ],
    );
  }
}
