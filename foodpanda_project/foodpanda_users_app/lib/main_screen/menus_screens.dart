// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:foodpanda_users_app/models/sellers_model.dart';

import 'package:foodpanda_users_app/widgets/menus_design_widget.dart';

import '../global/global.dart';
import '../models/menus_model.dart';
import '../widgets/my_drawer_widget.dart';
import '../widgets/sellers_design_widget.dart';
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
            fontSize: 30,
            color: Colors.white,
            fontFamily: 'Lobster',
          ),
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                onPressed: () {
                  // send user to cart screen

                  //   Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const MenusUploadScreen(),
                  //   ),
                  // );
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
      ),
      drawer: const MyDrawerWidget(),
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
                          onTap: () {},
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
