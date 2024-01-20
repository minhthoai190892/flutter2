// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:foodpanda_users_app/assistant_method/cart_item_counter.dart';
import 'package:foodpanda_users_app/main_screen/cart_screen.dart';

class MyAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBarWidget({
    Key? key,
    this.sellerId,
  }) : super(key: key);
  final String? sellerId;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.white),
      automaticallyImplyLeading: true,
      centerTitle: true,
      flexibleSpace: Container(
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
      ),
      actions: [
        Stack(
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  CartScreen(sellerId: sellerId),
                    ));
              },
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.cyan,
              ),
            ),
            const Icon(
              Icons.brightness_1,
              size: 20,
              color: Colors.green,
            ),
            Positioned(
              left: 5,
              child: Center(
                child: Consumer<CartItemCounter>(
                  builder: (context, value, child) => Text(
                    value.count.toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
      backgroundColor: Colors.blue,
      title: const Text(
        'iFood',
        style: TextStyle(
          fontSize: 40,
          color: Colors.white,
          fontFamily: 'Signatra',
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
