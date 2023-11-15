// To parse this JSON data, do
//
//     final articleModel = articleModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ArticleModel articleModelFromJson(String str) =>
    ArticleModel.fromJson(json.decode(str));

String articleModelToJson(ArticleModel data) => json.encode(data.toJson());

class ArticleModel {
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
 
  final String? content;

  ArticleModel({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
   
    required this.content,
  });

  ArticleModel copyWith({
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    DateTime? publishedAt,
    String? content,
  }) =>
      ArticleModel(
        author: author ?? this.author,
        title: title ?? this.title,
        description: description ?? this.description,
        url: url ?? this.url,
        urlToImage: urlToImage ?? this.urlToImage,
      
        content: content ?? this.content,
      );

  factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel(
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
       
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
      
        "content": content,
      };
}
