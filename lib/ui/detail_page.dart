import 'package:earthquakeusgs/model/earthquake.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailPage extends StatelessWidget {
  final Properties properties;

  DetailPage({this.properties});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text("Quake Report"),
        /*actions: <Widget>[
          IconButton(
              icon: Icon(Icons.list),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SortirPage()));
              })
        ],*/
      ),
      body: WebView(
        initialUrl: properties.url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
