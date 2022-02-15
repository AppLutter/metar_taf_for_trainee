import 'package:http/http.dart' as http;

import 'package:air_weather/constants/constants.dart';
import 'package:air_weather/models/metar.dart';
import 'package:air_weather/services/http_error_handler.dart';

import 'package:xml/xml.dart';

Future<Metar> fetchMetar(String icaoCode) async {
  final Uri uri = Uri.parse('${kMetarUrl}=${icaoCode}');
  XmlDocument? xmlData;

  try {
    final http.Response response = await http.get(uri);

    if (response.statusCode != 200) {
      throw Exception(httpErrorHandler(response));
    }
    xmlData = XmlDocument.parse(response.body);
    print(xmlData.getElement('msgText'));

    final Metar metar = Metar.fromXml(xmlData);

    return metar;
  } catch (e) {
    rethrow;
  }
}
