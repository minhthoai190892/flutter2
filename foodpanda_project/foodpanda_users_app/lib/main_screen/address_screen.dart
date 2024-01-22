// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:foodpanda_users_app/main_screen/save_address_screen.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({
    Key? key,
    required this.totalAmount,
    required this.sellerId,
  }) : super(key: key);
  final double totalAmount;
  final String sellerId;

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        automaticallyImplyLeading: true,
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.cyan,
                Colors.amber,
              ],
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.mirror,
            ),
          ),
        ),
        backgroundColor: Colors.blue,
        title: const Text(
          'iFood',
          style: TextStyle(
            fontSize: 60,
            color: Colors.white,
            fontFamily: 'Lobster',
          ),
        ),
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                'Select Address: ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // add address
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SaveAddressScreen(),
              ));
        },
        icon: const Icon(
          Icons.add_location,
          color: Colors.white,
        ),
        backgroundColor: Colors.cyan,
        label: const Text(
          'Add New Address',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
