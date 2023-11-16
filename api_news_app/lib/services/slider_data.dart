import 'dart:convert';


import 'package:http/http.dart' as http;

import '../models/slider_model.dart';

class Sliders {
  List<SliderModel> sliders = [];

  ///method get News from the api

  Future<void> getSlider() async {
   String uri ='https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=e03340835c3a415e81e77c96495aeec3';
     // get data
    var response = await http.get(Uri.parse(uri));
    //  Parses the string and returns the resulting Json object.
    var jsonData = json.decode(response.body);

    if (jsonData['status'] == 'ok') {
      for (var element in jsonData['articles']) {
        if (element['urlToImage'] != null && element['description'] != null) {
          SliderModel sliderModel = SliderModel(
            author: element['author'],
            title: element['title'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            content: element['content'],
          );
          // add to array
          sliders.add(sliderModel);
        }
      }
    }
  }
}
