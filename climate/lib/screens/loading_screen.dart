// ignore_for_file: avoid_print, prefer_interpolation_to_compose_strings

import 'package:climate/screens/location_screen.dart';
import 'package:climate/services/location.dart';
import 'package:climate/services/network.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const apiKey = 'e21c0a31b1307e9263b6baee3c15eb88';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double? latitude;
  double? longitude;
  @override
  void initState() {
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
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LocationScreen(),
      ),
    );
    print(latitude);
    print(longitude);
    print(weatherData);
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
    return const Center(
      child: SpinKitDoubleBounce(
        color: Colors.white,
        size: 100.0,
        // duration: Duration(microseconds: 2000),
      ),
    );
  }
}
