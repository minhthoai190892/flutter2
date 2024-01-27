// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ShipmentScreen extends StatelessWidget {
  const ShipmentScreen({
    Key? key,
    required this.purchaserId,
    required this.purchaserAddress,
    required this.sellerId,
    required this.getOrderId,
    required this.purchaserLat,
    required this.purchaserLng,
  }) : super(key: key);
  final String purchaserId;
  final String purchaserAddress;
  final String sellerId;
  final String getOrderId;
  final double purchaserLat;
  final double purchaserLng;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
