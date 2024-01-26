// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../models/address_model.dart';

class ShipmentAddressDesignWidget extends StatelessWidget {
  const ShipmentAddressDesignWidget({
    Key? key,
    required this.model,
    this.orderStatus,
  }) : super(key: key);
  final AddressModel model;
  final String? orderStatus;
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
