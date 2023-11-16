import 'package:api_news_app/models/article_model.dart';
import 'package:api_news_app/pages/all_news.dart';
import 'package:api_news_app/services/news.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../models/category_model.dart';
import '../models/slider_model.dart';
import '../services/data.dart';
import '../services/slider_data.dart';
import '../widgets/breaking_news_widget.dart';
import '../widgets/category_widget.dart';
import '../widgets/trending_news_info_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // initial list
  List<CategoryModel> categories = [];
  int activeIndex = 0;
  List<SliderModel> sliders = [];
  List<ArticleModel> articles = [];
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // get list of categories
    categories = getCategoryList();
    getNews();
    getSliders();
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
      isLoading = false;
    });
  }

  getSliders() async {
    Sliders slider = Sliders();
    await slider.getSlider();
    sliders = slider.sliders;
    print(sliders.length);
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
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: const ScrollPhysics(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildBanner(),
                  const BreakingNewsWidget(),
                  const SizedBox(
                    height: 30,
                  ),
                  buildCarousel(),
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Trending News!',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const AllNews(news: 'Trending'),
                              )),
                          child: const Text(
                            'View all',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                                color: Colors.blueAccent),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 300,
                    child: ListView.builder(
                      itemCount: articles.length,
                      itemBuilder: (context, index) {
                        return BlogTitle(
                            url: articles[index].url!,
                            imageUrl: articles[index].urlToImage!,
                            title: articles[index].title!,
                            description: articles[index].description!);
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  CarouselSlider buildCarousel() {
    return CarouselSlider.builder(
      itemCount: sliders.length,
      itemBuilder: (context, index, realIndex) {
        return Stack(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              child: Image.network(
                sliders[index].urlToImage!,
                fit: BoxFit.cover,
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
                sliders[index].title!,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            )
          ],
        );
      },
      options: CarouselOptions(
        height: 200,
        autoPlay: true,
        viewportFraction: 1,
        enlargeCenterPage: true,
        enlargeStrategy: CenterPageEnlargeStrategy.height,
        onPageChanged: (index, reason) {
          setState(() {
            activeIndex = index;
          });
        },
      ),
    );
  }

  SizedBox buildBanner() {
    return SizedBox(
      height: 100,
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
    );
  }
}
