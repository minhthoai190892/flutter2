import 'package:climate/services/location.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

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
  }

  void getLocation() async {
    Location location = Location();
    await location.getLocation();
    print(location.latitude);
    print(location.longitude);
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
