import 'package:air_weather/models/metar.dart';
import 'package:air_weather/widgets/airport_expansion_tile.dart';
import 'package:flutter/material.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: AirportExpansionTile(),
      ),
    );
  }
}
