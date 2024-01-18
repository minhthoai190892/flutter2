// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:foodpanda_users_app/models/menus_model.dart';

import '../global/global.dart';
import '../models/items_model.dart';
import '../widgets/items_design_widget.dart';
import '../widgets/text_widget.dart';

class ItemsScreen extends StatefulWidget {
  const ItemsScreen({
    Key? key,
    required this.model,
  }) : super(key: key);
  final MenusModel model;
  @override
  State<ItemsScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<ItemsScreen> {
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
      body: CustomScrollView(
        slivers: [
          TextWidget(text: 'Items of ${widget.model.menuTitle}\'s Item'),
          StreamBuilder(
            stream: firebaseFirestore
                .collection('sellers')
                .doc(widget.model.sellersUid)
                .collection('menus')
                .doc(widget.model.menuId)
                .collection('items')
                .orderBy(
                  'publishedDate',
                  descending: true,
                )
                .snapshots(),
            builder: (context, snapshot) {
              return !snapshot.hasData
                  ? const SliverToBoxAdapter(
                      child: CircularProgressIndicator(),
                    )
                  : SliverStaggeredGrid.countBuilder(
                      crossAxisCount: 1,
                      staggeredTileBuilder: (index) =>
                          const StaggeredTile.fit(1),
                      itemBuilder: (context, index) {
                        ItemsModel model = ItemsModel.fromMap(
                          snapshot.data!.docs[index].data(),
                        );
                        return ItemsDesignWidget(
                          onTap: () {},
                          context: context,
                          model: model,
                        );
                      },
                      itemCount: snapshot.data!.docs.length,
                    );
            },
          ),
        ],
      ),
    );
  }
}
