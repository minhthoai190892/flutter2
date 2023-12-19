// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class Post {
  final String description;
  final String uid;
  final String username;
  final String postId;
  final datePublished;
  final String postUrl;
  final String profImage;
  final likes;

  Post({
    required this.description,
    required this.uid,
    required this.username,
    required this.postId,
    required this.datePublished,
    required this.postUrl,
    required this.profImage,
    required this.likes,
  });

  // Posts copyWith({
  //   String? description,
  //   String? uid,
  //   String? username,
  //   String? postId,
  //   String? datePublished,
  //   List? postUrl,
  //   List? profImage,
  // }) {
  //   return Posts(
  //     description: description ?? this.description,
  //     uid: uid ?? this.uid,
  //     username: username ?? this.username,
  //     postId: postId ?? this.postId,
  //     datePublished: datePublished ?? this.datePublished,
  //     postUrl: postUrl ?? this.postUrl,
  //     profImage: profImage ?? this.profImage,
  //   );
  // }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'description': description,
      'uid': uid,
      'username': username,
      'postId': postId,
      'datePublished': datePublished,
      'postUrl': postUrl,
      'profImage': profImage,
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      description: map['description'] as String,
      uid: map['uid'] as String,
      username: map['username'] as String,
      postId: map['postId'] as String,
      datePublished: map['datePublished'] as String,
      postUrl: map['postUrl'],
      profImage: map['profImage'],
      likes: map['likes'],
    );
  }

  static Post fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Post(
      description: snapshot['description'],
      uid: snapshot['uid'],
      username: snapshot['username'],
      postId: snapshot['postId'],
      datePublished: snapshot['datePublished'],
      postUrl: snapshot['postUrl'],
      profImage: snapshot['profImage'],
      likes: snapshot['likes'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Post.fromJson(String source) =>
      Post.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Posts(description: $description, uid: $uid, username: $username, postId: $postId, datePublished: $datePublished, postUrl: $postUrl, profImage: $profImage)';
  }
}
