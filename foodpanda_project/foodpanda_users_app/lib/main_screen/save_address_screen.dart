// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodpanda_users_app/global/global.dart';
import 'package:foodpanda_users_app/models/address_model.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import '../widgets/simple_app_bar_widget.dart';
import '../widgets/text_field_widget.dart';

class SaveAddressScreen extends StatelessWidget {
  SaveAddressScreen({super.key});
  final _nameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _flatNumberController = TextEditingController();
  final _cityController = TextEditingController();
  final _statController = TextEditingController();
  final _completeAddressController = TextEditingController();
  final _locationController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late Position position;
  late List<Placemark> placemarks;
  late String completeAddress;
  _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    Position newPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    position = newPosition;
    placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark pMark = placemarks[0];
    completeAddress =
        '${pMark.subThoroughfare}, ${pMark.thoroughfare},${pMark.subLocality} ${pMark.locality}, ${pMark.subAdministrativeArea}, ${pMark.administrativeArea}  ${pMark.postalCode}, ${pMark.country}';
    _locationController.text = completeAddress;
    _flatNumberController.text =
        '${pMark.subThoroughfare}, ${pMark.thoroughfare},${pMark.subLocality}';
    _cityController.text =
        '${pMark.subAdministrativeArea}, ${pMark.administrativeArea} ${pMark.postalCode}';
    _statController.text = '${pMark.country}';
    _completeAddressController.text = completeAddress;
  }

  @override
  Widget build(BuildContext context) {
    // _determinePosition();
    return Scaffold(
      appBar: const SimpleAppBar( title: 'iFood'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Align(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  'Save Address: ',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.person_pin_circle,
                color: Colors.black,
                size: 35,
              ),
              title: SizedBox(
                width: double.infinity,
                child: TextField(
                  controller: _locationController,
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                      hintText: 'What\'s your address?',
                      hintStyle: TextStyle(color: Colors.black)),
                ),
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.cyan),
              onPressed: () {
                // get current location with address
                _determinePosition();
              },
              icon: const Icon(
                Icons.location_on,
                color: Colors.white,
              ),
              label: const Text(
                'Get my location ',
                style: TextStyle(color: Colors.white),
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFieldWidget(
                      hintText: 'Name', controller: _nameController),
                  TextFieldWidget(
                      hintText: 'Phone Number',
                      controller: _phoneNumberController),
                  TextFieldWidget(
                      hintText: 'City', controller: _cityController),
                  TextFieldWidget(
                      hintText: 'State / Country', controller: _statController),
                  TextFieldWidget(
                      hintText: 'Address Line',
                      controller: _flatNumberController),
                  TextFieldWidget(
                      hintText: 'Complete Address',
                      controller: _completeAddressController),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            final model = AddressModel(
                    name: _nameController.text.trim(),
                    phoneNumber: _phoneNumberController.text.trim(),
                    flatNumber: _flatNumberController.text.trim(),
                    city: _cityController.text.trim(),
                    state: _statController.text.trim(),
                    fullAddress: completeAddress,
                    lat: position.latitude,
                    long: position.longitude)
                .toMap();
            firebaseFirestore
                .collection('users')
                .doc(firebaseAuth.currentUser!.uid)
                .collection('userAddresss')
                .doc(DateTime.now().microsecondsSinceEpoch.toString())
                .set(model)
                .then((value) {
              _formKey.currentState!.reset();
              return Fluttertoast.showToast(
                  msg: 'New Address has been saved successfully');
            });
          }
        },
        label: const Text('Save Now'),
        icon: const Icon(Icons.save),
      ),
    );
  }
}
