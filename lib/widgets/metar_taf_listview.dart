import 'package:air_weather/constants/constants.dart';
import 'package:air_weather/widgets/weather_expansion.dart';
import 'package:flutter/material.dart';

class MetarTafListView extends StatelessWidget {
  const MetarTafListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        //화면에 대한 padding
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20.0),
        child: ListView.builder(
          itemCount: kIcaoCode.length,
          itemBuilder: (context, index) {
            return Padding(
              //타일 간 간격 padding
              padding: const EdgeInsets.all(15.0),
              child: WeatherExpansion(
                airportName: kAirportName[index],
                icaoCode: kIcaoCode[index],
              ),
            );
          },
        ),
      ),
    );
  }
}
