// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:foodpanda_users_app/models/items_model.dart';
import 'package:number_inc_dec/number_inc_dec.dart';
import 'package:provider/provider.dart';

import '../assistant_method/assistant_method.dart';
import '../assistant_method/cart_item_counter.dart';
import 'cart_screen.dart';

class ItemDetailScreen extends StatefulWidget {
  const ItemDetailScreen({
    Key? key,
    required this.model,
  }) : super(key: key);
  final ItemsModel model;
  @override
  State<ItemDetailScreen> createState() => _ItemDetailScreenState();
}

class _ItemDetailScreenState extends State<ItemDetailScreen> {
  final TextEditingController counterController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
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
                      builder: (context) =>  CartScreen(sellerId: widget.model.sellerUID),
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
    ),
      // drawer: const MyDrawerWidget(),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(widget.model.thumbnailUrl),
              NumberInputPrefabbed.roundedButtons(
                controller: counterController,
                incDecBgColor: Colors.amber,
                min: 1,
                max: 9,
                initialValue: 1,
                buttonArrangement: ButtonArrangement.incLeftDecRight,
              ),
              Text(
                widget.model.title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.model.longDescription,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.justify,
              ),
              Text(
                '\$ ${widget.model.price}',
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.justify,
              ),
              InkWell(
                onTap: () {
                  int itemCounter = int.parse(counterController.text);
                  // 1. check if item exist already in cart
                  List<String> separateItemsIDList = separateItemIDs();
                  separateItemsIDList.contains(widget.model.itemId)
                      ? Fluttertoast.showToast(msg: 'Item is already in Cart')
                      :
                      // 2. add to cart
                      addItemToCart(
                           widget.model.itemId,
                          context,
                          itemCounter);
                },
                child: Container(
                  width: double.infinity,
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
                      'Add to Cart',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
