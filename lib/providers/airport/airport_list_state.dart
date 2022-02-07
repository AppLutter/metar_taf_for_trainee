import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import 'package:air_weather/models/metar.dart';

class AirportListState extends Equatable {
  final List<Metar> metars;
  AirportListState({
    required this.metars,
  });

  factory AirportListState.initial() {
    return AirportListState(metars: [
      Metar(icaoCode: '0', metarMsg: '0'),
      Metar(icaoCode: '0', metarMsg: '0'),
      Metar(icaoCode: '0', metarMsg: '0'),
    ]);
  }

  AirportListState copyWith({
    List<Metar>? metars,
  }) {
    return AirportListState(
      metars: metars ?? this.metars,
    );
  }

  @override
  List<Object> get props => [metars];

  @override
  bool? get stringify => true;
}
