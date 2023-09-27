import 'dart:convert';

import 'package:climate/services/album.dart';
import 'package:climate/services/location.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
    getData();
  }

  void getLocation() async {
    Location location = Location();
    await location.getLocation();
    print(location.latitude);
    print(location.longitude);
  }

  void getData() async {
    http.Response response = await http
        .get(Uri.parse('http://api.openweathermap.org/data/2.5/weather?q=London,uk&APPID=e21c0a31b1307e9263b6baee3c15eb88'));
    if (response.statusCode == 200) {
      String data = response.body;
      print(data);
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueAccent,
      width: 200.0,
      height: 200.0,
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            // _currentPosition = await _determinePosition();
            // print(_currentPosition?.latitude);
            getLocation();
          },
          child: const Text('Get Location'),
        ),
      ),
    );
  }
}
