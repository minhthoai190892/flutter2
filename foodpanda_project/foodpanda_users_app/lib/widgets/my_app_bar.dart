
import 'package:flutter/material.dart';

class MyAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBarWidget({
    super.key,
  });

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
              onPressed: () {},
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
            const Positioned(
              left: 5,
              child: Center(
                child: Text(
                  '0',
                  style: TextStyle(color: Colors.white, fontSize: 12),
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

  Size get preferredSize =>  const Size.fromHeight(kToolbarHeight);
}
