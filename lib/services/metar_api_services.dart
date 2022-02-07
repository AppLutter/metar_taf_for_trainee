import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

import 'package:air_weather/constants/constants.dart';
import 'package:air_weather/models/metar.dart';
import 'package:air_weather/services/http_error_handler.dart';

import 'package:xml2json/xml2json.dart';

class MetarApiServices {
  Future<Metar> getMetar(String airPortName) async {
    final Uri uri = Uri.parse('${kHost}=${airPortName}');

    try {
      final http.Response response = await http.get(uri);

      if (response.statusCode != 200) {
        throw Exception(httpErrorHandler(response));
      }

      final getXmlData = response.body;
      final Xml2JsonData = Xml2Json()..parse(getXmlData);
      final jsonData = Xml2JsonData.toParker();
      final metarJson = convert.jsonDecode(jsonData);

      final Metar metar = Metar.fromJson(metarJson);

      return metar;
    } catch (e) {
      rethrow;
    }
  }
}
