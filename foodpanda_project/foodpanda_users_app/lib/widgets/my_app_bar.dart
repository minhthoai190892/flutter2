
import 'package:flutter/material.dart';

import '../main_screen/item_detail_screen.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    super.key,
    required this.widget,
  });

  final ItemDetailScreen widget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      ),
      // drawer: const MyDrawerWidget(),
    
      body: Column(
        children: [
          SizedBox(
            height: 300,
            child: Image.network(widget.model.thumbnailUrl),
          ),
          Text(widget.model.title)
        ],
      ),
    );
  }
}
