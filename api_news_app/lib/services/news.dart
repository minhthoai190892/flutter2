import 'dart:convert';

import 'package:api_news_app/models/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];

  ///method get News from the api
  Future<void> getNews() async {
    String uri =
        'https://newsapi.org/v2/everything?q=tesla&from=2023-10-15&sortBy=publishedAt&apiKey=e03340835c3a415e81e77c96495aeec3';
    // get data
    var response = await http.get(Uri.parse(uri));
    //  Parses the string and returns the resulting Json object.
    var jsonData = json.decode(response.body);
    if (jsonData['status'] == 'ok') {
      for (var element in jsonData['articles']) {
         if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
            author: element['author'],
            title: element['title'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            content: element['content'],
          );
          // add to array
          news.add(articleModel);
        }
      }
      // jsonData['articles'].forEach((element) {
      //   if (element['urlToImage'] != null && element['description'] != null) {
      //     ArticleModel articleModel = ArticleModel(
      //       author: element['author'],
      //       title: element['title'],
      //       description: element['description'],
      //       url: element['url'],
      //       urlToImage: element['urlToImage'],
      //       content: element['content'],
      //     );
      //     // add to array
      //     news.add(articleModel);
      //   }
      // });
    }
  }
}
