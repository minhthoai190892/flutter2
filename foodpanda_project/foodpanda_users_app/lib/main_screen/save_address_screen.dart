import 'package:flutter/material.dart';
import 'package:foodpanda_users_app/widgets/text_field_widget.dart';

import '../widgets/simple_app_bar_widget.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SimpleAppBar(),
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
        onPressed: () {},
        label: const Text('Save Now'),
        icon: const Icon(Icons.save),
      ),
    );
  }
}
