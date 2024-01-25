// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodpanda_users_app/models/address_model.dart';
import 'package:foodpanda_users_app/widgets/shipment_address_design_widget.dart';
import 'package:foodpanda_users_app/widgets/status_banner_widget.dart';
import 'package:intl/intl.dart';

import '../global/global.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({
    Key? key,
    required this.orderId,
  }) : super(key: key);
  final String orderId;
  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  String ordersStatus = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: FirebaseFirestore.instance
              .collection("users")
              .doc(sharedPreferences!.getString("uid"))
              .collection("orders")
              .doc(widget.orderId)
              .get(),
          builder: (context, snapshot) {
            Map<String, dynamic> dataMap = {};
            if (snapshot.hasData) {
              dataMap = snapshot.data!.data()!;
              ordersStatus = dataMap['status'];
            }
            return snapshot.hasData
                ? Container(
                    child: Column(
                      children: [
                        StatusBannerWidget(
                            status: dataMap['isSuccess'],
                            orderStatus: ordersStatus),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '\$ ${dataMap['totalAmount']}',
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Order Id: ${dataMap['orderId']}',
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Order at: ${DateFormat("dd MMMM, yyyy - hh:mm aa").format(DateTime.fromMicrosecondsSinceEpoch(int.parse(dataMap['orderTime'])))}',
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ),
                        const Divider(
                          thickness: 4,
                        ),
                        ordersStatus == 'ended'
                            ? Image.asset('assets/images/delivered.jpg')
                            : Image.asset('assets/images/state.jpg'),
                        const Divider(
                          thickness: 4,
                        ),
                        FutureBuilder(
                          future: firebaseFirestore
                              .collection('users')
                              .doc(sharedPreferences!.getString('uid'))
                              .collection('userAddresss')
                              .doc(dataMap['addressID'])
                              .get(),
                          builder: (context, snapshotAddress) {
                            return snapshotAddress.hasData
                                ? ShipmentAddressDesignWidget(
                                    model: AddressModel.fromMap(
                                        snapshotAddress.data!.data()!))
                                : Center(
                                    child: CircularProgressIndicator(),
                                  );
                          },
                        )
                      ],
                    ),
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ),
      ),
    );
  }
}
