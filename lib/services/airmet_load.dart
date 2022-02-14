import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;

Future<void> airmetLoad() async {
  final Uri uri =
      Uri.parse('https://global.amo.go.kr/comis4/uis/common/index_acwis.do#');

  try {
    http.Response response = await http.get(uri);
    var document = parser.parse(response.body);
    var responseString = document.getElementById('contentMain');

    print(responseString);
  } catch (e) {
    rethrow;
  }
}
