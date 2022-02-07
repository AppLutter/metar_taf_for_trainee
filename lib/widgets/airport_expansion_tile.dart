import 'package:air_weather/models/metar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AirportExpansionTile extends StatefulWidget {
  AirportExpansionTile({ Key? key})
      : super(key: key);

  @override
  _AirportExpansionTileState createState() => _AirportExpansionTileState();
}

class _AirportExpansionTileState extends State<AirportExpansionTile> {
  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
        expansionCallback: (int index, bool isExpanded) {
          setState(() {
            context.watch
            widget.airportListState.metars[index].isExpanded = !isExpanded;
          });
        },
        children: widget.airportListState.metars.map<ExpansionPanel>(
          (Metar metar) {
            return ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  title: Text('${metar.icaoCode}'),
                );
              },
              body: ListTile(
                title: Text('${metar.metarMsg}'),
              ),
              isExpanded: metar.isExpanded,
            );
          },
        ).toList());
  }
}
