// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:foodpanda_sellers_app/model/menus_model.dart';
import 'package:foodpanda_sellers_app/upload_screens/item_upload_screen.dart';

import '../global/global.dart';
import '../widgets/text_widget.dart';

class ItemScreen extends StatefulWidget {
  const ItemScreen({
    Key? key,
    required this.model,
  }) : super(key: key);
  final Menus model;
  @override
  State<ItemScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<ItemScreen> {
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
        title: Text(
          sharedPreferences!.getString('name')!,
          style: const TextStyle(
            fontSize: 30,
            color: Colors.white,
            fontFamily: 'Lobster',
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ItemUploadScreen(model: widget.model),
              ),
            ),
            icon: const Icon(
              Icons.library_add,
              color: Colors.cyan,
            ),
          ),
        ],
      ),
      // drawer: const MyDrawerWidget(),
      body: CustomScrollView(
        slivers: [
          TextWidget(text: "My ${widget.model.menuTitle}'s Items"),
        ],
      ),
    );
  }
}
