import 'package:air_weather/resource/custom_theme.dart';
import 'package:flutter/material.dart';

import 'package:air_weather/weather_page/weather_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: customTheme(),
      debugShowCheckedModeBanner: false,
      title: 'Airport Weather Notification',
      home: WeatherPage(),
    );
  }
}
