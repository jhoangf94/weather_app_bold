import 'package:flutter/material.dart';

import 'package:wather_app/domain/entities/weather.dart';
import 'package:wather_app/ui/home_page/components/day_weather_card.dart';

class ForcecastDays extends StatelessWidget {
  const ForcecastDays({
    Key? key,
    required this.forecastWeek,
  }) : super(key: key);

  final List<Forecast> forecastWeek;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 115,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Color(0xffa8bef4),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: forecastWeek.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, i) {
          final forecastDay = forecastWeek[i];
          return DayWeatherCard(
            dayName: '${forecastDay.dayOfWeek}',
            image: Image(
              image: NetworkImage(
                  'https://www.metaweather.com//static/img/weather/png/${forecastDay.weatherStateAbbr}.png'),
              fit: BoxFit.cover,
            ),
            temp: '${forecastDay.theTemp.toInt()}',
          );
        },
      ),
    );
  }
}
