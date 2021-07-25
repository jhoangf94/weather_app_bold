import 'package:flutter/material.dart';

import 'package:wather_app/domain/entities/location.dart';
import 'package:wather_app/ui/home_page/components/bottom_details_card.dart';
import 'package:wather_app/ui/home_page/components/forcecast_days.dart';
import 'package:wather_app/ui/home_page/components/today_weather_information.dart';

class HomePageLandscapeLayout extends StatelessWidget {
  const HomePageLandscapeLayout({
    Key? key,
    required this.location,
  }) : super(key: key);

  final Location location;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        children: [
          Flexible(
            child: TodayWeatherInformation(
              location: location,
              forecast: location.forecast[0],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ForcecastDays(
                    forecastWeek: location.forecast,
                  ),
                  SizedBox(height: 25),
                  BottomDetailsCard(
                    forecast: location.forecast[0],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
