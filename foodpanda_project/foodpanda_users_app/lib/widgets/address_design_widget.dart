// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:foodpanda_users_app/assistant_method/address_changer.dart';
import 'package:foodpanda_users_app/main_screen/placed_order_screen.dart';
import 'package:foodpanda_users_app/maps/maps.dart';

import 'package:foodpanda_users_app/models/address_model.dart';
import 'package:provider/provider.dart';

class AddressDesignWidget extends StatefulWidget {
  const AddressDesignWidget({
    Key? key,
    required this.model,
    required this.currentIndex,
    required this.value,
    required this.addressId,
    required this.totalAmount,
    required this.sellerID,
  }) : super(key: key);
  final AddressModel model;
  final int currentIndex;
  final int value;
  final String addressId;
  final double totalAmount;
  final String sellerID;
  @override
  State<AddressDesignWidget> createState() => _AddressDesignWidgetState();
}

class _AddressDesignWidgetState extends State<AddressDesignWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //  select the address
        Provider.of<AddressChanger>(context, listen: false)
            .displayResult(widget.value);
      },
      child: Card(
        child: Column(
          children: [
            Row(
              children: [
                Radio(
                  activeColor: Colors.amber,
                  value: widget.value,
                  groupValue: widget.currentIndex,
                  onChanged: (value) {
                    print(value);
                    // provider
                    Provider.of<AddressChanger>(context, listen: false)
                        .displayResult(value);
                  },
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      padding: const EdgeInsets.all(10),
                      child: Table(
                        children: [
                          TableRow(
                            children: [
                              const Text(
                                'Name: ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(widget.model.name),
                            ],
                          ),
                          TableRow(
                            children: [
                              const Text(
                                'Phone Number: ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(widget.model.phoneNumber),
                            ],
                          ),
                          TableRow(
                            children: [
                              const Text(
                                'Flat Number: ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(widget.model.flatNumber),
                            ],
                          ),
                          TableRow(
                            children: [
                              const Text(
                                'City: ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(widget.model.city),
                            ],
                          ),
                          TableRow(
                            children: [
                              const Text(
                                'State: ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(widget.model.state),
                            ],
                          ),
                          TableRow(
                            children: [
                              const Text(
                                'Full Address: ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(widget.model.fullAddress),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
            ElevatedButton(
              onPressed: () {
                MapsUtils.openMapWithPosition(
                    widget.model.lat, widget.model.long);
                // MapsUtils.openMapWithAddress(widget.model.fullAddress);
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black54),
              child: const Text(
                'Click on Maps',
                style: TextStyle(color: Colors.white),
              ),
            ),
            widget.value == Provider.of<AddressChanger>(context).count
                ? ElevatedButton(
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
                    child: const Text('Proceed'),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
