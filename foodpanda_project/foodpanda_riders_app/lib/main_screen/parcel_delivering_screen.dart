// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foodpanda_riders_app/splash_screen/splash_screen.dart';

import '../global/global.dart';
import '../maps/map_utils.dart';

class ParcelDeliveringScreen extends StatefulWidget {
  ParcelDeliveringScreen({
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
  String? sellerId;
  final String? getOrderId;
  @override
  State<ParcelDeliveringScreen> createState() => _ParcelDeliveringScreenState();
}

class _ParcelDeliveringScreenState extends State<ParcelDeliveringScreen> {
  String orderTotalAmount = '';
  confirmParcelHasBeenDelivered(getOrderId, sellerId, purchaserId,
      purchaserAddress, purchaserLat, purchaserLng) {
    String riderNewTotalEarningAmount = (double.parse(previousRiderEarnings) +
            double.parse(perParcelDeliveryAmount))
        .toString();
    firebaseFirestore.collection('orders').doc(getOrderId).update({
      'status': 'ended',
      'address': completeAddress,
      'lat': position!.latitude,
      'lng': position!.longitude,
      //pay per parcel delivery amount
      'earnings': perParcelDeliveryAmount
    }).then((value) {
      firebaseFirestore
          .collection('riders')
          .doc(sharedPreferences!.getString('uid'))
          .update({
        //total earning of rider
        'earnings': riderNewTotalEarningAmount
      });
    }).then((value) {
      firebaseFirestore.collection('sellers').doc(widget.sellerId).update({
        //total earning amount of sellers
        'earnings':
            (double.parse(orderTotalAmount) + double.parse(previousEarnings))
                .toString()
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

  getOrderTotalAmount() {
    firebaseFirestore
        .collection('orders')
        .doc(widget.getOrderId)
        .get()
        .then((value) {
      orderTotalAmount = value.data()!['totalAmount'].toString();
      // cap nhat seller id
      widget.sellerId = value.data()!['sellerUID'].toString();
    }).then((value) {
      getSellerData();
    });
  }

  getSellerData() {
    firebaseFirestore
        .collection('sellers')
        .doc(widget.sellerId)
        .get()
        .then((value) {
      previousEarnings = value.data()!['earnings'].toString();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getOrderTotalAmount();
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
          Image.asset('assets/images/confirm2.png'),
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
                      'Show Delivery Drop-off Location',
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
           const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () => Navigator.pop(context),
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
                  'Go Back',
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
