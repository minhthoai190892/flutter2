// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodpanda_sellers_app/global/global.dart';
import 'package:foodpanda_sellers_app/model/items_model.dart';

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

  void deleteItem() {
    firebaseFirestore
        .collection('sellers')
        .doc(sharedPreferences!.getString('uid'))
        .collection('menus')
        .doc(widget.model.menuId)
        .collection('items')
        .doc(widget.model.itemId)
        .delete()
        .then((value) {
      firebaseFirestore.collection('items').doc(widget.model.itemId).delete();
      Fluttertoast.showToast(msg: 'Item deleted successfully');
      Navigator.pop(context);
    });
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
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  deleteItem();
                },
                child: Container(
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
                      'Delete Item',
                      style: TextStyle(color: Colors.white, fontSize: 18),
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
