// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:foodpanda_riders_app/assistant_method/get_current_user_location.dart';
import 'package:foodpanda_riders_app/global/global.dart';
import 'package:foodpanda_riders_app/main_screen/parcel_picking_screen.dart';

import '../models/address_model.dart';

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
      required String purchaserId}) {
    firebaseFirestore.collection('orders').doc(getOrderId).update({
      'riderUID': sharedPreferences!.getString('uid'),
      'riderName': sharedPreferences!.getString('name'),
      'status': 'picking',
      'lat': position!.latitude,
      'lng': position!.longitude,
      'address': completeAddress,
    });
    // send rider to shipment
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ParcelPickingScreen(
              purchaserId: purchaserId,
              purchaserAddress: model.fullAddress,
              sellerId: sellerId,
              getOrderId: getOrderId,
              purchaserLat: model.lat,
              purchaserLng: model.lng),
        ));
  }

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
          orderStatus == 'ended'
              ? Container()
              : InkWell(
                  onTap: () {
                    GetCurrentUserLocation.determinePosition();

                    confirmedParcelShipment(
                        context: context,
                        getOrderId: orderId!,
                        sellerId: sellerId!,
                        purchaserId: orderByUser!);
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
                        'Confirm - To Deliver this Parcel',
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
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
