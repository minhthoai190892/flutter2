import 'package:api_news_app/constraints/image_manager.dart';
import 'package:api_news_app/models/category_model.dart';
import 'package:api_news_app/models/slider_model.dart';
import 'package:api_news_app/services/slider_data.dart';
import 'package:api_news_app/widgets/category_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../services/data.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // initial list
  List<CategoryModel> categories = [];
  List<SliderModel> sliders = [];
  int activeIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // get list of categories
    categories = getCategoryList();
    sliders = getSliders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // elevation: 0.0,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Flutter '),
            Text(
              'News',
              style: TextStyle(color: Colors.blueAccent),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          CarouselSlider.builder(
            itemCount: sliders.length,
            itemBuilder: (context, index, realIndex) {
              return Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    child: Image.asset(
                      sliders[index].image.toString(),
                      fit: BoxFit.contain,
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                  Container(
                    height: 200,
                    padding: const EdgeInsets.only(left: 10),
                    margin: const EdgeInsets.only(top: 170),
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(color: Colors.black26),
                    child: Text(
                      sliders[index].name.toString(),
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              );
            },
            options: CarouselOptions(
              height: 200,
              autoPlay: true,
              viewportFraction: 1,
              // enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
              onPageChanged: (index, reason) {
                setState(() {
                  activeIndex = index;
                });
                print(activeIndex);
              },
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Flexible(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return CategoryTitle(
                    categoryName: categories[index].categoryName.toString(),
                    image: categories[index].image.toString());
              },
            ),
          ),
        ],
      ),
    );
  }
}
