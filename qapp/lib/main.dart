import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async{
  List _quakes = await getQuakes();
  print(_quakes );
  runApp(new MaterialApp(
    home: quakes(),
  ));
}
class quakes extends StatelessWidget {
  const quakes({ Key? key }) : super(key: key);

  get http => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text( 'QuakeHome',
        style: TextStyle(color: Colors.cyan),
        
        ),
        centerTitle: true,
        backgroundColor: Colors.white70,
      ),
      body: Container(
        
      ),
    );
  }
}
    Future <List> getQuakes() async {
     Uri apiUrl = Uri.parse('https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson');
    
  
  
  http.Response response = await http.get(apiUrl);
  
  return  jsonDecode(response.body);
}
      
    
  


