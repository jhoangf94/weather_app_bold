import 'package:flutter/material.dart';

import 'package:wather_app/domain/entities/location.dart';
import 'package:wather_app/domain/entities/weather.dart';

class TodayWeatherInformation extends StatelessWidget {
  const TodayWeatherInformation({
    Key? key,
    required this.location,
    required this.forecast,
  }) : super(key: key);

  final Location location;
  final Forecast forecast;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '${location.title}',
          style: Theme.of(context)
              .textTheme
              .headline2
              ?.copyWith(color: Colors.white),
        ),
        SizedBox(height: 10),
        Text(
          '${forecast.weatherStateName}',
          style: Theme.of(context)
              .textTheme
              .subtitle2
              ?.copyWith(color: Colors.white),
        ),
        SizedBox(height: 25),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text(
                  '${forecast.theTemp.toStringAsFixed(0)}°',
                  style: Theme.of(context).textTheme.headline1?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                      ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.arrow_downward_outlined, color: Colors.white),
                    Text(
                      '${forecast.minTemp.toStringAsFixed(0)}° ',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          ?.copyWith(color: Colors.white),
                    ),
                    Icon(Icons.arrow_upward_outlined, color: Colors.white),
                    Text(
                      '${forecast.maxTemp.toStringAsFixed(0)}°',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          ?.copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              height: 150,
              width: 150,
              child: Image(
                image: NetworkImage(
                  'https://www.metaweather.com/static/img/weather/png/${forecast.weatherStateAbbr}.png',
                ),
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
