// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PlacedOrderScreen(
                        addressId: widget.addressId,
                        totalAmount: widget.totalAmount,
                        sellerID: widget.sellerID,
                      ),
                    ));
              },
              child: const Text('Place Order'),
            )
          ],
        ),
      ),
    );
  }
}
