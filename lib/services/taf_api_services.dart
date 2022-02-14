import 'package:air_weather/models/taf.dart';
import 'package:http/http.dart' as http;

import 'package:air_weather/constants/constants.dart';
import 'package:air_weather/services/http_error_handler.dart';

import 'package:xml/xml.dart';

Future<Taf> fetchTaf(String icaoCode) async {
  final Uri uri = Uri.parse('${kTafUrl}=${icaoCode}');
  XmlDocument? xmlData;

  try {
    final http.Response response = await http.get(uri);

    if (response.statusCode != 200) {
      throw Exception(httpErrorHandler(response));
    }
    xmlData = XmlDocument.parse(response.body);

    final Taf taf = Taf.fromXml(xmlData);

    return taf;
  } catch (e) {
    rethrow;
  }
}
