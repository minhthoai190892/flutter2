import 'dart:convert';

import 'package:api_news_app/models/show_category_model.dart';
import 'package:http/http.dart' as http;

import '../models/slider_model.dart';

class ShowCategoryNews {
  List<ShowCategoryModel> categories = [];

  ///method get News from the api

  Future<void> getCategoriesNews(String category) async {
    String uri =
        'https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=e03340835c3a415e81e77c96495aeec3';
    // get data
    var response = await http.get(Uri.parse(uri));
    //  Parses the string and returns the resulting Json object.
    var jsonData = json.decode(response.body);

    if (jsonData['status'] == 'ok') {
      for (var element in jsonData['articles']) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ShowCategoryModel showCategoryModel = ShowCategoryModel(
            author: element['author'],
            title: element['title'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            content: element['content'],
          );
          // add to array
          categories.add(showCategoryModel);
        }
      }
    }
  }
}
