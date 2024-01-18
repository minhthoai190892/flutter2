import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:foodpanda_users_app/models/items_model.dart';
import 'package:foodpanda_users_app/widgets/items_design_widget.dart';
import '../global/global.dart';
import '../models/menus_model.dart';
import '../widgets/sellers_design_widget.dart';
import '../widgets/my_drawer_widget.dart';
import '../widgets/text_widget.dart';

class ItemsScreen extends StatefulWidget {
  const ItemsScreen({super.key});

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
      drawer: const MyDrawerWidget(),
      body: CustomScrollView(
        slivers: [
          const TextWidget(text: 'My Menus'),
          StreamBuilder(
            stream: firebaseFirestore
                .collection('sellers')
                .doc(sharedPreferences!.getString('uid'))
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
