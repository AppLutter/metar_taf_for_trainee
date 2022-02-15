import 'package:air_weather/widgets/metar_taf_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '기상알림',
          style: TextStyle(fontSize: 30.0),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {});
            },
            icon: Icon(Icons.refresh),
          )
        ],
      ),
      body: AirmetView(),
    );
  }
}

class AirmetView extends StatefulWidget {
  @override
  AirmetViewState createState() => AirmetViewState();
}

class AirmetViewState extends State<AirmetView> {
  MapController mapController = MapController(
      initMapWithUserPosition: false,
      initPosition: GeoPoint(latitude: 36.03428, longitude: 127.43402));

  @override
  Widget build(BuildContext context) {
    return OSMFlutter(
      showContributorBadgeForOSM: true,
      controller: mapController,
      trackMyPosition: false,
      initZoom: 6.5,
      stepZoom: 1.0,
      roadConfiguration: RoadConfiguration(
        startIcon: MarkerIcon(
          icon: Icon(
            Icons.person,
            size: 64,
            color: Colors.brown,
          ),
        ),
        roadColor: Colors.yellowAccent,
      ),
      markerOption: MarkerOption(
          defaultMarker: MarkerIcon(
        icon: Icon(
          Icons.person_pin_circle,
          color: Colors.blue,
          size: 56,
        ),
      )),
    );
  }

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }
}
