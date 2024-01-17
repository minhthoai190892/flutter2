import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../global/global.dart';
import 'item_screen.dart';
import '../model/menus_model.dart';
import '../upload_screens/item_upload_screen.dart';
import '../upload_screens/munus_upload_screens.dart';
import '../widgets/info_design_widget.dart';
import '../widgets/my_drawer.dart';

import '../widgets/text_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                builder: (context) => const MenusUploadScreen(),
              ),
            ),
            icon: const Icon(
              Icons.post_add,
              color: Colors.cyan,
            ),
          ),
        ],
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
                        Menus model = Menus.fromMap(
                          snapshot.data!.docs[index].data(),
                        );
                        return InfoDesignWidget(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ItemScreen(model: model),
                              )),
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
