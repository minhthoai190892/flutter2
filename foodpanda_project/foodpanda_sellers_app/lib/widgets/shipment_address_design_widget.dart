// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:foodpanda_sellers_app/splash_screen/splash_screen.dart';

import '../model/address_model.dart';

class ShipmentAddressDesignWidget extends StatelessWidget {
  const ShipmentAddressDesignWidget({
    Key? key,
    required this.model,
    this.orderStatus,
    this.orderId,
    this.sellerId,
    this.orderByUser,
  }) : super(key: key);
  final AddressModel model;
  final String? orderStatus;
  final String? orderId;
  final String? sellerId;
  final String? orderByUser;

  void confirmedParcelShipment(
      {required BuildContext context,
      required String getOrderId,
      required String sellerId,
      required String purchaserId}) {}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Shipping Details',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 5),
            width: MediaQuery.of(context).size.width,
            child: Table(
              children: [
                TableRow(
                  children: [
                    const Text(
                      'Name: ',
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(model.name)
                  ],
                ),
                TableRow(
                  children: [
                    const Text(
                      'Phone Number: ',
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(model.phoneNumber)
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            model.fullAddress,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(
            height: 10,
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              orderStatus == 'ended'
                  ? Navigator.pop(context)
                  : Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MySplashScreen(),
                      ));
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
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
              child: Center(
                child: Text(
                  orderStatus == 'ended' ? 'Go Back' : 'Order Packing - Done',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
