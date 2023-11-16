// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_news_app/pages/article_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../models/article_model.dart';
import '../models/slider_model.dart';
import '../services/news.dart';
import '../services/slider_data.dart';

class AllNews extends StatefulWidget {
  const AllNews({
    Key? key,
    required this.news,
  }) : super(key: key);
  final String news;

  @override
  State<AllNews> createState() => _AllNewsState();
}

class _AllNewsState extends State<AllNews> {
  List<SliderModel> sliders = [];
  List<ArticleModel> articles = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // get list of categories
    // categories = getCategoryList();
    getNews();
    getSliders();
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
      // isLoading = false;
    });
  }

  getSliders() async {
    Sliders slider = Sliders();
    await slider.getSlider();
    sliders = slider.sliders;
    setState(() {
      // isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${widget.news} News",
              style: const TextStyle(color: Colors.blueAccent),
            )
          ],
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(8),
        child: ListView.builder(
          itemCount:
              widget.news == 'Breaking' ? sliders.length : articles.length,
          itemBuilder: (context, index) => AllNewsSection(
            url: widget.news == 'Breaking'
                ? sliders[index].url!
                : articles[index].url!,
            image: widget.news == 'Breaking'
                ? sliders[index].urlToImage!
                : articles[index].urlToImage!,
            description: widget.news == 'Breaking'
                ? sliders[index].description!
                : articles[index].description!,
            title: widget.news == 'Breaking'
                ? sliders[index].title!
                : articles[index].title!,
          ),
        ),
      ),
    );
  }
}

class AllNewsSection extends StatelessWidget {
  const AllNewsSection({
    Key? key,
    required this.image,
    required this.description,
    required this.title,
    required this.url,
  }) : super(key: key);
  final String image;
  final String description;
  final String title;
  final String url;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ArticleView(blogUrl: url),
            ));
      },
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl: image,
              width: MediaQuery.of(context).size.width,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Text(description),
        ],
      ),
    );
  }
}
