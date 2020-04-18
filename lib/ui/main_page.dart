import 'package:earthquakeusgs/bloc/bloc.dart';
import 'package:earthquakeusgs/ui/detail_card.dart';
import 'package:earthquakeusgs/ui/detail_page.dart';
import 'package:earthquakeusgs/ui/sortir_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    EarthquakeBloc bloc = BlocProvider.of<EarthquakeBloc>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text("Quake Report"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.list),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SortirPage(bloc: bloc)));
              })
        ],
      ),
      body: Container(child: BlocBuilder<EarthquakeBloc, EarthquakeState>(
        builder: (context, state) {
          if (state is EarthquakeInitialState) {
            return Center(
                child: SizedBox(
                    height: 30, width: 30, child: CircularProgressIndicator()));
          } else {
            EarthquakeLoaded earthquakeLoaded = state as EarthquakeLoaded;
            return ListView.builder(
                itemCount: earthquakeLoaded.feature.length,
                itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailPage(
                                    properties: earthquakeLoaded
                                        .feature[index].properties,
                                  )));
                    },
                    child: DetailCard(
                        properties:
                            earthquakeLoaded.feature[index].properties)));
          }
        },
      )),
    );
  }
}
