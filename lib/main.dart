import 'package:air_weather/pages/weather_page.dart';
import 'package:air_weather/providers/airport/airport_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //  MultiProvider(
    // providers: [
    //   ChangeNotifierProvider<AirportListProvider>(
    //     create: (context) => AirportListProvider(),
    //   )
    // ],
    return MaterialApp(
      title: 'Airport Weather Notification',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WeatherPage(),
    );
    // );
  }
}
