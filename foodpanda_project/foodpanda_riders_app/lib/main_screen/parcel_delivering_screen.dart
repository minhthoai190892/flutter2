// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foodpanda_riders_app/splash_screen/splash_screen.dart';

import '../global/global.dart';
import '../maps/map_utils.dart';

class ParcelDeliveringScreen extends StatefulWidget {
  const ParcelDeliveringScreen({
    Key? key,
    this.purchaserId,
    this.purchaserAddress,
    this.purchaserLat,
    this.purchaserLng,
    this.sellerId,
    this.getOrderId,
  }) : super(key: key);
  final String? purchaserId;
  final String? purchaserAddress;
  final double? purchaserLat;
  final double? purchaserLng;
  final String? sellerId;
  final String? getOrderId;
  @override
  State<ParcelDeliveringScreen> createState() => _ParcelDeliveringScreenState();
}

class _ParcelDeliveringScreenState extends State<ParcelDeliveringScreen> {
  confirmParcelHasBeenDelivered(getOrderId, sellerId, purchaserId,
      purchaserAddress, purchaserLat, purchaserLng) {
    firebaseFirestore.collection('orders').doc(getOrderId).update({
      'status': 'ended',
      'address': completeAddress,
      'lat': position!.latitude,
      'lng': position!.longitude,
      //pay per parcel delivery amount
      'earnings': ''
    }).then((value) {
      firebaseFirestore
          .collection('riders')
          .doc(sharedPreferences!.getString('uid'))
          .update({
        //total earning of rider
        'earnings': ''
      });
    }).then((value) {
      firebaseFirestore.collection('sellers').doc(widget.sellerId).update({
        //total earning amount of sellers
        'earnings': ''
      });
    }).then((value) {
      firebaseFirestore
          .collection('users')
          .doc(purchaserId)
          .collection('orders')
          .doc(getOrderId)
          .update({
        'status': 'ended',
        'riderUID': sharedPreferences!.getString('uid'),
      });
    });
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const MySplashScreen(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shipment Screen'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/confirm1.png'),
          const SizedBox(
            height: 5,
          ),
          GestureDetector(
            onTap: () {
              // show current Cafe/Restaurant Location
              MapUtils.lauchMapFromSourceToDestination(
                  sourceLat: position!.latitude,
                  sourceLng: position!.longitude,
                  destinationLat: widget.purchaserLat,
                  destinationLng: widget.purchaserLng);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/restaurant.png',
                  width: 50,
                ),
                const SizedBox(
                  width: 7,
                ),
                const Column(
                  children: [
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      'Show Cafe/Restaurant Location',
                      style: TextStyle(
                        fontFamily: 'Signatra',
                        fontSize: 16,
                        letterSpacing: 2,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              // confirmed - that riders has picked parcel from seller
              // riders location
              confirmParcelHasBeenDelivered(
                  widget.getOrderId,
                  widget.sellerId,
                  widget.purchaserId,
                  widget.purchaserAddress,
                  widget.purchaserLat,
                  widget.purchaserLng);
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
              child: const Center(
                child: Text(
                  'Order has been Delivered - Confirmed',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
