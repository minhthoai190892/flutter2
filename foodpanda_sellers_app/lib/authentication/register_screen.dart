import 'dart:io';

import 'package:flutter/material.dart';
import 'package:foodpanda_sellers_app/widgets/custom_text_field_widget.dart';
import 'package:foodpanda_sellers_app/widgets/error_dialog_widget.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';

// import 'package:image_picker/image_picker.dart';
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  XFile? imageXFile;

  Position? position;
  List<Placemark>? placemarks;
  final ImagePicker _picker = ImagePicker();
  Future<void> _getImage() async {
    imageXFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      imageXFile;
    });
  }

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
        await placemarkFromCoordinates(position!.latitude, position!.longitude);
    Placemark pMark = placemarks![0];
    String completeAddress =
        '${pMark.subThoroughfare} ${pMark.thoroughfare}, ${pMark.subLocality} ${pMark.locality}, ${pMark.subAdministrativeArea},${pMark.administrativeArea} ${pMark.postalCode}, ${pMark.country}';
    locationController.text = completeAddress;
  }

  Future<void> formValidation() async {
    if (imageXFile == null) {
      showDialog(
        context: context,
        builder: (context) =>
            const ErrorDialogWidget(message: 'Please select an image'),
      );
    }

    if (nameController.text.trim().isNotEmpty &&
        emailController.text.trim().isNotEmpty &&
        phoneController.text.trim().isNotEmpty &&
        locationController.text.trim().isNotEmpty &&
        passwordController.text.trim().isNotEmpty &&
        confirmPasswordController.text.trim().isNotEmpty) {
      // start upload image to cloud storage
      if (passwordController.text.trim() ==
          confirmPasswordController.text.trim()) {
      } else {
        showDialog(
          context: context,
          builder: (context) =>
              const ErrorDialogWidget(message: 'Passwords do not match'),
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) =>
            const ErrorDialogWidget(message: 'Please enter all fields'),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    print("size: $size");
    return SingleChildScrollView(
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                _getImage();
              },
              child: CircleAvatar(
                radius: size.width * 0.20,
                backgroundColor: Colors.white,
                backgroundImage: imageXFile == null
                    ? null
                    : FileImage(File(imageXFile!.path)),
                child: imageXFile == null
                    ? Icon(
                        Icons.add_photo_alternate,
                        size: size.width * 0.20,
                        color: Colors.grey,
                      )
                    : null,
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextFieldWidget(
                    controller: nameController,
                    hintText: 'Name',
                    iconData: Icons.person,
                    isObserce: false,
                  ),
                  CustomTextFieldWidget(
                    controller: emailController,
                    hintText: 'Enail',
                    iconData: Icons.email,
                    isObserce: false,
                  ),
                  CustomTextFieldWidget(
                    controller: passwordController,
                    hintText: 'Password',
                    iconData: Icons.password,
                    isObserce: true,
                  ),
                  CustomTextFieldWidget(
                    controller: confirmPasswordController,
                    hintText: 'Confirm Password',
                    iconData: Icons.password,
                    isObserce: true,
                  ),
                  CustomTextFieldWidget(
                    controller: phoneController,
                    hintText: 'Phone Number',
                    iconData: Icons.phone,
                    isObserce: false,
                  ),
                  CustomTextFieldWidget(
                    controller: locationController,
                    hintText: 'Cafe/Restaurant Location',
                    iconData: Icons.my_location,
                    isObserce: false,
                    enabled: false,
                  ),
                  Container(
                    width: 400,
                    height: 40,
                    alignment: Alignment.center,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {
                        _determinePosition();
                      },
                      icon: const Icon(
                        Icons.location_on,
                        color: Colors.white,
                      ),
                      label: const Text(
                        'Get my current location',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () => formValidation(),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                padding:
                    const EdgeInsets.symmetric(horizontal: 90, vertical: 10),
              ),
              child: const Text(
                'Signup',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
