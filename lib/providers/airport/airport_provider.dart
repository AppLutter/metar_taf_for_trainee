import 'package:air_weather/constants/constants.dart';
import 'package:air_weather/models/metar.dart';
import 'package:air_weather/providers/airport/airport_state.dart';
import 'package:air_weather/services/metar_api_services.dart';
import 'package:flutter/foundation.dart';

class Airport with ChangeNotifier {
  AirportState _state = AirportState.initial();
  AirportState get state => _state;

  void addAirport(Airport airport) {
    for (int i = 0; i < kIcaoCode.length; i++) {
      MetarApiServices apiServices =
          MetarApiServices(airPortName: kIcaoCode[i]);

      Metar newMetar = apiServices.getMetar();
      List<Metar> newMetars = [..._state.metars, newMetar];
      _state = _state.copyWith(metars: newMetars);
    }
  }

  // List<AirportState> generateAirport(int numberOfItems) {
  //   return List<AirportState>.generate(numberOfItems, (int index) {
  //     return AirportState(airPortName: airPortName, metar: metar);
  //   });
  // }
}
