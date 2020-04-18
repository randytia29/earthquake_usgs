import 'package:earthquakeusgs/bloc/bloc.dart';
import 'package:earthquakeusgs/ui/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider<EarthquakeBloc>(
          create: (context) =>
              EarthquakeBloc()..add(FetchEarthquakeEvent(minMagnitude: 3)),
          child: MainPage()),
    ));
