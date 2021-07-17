import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

// ignore: unused_element
List _data = [];
void main() async {
  _data = await getQuakes();
  runApp(MaterialApp(
    home: Quakes(),
  ));
}

class Quakes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quakes'),
        centerTitle: true,
      ),
      body: Center(
          child: ListView.builder(
        itemCount: _data.length,
        padding: const EdgeInsets.all(15.0),
        itemBuilder: (context, index) {
          var feature = _data[index];
          return Card(
            child: ListTile(
              title: Text(feature['properties']['place']),
            ),
          );
        },
      )),
    );
  }
}

Future<List> getQuakes() async {
  Uri apiUrl = Uri.parse(
      'https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson');

  var response = await http.get(apiUrl);
  var body = jsonDecode(response.body);

  return body['features'];
}
