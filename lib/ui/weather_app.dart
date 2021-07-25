import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wather_app/ui/home_page/home_page.dart';

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // hide top status bar
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return MaterialApp(
      title: 'WeatherApp',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
