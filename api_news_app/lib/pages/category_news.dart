// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_news_app/pages/article_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:api_news_app/models/category_model.dart';
import 'package:api_news_app/models/show_category_model.dart';

import '../services/show_category_news.dart';

class CategoryNews extends StatefulWidget {
  const CategoryNews({
    Key? key,
    required this.name,
  }) : super(key: key);
  final String name;
  @override
  State<CategoryNews> createState() => CategoryNewsState();
}

class CategoryNewsState extends State<CategoryNews> {
  List<ShowCategoryModel> categories = [];
  bool isLoading = true;
  getCategory() async {
    ShowCategoryNews categoryNews = ShowCategoryNews();
    await categoryNews.getCategoriesNews(widget.name);
    categories = categoryNews.categories;
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategory();
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
              widget.name,
              style: const TextStyle(color: Colors.blueAccent),
            )
          ],
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: categories.length,
          itemBuilder: (context, index) => ShowCategory(
              url: categories[index].url!,
              image: categories[index].urlToImage!,
              description: categories[index].description!,
              title: categories[index].title!),
        ),
      ),
    );
  }
}

class ShowCategory extends StatelessWidget {
  const ShowCategory({
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
