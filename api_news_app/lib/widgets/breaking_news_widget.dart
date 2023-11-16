import 'package:api_news_app/pages/all_news.dart';
import 'package:flutter/material.dart';

class BreakingNewsWidget extends StatelessWidget {
  const BreakingNewsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Breaking News!',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: 'Pacifico'),
          ),
          GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AllNews(news: 'Breaking'),
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
    );
  }
}
