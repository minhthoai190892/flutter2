import 'package:api_news_app/constraints/image_manager.dart';
import 'package:api_news_app/models/category_model.dart';
import 'package:api_news_app/models/slider_model.dart';
import 'package:api_news_app/services/slider_data.dart';
import 'package:api_news_app/widgets/category_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildBanner(),

          
          BreakingNews(),
          const SizedBox(
            height: 30,
          ),
          buildCarosel(),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: AnimatedSmoothIndicator(
                activeIndex: activeIndex, count: sliders.length),
          ),
          const SizedBox(
            height: 30,
          ),
          TrendingNews(),
          const SizedBox(
            height: 10,
          ),
          const SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: ScrollPhysics(),
            child: Column(
              children: [
                TrendingNewsInfo(),
                TrendingNewsInfo(),
                TrendingNewsInfo(),
                TrendingNewsInfo(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  CarouselSlider buildCarosel() {
    return CarouselSlider.builder(
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
            },
          ),
        );
  }

  ListView buildBanner() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return CategoryTitle(
            categoryName: categories[index].categoryName.toString(),
            image: categories[index].image.toString());
      },
    );
  }
}

class TrendingNews extends StatelessWidget {
  const TrendingNews({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Trending News!',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          Text(
            'View all',
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.normal,
                color: Colors.blueAccent),
          ),
        ],
      ),
    );
  }
}

class BreakingNews extends StatelessWidget {
  const BreakingNews({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Breaking News!',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: 'Pacifico'),
          ),
          Text(
            'View all',
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.normal,
                color: Colors.blueAccent),
          ),
        ],
      ),
    );
  }
}

class TrendingNewsInfo extends StatelessWidget {
  const TrendingNewsInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        elevation: 3.0,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Image.asset(ImageManager.imageSports,
                  fit: BoxFit.cover, width: 150, height: 150),
            ),
            const SizedBox(
              width: 5,
            ),
            Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: const Text(
                    'The edge of the RenderFlex that is he edge of the RenderFlex t',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: const Text(
                    'The edge of the RenderFlex that is he edge of the RenderFlex tThe edge of the RenderFlex that is he edge of the RenderFlex tThe edge of the RenderFlex that is he edge of the RenderFlex t',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
