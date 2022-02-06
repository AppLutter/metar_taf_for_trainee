import 'package:air_weather/models/airport.dart';
import 'package:flutter/material.dart';

class AirportExpansionTile extends StatefulWidget {
  AirportExpansionTile({required this.list, Key? key}) : super(key: key);
  final List<Airport> list;

  @override
  _AirportExpansionTileState createState() => _AirportExpansionTileState();
}

class _AirportExpansionTileState extends State<AirportExpansionTile> {
  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
        expansionCallback: (int index, bool isExpanded) {
          setState(() {
            widget.list[index].isExpaneded = !isExpanded;
          });
        },
        children: widget.list.map<ExpansionPanel>(
          (Airport airport) {
            return ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  title: Text(airport.airPortName),
                );
              },
              body: ListTile(
                title: Text(airport.metar),
              ),
              isExpanded: airport.isExpaneded,
            );
          },
        ).toList());
  }
}
