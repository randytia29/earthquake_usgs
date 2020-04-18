import 'package:earthquakeusgs/bloc/bloc.dart';
import 'package:flutter/material.dart';

class SortirPage extends StatelessWidget {
  EarthquakeBloc bloc;

  SortirPage({this.bloc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sort")),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text("Minimum Magnitude"),
            subtitle: Text("3"),
          ),
          Divider(),
          RaisedButton(
            onPressed: () {
              bloc.add(FetchEarthquakeEvent(minMagnitude: 5));
              Navigator.pop(context);
            },
            child: Text("Tombol"),
          )
        ],
      ),
    );
  }
}
