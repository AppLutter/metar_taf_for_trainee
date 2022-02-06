import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AirportState extends Equatable {
  final String metar;
  bool isExpaneded;
  AirportState({
    required this.metar,
    this.isExpaneded = false,
  });

  AirportState copyWith({
    String? airPortName,
    String? metar,
  }) {
    return AirportState(
      metar: metar ?? this.metar,
    );
  }

  factory AirportState.initial() {
    return AirportState(metar: '');
  }

  @override
  List<Object?> get props => [metar];

  @override
  bool? get stringify => true;
}
