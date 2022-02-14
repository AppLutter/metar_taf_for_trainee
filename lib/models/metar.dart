import 'package:xml/xml.dart';

class Metar {
  final String metarMsg;

  Metar({
    required this.metarMsg,
  });

  factory Metar.initial() => Metar(metarMsg: '');

  factory Metar.fromXml(XmlDocument xml) {
    return Metar(
      metarMsg: xml
          .findAllElements('msgText')
          .toString()
          .substring(16)
          .replaceAll('=</msgText>)', '')
          .replaceAll('= </msgText>)', '')
          .replaceAll('\n', '')
          .replaceAll('  ', '')
          .replaceAll('   ', '')
          .replaceAll('    ', '')
          .replaceFirst(' ', '\n')
          .trim(),
    );
  }
}
