import 'package:air_weather/models/airport.dart';
import 'package:flutter/material.dart';
import 'services/metar_api_services.dart';

import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Airport Weather Notification',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
final List<Airport> _airport = 

  final tafApiServices =
      MetarApiServices(httpClient: http.Client(), airPortName: 'RKSI');

  @override
  void initState() {
    tafApiServices.getMetar();
    super.initState();
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Metar'),
      ),
      body: SingleChildScrollView(child: Container(child: ,),)
    );
  }
}
