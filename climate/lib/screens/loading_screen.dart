// ignore_for_file: avoid_print, prefer_interpolation_to_compose_strings

import 'dart:convert';

import 'package:climate/services/location.dart';
import 'package:climate/services/network.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

const apiKey = 'e21c0a31b1307e9263b6baee3c15eb88';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double? latitude = 0;
  double? longitude = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getLocation();
    latitude = location.latitude;
    longitude = location.longitude;
    NetworkHelper networkHelper = NetworkHelper(
        url:
            'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');
    var weatherData = await networkHelper.getData();
    print(latitude);
    print(longitude);
  }

  // var temperature = jsonDecode(data)['main']['temp'];
  // print(temperature);
  // var condition = jsonDecode(data)['weather'][0]['id'];
  // print(condition);
  // var cityName = jsonDecode(data)['name'];
  // print(cityName);
  // print(data);

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
            getLocationData();
          },
          child: const Text('Get Location'),
        ),
      ),
    );
  }
}
