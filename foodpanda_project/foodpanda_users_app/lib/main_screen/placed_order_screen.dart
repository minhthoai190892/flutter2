// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodpanda_users_app/assistant_method/assistant_method.dart';
import 'package:foodpanda_users_app/global/global.dart';
import 'package:foodpanda_users_app/main_screen/home_screen.dart';

class PlacedOrderScreen extends StatefulWidget {
  const PlacedOrderScreen({
    Key? key,
    required this.addressId,
    required this.totalAmount,
    required this.sellerID,
  }) : super(key: key);
  final String addressId;
  final double totalAmount;
  final String sellerID;
  @override
  State<PlacedOrderScreen> createState() => _PlacedOrderScreenState();
}

class _PlacedOrderScreenState extends State<PlacedOrderScreen> {
  String orderId = DateTime.now().microsecondsSinceEpoch.toString();
  addOrderDetails() {
    writeOrderDetailsForUser({
      'addressID': widget.addressId,
      'totalAmount': widget.totalAmount,
      'orderBy': sharedPreferences!.getString('uid'),
      'productIDs': sharedPreferences!.getStringList('userCart'),
      'paymentDetails': 'Cash on Delivery',
      'orderTime': orderId,
      'isSuccess': true,
      'sellerUID': widget.sellerID,
      'riderUID': '',
      'status': 'normal',
      'orderId': orderId,
    });
    writeOrderDetailsForSeller({
      'addressID': widget.addressId,
      'totalAmount': widget.totalAmount,
      'orderBy': sharedPreferences!.getString('uid'),
      'productIDs': sharedPreferences!.getStringList('userCart'),
      'paymentDetails': 'Cash on Delivery',
      'orderTime': orderId,
      'isSuccess': true,
      'sellerUID': widget.sellerID,
      'riderUID': '',
      'status': 'normal',
      'orderId': orderId,
    }).whenComplete(() {
      clearCartNow(context);
      setState(() {
        orderId = '';
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ));
        Fluttertoast.showToast(
            msg: 'Congratulations, Order has been placed successfully');
      });
    });
  }

  Future writeOrderDetailsForUser(Map<String, dynamic> data) async {
    await firebaseFirestore
        .collection('users')
        .doc(sharedPreferences!.getString('uid'))
        .collection('orders')
        .doc(orderId)
        .set(data);
  }

  Future writeOrderDetailsForSeller(Map<String, dynamic> data) async {
    await firebaseFirestore.collection('orders').doc(orderId).set(data);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/delivery.jpg'),
            const SizedBox(
              height: 12,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.cyan),
              onPressed: () {
                addOrderDetails();
              },
              child: const Text('Place Order'),
            )
          ],
        ),
      ),
    );
  }
}
