// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:foodpanda_users_app/widgets/my_app_bar.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({
    Key? key,
    required this.sellerId,
  }) : super(key: key);
  final String? sellerId;
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBarWidget(sellerId: widget.sellerId),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SizedBox(
            width: 10,
          ),
          FloatingButtonWidget(
            onPressed: () {},
            text: 'Clear All',
            iconData: Icons.clear_all,
            color: Colors.cyan,
          ),
          FloatingButtonWidget(
            onPressed: () {},
            text: 'Check Out',
            iconData: Icons.navigate_next,
            color: Colors.cyan,
          ),
        ],
      ),
    );
  }
}

class FloatingButtonWidget extends StatelessWidget {
  const FloatingButtonWidget({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.iconData,
    required this.color,
  }) : super(key: key);
  final VoidCallback onPressed;
  final String text;
  final IconData iconData;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: FloatingActionButton.extended(
        onPressed: onPressed,
        label: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        backgroundColor: color,
        icon: Icon(iconData),
      ),
    );
  }
}

// 15/11