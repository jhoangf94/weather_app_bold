import 'package:flutter/material.dart';

import 'package:wather_app/domain/entities/weather.dart';
import 'package:wather_app/ui/home_page/components/item_description.dart';

class BottomDetailsCard extends StatelessWidget {
  const BottomDetailsCard({
    Key? key,
    required this.forecast,
  }) : super(key: key);

  final Forecast forecast;

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    final radius = Radius.circular(15);
    final onlyTopBorder = BorderRadius.vertical(top: radius);
    final allBorder = BorderRadius.all(radius);

    final borderRadius = !isLandscape ? onlyTopBorder : allBorder;

    return Container(
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: borderRadius,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ItemDescription(
                icon: Icons.thermostat_outlined,
                title: 'temperature',
                desc: '${forecast.theTemp.toInt()}°',
              ),
              SizedBox(width: 45),
              ItemDescription(
                icon: Icons.air_outlined,
                title: 'wind speed',
                desc: '${forecast.windSpeed.toInt()} m/h',
              ),
            ],
          ),
          SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ItemDescription(
                icon: Icons.opacity_outlined,
                title: 'humidity',
                desc: '${forecast.humidity}%',
              ),
              SizedBox(width: 45),
              ItemDescription(
                icon: Icons.visibility_off_outlined,
                title: 'visibility',
                desc: '${forecast.visibility.toInt()}%',
              ),
            ],
          ),
          if (isLandscape) SizedBox(width: 25),
        ],
      ),
    );
  }
}
