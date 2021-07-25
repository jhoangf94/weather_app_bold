import 'package:flutter/material.dart';

class DayWeatherCard extends StatelessWidget {
  const DayWeatherCard({
    Key? key,
    required this.dayName,
    required this.temp,
    required this.image,
  }) : super(key: key);

  final String dayName;
  final String temp;
  final Widget image;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(right: 25),
        child: Column(
          children: [
            Text(
              '$dayName',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 8),
            Container(
              height: 40,
              child: image,
            ),
            SizedBox(height: 8),
            Text('$temp°', style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
