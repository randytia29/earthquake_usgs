import 'package:date_format/date_format.dart';
import 'package:earthquakeusgs/model/earthquake.dart';
import 'package:flutter/material.dart';

class DetailCard extends StatelessWidget {
  final Properties properties;

  DetailCard({this.properties});

  @override
  Widget build(BuildContext context) {
    String separator = " of ";
    String locationOffset = null;
    String primaryLocation = null;
    if (properties.place.contains(separator)) {
      List<String> parts = [];
      parts = properties.place.split(separator);
      locationOffset = parts[0] + separator;
      primaryLocation = parts[1];
    } else {
      locationOffset = "near the";
      primaryLocation = properties.place;
    }
    var time = DateTime.fromMillisecondsSinceEpoch(properties.time);
    return Card(
      elevation: 3,
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Container(
            padding: EdgeInsets.all(5),
            color: (properties.mag <= 3)
                ? Colors.green
                : (properties.mag <= 6) ? Colors.orange : Colors.red,
            width: 50,
            height: 50,
            child: Center(
              child: Text(
                properties.mag.toStringAsFixed(1),
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  locationOffset,
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  formatDate(time, [dd, " ", M, " ", yyyy]),
                  style: TextStyle(fontSize: 12),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Text(
                    primaryLocation,
                    style: TextStyle(fontSize: 12),
                    maxLines: 1,
                  ),
                ),
                Text(
                  formatDate(time, [HH, ":", nn, ":", ss]),
                  style: TextStyle(fontSize: 12),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
