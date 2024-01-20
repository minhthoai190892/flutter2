// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:foodpanda_users_app/models/menus_model.dart';
import 'package:foodpanda_users_app/widgets/my_app_bar_widget.dart';

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
      appBar: const MyAppBarWidget(),
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
