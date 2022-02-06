import 'package:equatable/equatable.dart';

class Metar extends Equatable {
  final String icaoCode;
  final String airPortName;
  final String metar;
  final String metarMsg;
  bool isExpaneded;

  Metar({
    required this.metarMsg,
    required this.icaoCode,
    required this.airPortName,
    required this.metar,
    this.isExpaneded = false,
  });

  factory Metar.initial() => Metar(
        metarMsg: '',
        icaoCode: '',
        airPortName: '',
        metar: '',
      );

  factory Metar.fromJson(Map<String, dynamic> json) {
    final consolidatedMetar = json['iwxxm:METAR']['iwxxm:extension']['msgText'];

    return Metar(
      metarMsg: consolidatedMetar.toString(),
    );
  }

  @override
  List<Object> get props => [metarMsg, icaoCode, airPortName, metar];

  @override
  bool? get stringify => true;
}
