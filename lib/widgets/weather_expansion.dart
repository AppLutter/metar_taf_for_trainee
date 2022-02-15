import 'package:air_weather/models/metar.dart';
import 'package:air_weather/models/taf.dart';
import 'package:air_weather/services/metar_api_services.dart';
import 'package:air_weather/services/taf_api_services.dart';
import 'package:flutter/material.dart';

class WeatherExpansion extends StatefulWidget {
  WeatherExpansion({
    required this.icaoCode,
    required this.airportName,
    Key? key,
  }) : super(key: key);
  final String airportName;
  final String icaoCode;

  @override
  _WeatherExpansionState createState() => _WeatherExpansionState();
}

class _WeatherExpansionState extends State<WeatherExpansion> {
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      expandedHeaderPadding: EdgeInsets.zero,
      expansionCallback: (panelIndex, isExpanded) {
        setState(() {
          _isExpanded = !isExpanded;
        });
      },
      children: [
        ExpansionPanel(
          backgroundColor: Colors.lightBlue,
          isExpanded: _isExpanded,
          headerBuilder: (context, isExpanded) {
            return Center(
              child: Container(
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.only(
                //     topRight: Radius.circular(25),
                //   ),
                // ),
                child: Text(
                  widget.airportName,
                  style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
            );
          },
          body: DefaultTabController(
            initialIndex: 1,
            length: 2,
            child: Column(
              children: [
                Container(
                  child: TabBar(
                    labelStyle: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400,
                    ),
                    tabs: [
                      Tab(text: 'METAR'),
                      Tab(text: 'TAF'),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(20.0),
                  height: 350,
                  width: 400,
                  child: TabBarView(
                    children: [
                      FutureBuilder<Metar>(
                        future: fetchMetar(widget.icaoCode),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Center(
                                child: Text(
                              snapshot.data!.metarMsg,
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold),
                            ));
                          } else if (snapshot.hasError) {
                            return Text(snapshot.error.toString());
                          } else {
                            return Center(
                              child: SizedBox(
                                width: 40,
                                height: 40,
                                child: CircularProgressIndicator(),
                              ),
                            );
                          }
                        },
                      ),
                      FutureBuilder<Taf>(
                        future: fetchTaf(widget.icaoCode),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Center(
                              child: Text(
                                snapshot.data!.tafMsg,
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            );
                          } else if (snapshot.hasError) {
                            return Center(
                                child: Text(snapshot.error.toString()));
                          } else {
                            return Center(
                              child: SizedBox(
                                width: 40,
                                height: 40,
                                child: CircularProgressIndicator(),
                              ),
                            );
                          }
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
