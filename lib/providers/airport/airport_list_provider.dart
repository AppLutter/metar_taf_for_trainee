// import 'package:air_weather/models/metar.dart';
// import 'package:air_weather/providers/airport/airport_list_state.dart';
// import 'package:flutter/cupertino.dart';

// class AirportListProvider with ChangeNotifier {
//   AirportListState _state = AirportListState.initial();
//   AirportListState get state => _state;

//   void addAirport(String icaoCode) {
//     final newAirport = Metar(metarMsg: icaoCode);
//     final newAirports = [..._state.metars, newAirport];

//     _state = _state.copyWith(metars: newAirports);
//     notifyListeners();
//   }
// }
