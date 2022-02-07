import 'package:equatable/equatable.dart';

class Metar extends Equatable {
  final String icaoCode;
  final String metarMsg;
  bool isExpanded;

  Metar({
    required this.icaoCode,
    required this.metarMsg,
    this.isExpanded = false,
  });

  factory Metar.initial() => Metar(icaoCode: '', metarMsg: '');

  factory Metar.fromJson(Map<String, dynamic> json) {
    final consolidatedMetar = json['iwxxm:METAR']['iwxxm:extension']['msgText'];

    return Metar(
      icaoCode: consolidatedMetar.toString().substring(6, 9),
      metarMsg: consolidatedMetar.toString(),
    );
  }

  @override
  List<Object> get props => [metarMsg];

  @override
  bool? get stringify => true;

  Metar copyWith({
    String? icaoCode,
    String? metarMsg,
  }) {
    return Metar(
      icaoCode: icaoCode ?? this.icaoCode,
      metarMsg: metarMsg ?? this.metarMsg,
    );
  }
}
