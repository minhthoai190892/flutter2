import 'dart:io';

import 'package:flutter/material.dart';
import 'package:foodpanda_sellers_app/widgets/custom_text_field_widget.dart';
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
  final ImagePicker _picker = ImagePicker();
  Future<void> _getImage() async {
    imageXFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      imageXFile;
    });
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
                        print('Get my current location');
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
              onPressed: () => print('Signup'),
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
