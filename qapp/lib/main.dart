import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
// ignore: unused_element
Map _data = ( getQuakes()) as Map ;
void main() async{
   _data = (await getQuakes()) as Map;
  print(_data['features'][0]['properties']);
  runApp(new MaterialApp(
    home: new Quakes(), 
  ));
  }
  class Quakes extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title:  new Text('Quakes'),
        centerTitle: true,
      
      ),
      body:new Center(
        child:  new ListView.builder(itemBuilder:(BuildContext context,int postition) {
          return new ListTile(
             title:  new Text("$_data['features']['postiton']['properties']['place']"),
          );
        },
        itemCount:_data.length ,),
      ) ,
    );
  }

  }
Future <List> getQuakes() async {
     Uri apiUrl = Uri.parse('https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson');
    
  
  
  http.Response response = await http.get(apiUrl);
  
  return  jsonDecode(response.body);
}
      
    
  


