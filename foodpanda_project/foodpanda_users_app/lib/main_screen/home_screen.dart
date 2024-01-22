import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:foodpanda_users_app/assistant_method/assistant_method.dart';
import 'package:foodpanda_users_app/main_screen/menus_screens.dart';
import 'package:foodpanda_users_app/models/sellers_model.dart';
import 'package:foodpanda_users_app/widgets/sellers_design_widget.dart';
import 'package:foodpanda_users_app/widgets/my_drawer_widget.dart';

import '../global/global.dart';
import '../slider_data/slider_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List sliderList = sliders;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // clearCartNow(context);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
            fontSize: 60,
            color: Colors.white,
            fontFamily: 'Lobster',
          ),
        ),
      ),
      drawer: const MyDrawerWidget(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                height: size.height * 0.3,
                width: size.width,
                child: CarouselSlider(
                    items: sliderList
                        .map(
                          (index) => Container(
                            decoration:
                                const BoxDecoration(color: Colors.black),
                            child: Padding(
                              padding: const EdgeInsets.all(4),
                              child: Image.asset(
                                index,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                    options: CarouselOptions(
                      height: size.height * 0.3,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.8,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.decelerate,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.3,
                      // onPageChanged: callbackFunction,
                      scrollDirection: Axis.horizontal,
                    )),
              ),
            ),
          ),
          StreamBuilder(
            stream: firebaseFirestore.collection('sellers').snapshots(),
            builder: (context, snapshot) {
              return !snapshot.hasData
                  ? const SliverToBoxAdapter(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : SliverStaggeredGrid.countBuilder(
                      crossAxisCount: 1,
                      staggeredTileBuilder: (index) =>
                          const StaggeredTile.fit(1),
                      itemBuilder: (context, index) {
                        SellersModel model = SellersModel.fromMap(
                            snapshot.data!.docs[index].data());
                        return SellersDesignWidget(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      MenusScreen(model: model),
                                )),
                            model: model,
                            context: context);
                      },
                      itemCount: snapshot.data!.docs.length);
            },
          ),
        ],
      ),
    );
  }
}
