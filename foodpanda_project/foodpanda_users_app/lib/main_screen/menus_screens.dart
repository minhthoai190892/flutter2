// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:foodpanda_users_app/models/sellers_model.dart';
import 'package:foodpanda_users_app/widgets/menus_design_widget.dart';
import 'package:foodpanda_users_app/widgets/my_app_bar_widget.dart';

import '../global/global.dart';
import '../models/menus_model.dart';
import '../widgets/text_widget.dart';

class MenusScreen extends StatefulWidget {
  const MenusScreen({
    Key? key,
    required this.model,
  }) : super(key: key);
  final SellersModel model;

  @override
  State<MenusScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<MenusScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBarWidget(),
      // drawer: const MyDrawerWidget(),
      body: CustomScrollView(
        slivers: [
          TextWidget(text: '${widget.model.sellerName} Menus'),
          StreamBuilder(
            stream: firebaseFirestore
                .collection('sellers')
                .doc(widget.model.sellerUID)
                .collection('menus')
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
                        MenusModel model = MenusModel.fromMap(
                          snapshot.data!.docs[index].data(),
                        );
                        return MenusDesignWidget(
                          model: model,
                          context: context,
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
