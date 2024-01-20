// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodpanda_users_app/global/global.dart';
import 'package:foodpanda_users_app/models/items_model.dart';
import 'package:foodpanda_users_app/widgets/cart_tiem_design_widget.dart';

import 'package:foodpanda_users_app/widgets/my_app_bar_widget.dart';
import 'package:foodpanda_users_app/widgets/progress_bar_widget.dart';
import 'package:provider/provider.dart';

import '../assistant_method/assistant_method.dart';
import '../assistant_method/cart_item_counter.dart';
import '../splash_screen/splash_screen.dart';
import '../widgets/text_widget.dart';

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
  List<int>? quantityNumber;
  final int a = 8;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    quantityNumber = separateItemQuantities();
  }

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
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) =>  CartScreen(sellerId: widget.sellerId),
                  //     ));
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
      body: CustomScrollView(
        slivers: [
          const TextWidget(text: 'Total Amount = 1200'),
          StreamBuilder(
            stream: firebaseFirestore
                .collection('items')
                .where('itemId', whereIn: separateItemIDs())
                .orderBy('publishedDate', descending: true)
                .snapshots(),
            builder: (context, snapshot) {
              return !snapshot.hasData
                  ? SliverToBoxAdapter(
                      child: Center(
                        child: circularProgress(),
                      ),
                    )
                  : snapshot.data!.docs.isEmpty
                      ? Container()
                      : SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              ItemsModel model = ItemsModel.fromMap(
                                  snapshot.data!.docs[index].data());

                              return CartItemDesignWidget(
                                  model: model,
                                  quantity: quantityNumber![index],
                                  context: context);
                            },
                            childCount: snapshot.hasData
                                ? snapshot.data!.docs.length
                                : 0,
                          ),
                        );
            },
          )
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SizedBox(
            width: 10,
          ),
          FloatingButtonWidget(
            onPressed: () {
              clearCartNow(context);
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MySplashScreen(),
                  ));
              Fluttertoast.showToast(msg: 'Cart has been cleared');
            },
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