import 'package:xml/xml.dart';

class Taf {
  final String tafMsg;

  Taf({
    required this.tafMsg,
  });

  factory Taf.initial() => Taf(tafMsg: '');

  factory Taf.fromXml(XmlDocument xml) {
    return Taf(
      tafMsg: xml
          .findAllElements('msgText')
          .toString()
          .substring(13)
          .replaceAll('=</msgText>)', '')
          .replaceAll('= </msgText>)', '')
          .replaceAll('\n', '')
          .replaceAll('  ', '')
          .replaceAll('   ', '')
          .replaceAll('    ', '')
          .replaceAll('BECMG', '\nBECMG')
          .replaceAll('TN\*', '\nTNM')
          .replaceAll('TX', '\nTX')
          .replaceAll('TEMPO', '\nTEMPO')
          .trim(),
    );
  }
}
