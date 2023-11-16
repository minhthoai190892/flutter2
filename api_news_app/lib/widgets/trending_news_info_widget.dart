// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_news_app/pages/article_view.dart';
import 'package:flutter/material.dart';

import '../constraints/image_manager.dart';

class BlogTitle extends StatelessWidget {
  const BlogTitle({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.url,
  }) : super(key: key);
  final String imageUrl;
  final String title;
  final String description;
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Material(
          borderRadius: BorderRadius.circular(10),
          elevation: 3.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(imageUrl,
                  fit: BoxFit.cover, width: 150, height: 150),
              const SizedBox(
                width: 5,
              ),
              Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      title,
                      style: const TextStyle(
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
                    child: Text(
                      description,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
