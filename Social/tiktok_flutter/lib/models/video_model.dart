// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class VideoModel {
  final String username;
  final String uid;
  final String id;
  final List likes;
  final int commentCount;
  final int shareCount;
  final String songname;
  final String caption;
  final String videoUrl;
  final String profilePhoto;
  final String thumbnail;
  VideoModel({
    required this.username,
    required this.uid,
    required this.id,
    required this.likes,
    required this.commentCount,
    required this.shareCount,
    required this.songname,
    required this.caption,
    required this.videoUrl,
    required this.profilePhoto,
    required this.thumbnail,
  });

  VideoModel copyWith({
    String? username,
    String? uid,
    String? id,
    List? likes,
    int? commentCount,
    int? shareCount,
    String? songname,
    String? caption,
    String? videoUrl,
    String? profilePhoto,
    String? thumbnail,
  }) {
    return VideoModel(
      username: username ?? this.username,
      uid: uid ?? this.uid,
      id: id ?? this.id,
      likes: likes ?? this.likes,
      commentCount: commentCount ?? this.commentCount,
      shareCount: shareCount ?? this.shareCount,
      songname: songname ?? this.songname,
      caption: caption ?? this.caption,
      videoUrl: videoUrl ?? this.videoUrl,
      profilePhoto: profilePhoto ?? this.profilePhoto,
      thumbnail: thumbnail ?? this.thumbnail,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'uid': uid,
      'id': id,
      'likes': likes,
      'commentCount': commentCount,
      'shareCount': shareCount,
      'songname': songname,
      'caption': caption,
      'videoUrl': videoUrl,
      'profilePhoto': profilePhoto,
      'thumbnail': thumbnail,
    };
  }

  factory VideoModel.fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return VideoModel(
        username: snapshot['username'],
        uid: snapshot['uid'],
        id: snapshot['id'],
        likes: snapshot['likes'],
        commentCount: snapshot['commentCount'],
        shareCount: snapshot['shareCount'],
        songname: snapshot['songname'],
        caption: snapshot['caption'],
        videoUrl: snapshot['videoUrl'],
        profilePhoto: snapshot['profilePhoto'],
        thumbnail: snapshot['thumbnail'],);
  }
  factory VideoModel.fromMap(Map<String, dynamic> map) {
    return VideoModel(
      username: map['username'] as String,
      uid: map['uid'] as String,
      id: map['id'] as String,
      likes: map['likes'] as List,
      commentCount: map['commentCount'] as int,
      shareCount: map['shareCount'] as int,
      songname: map['songname'] as String,
      caption: map['caption'] as String,
      videoUrl: map['videoUrl'] as String,
      profilePhoto: map['profilePhoto'] as String,
      thumbnail: map['thumbnail'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory VideoModel.fromJson(String source) =>
      VideoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'VideoModel(username: $username, uid: $uid, id: $id, likes: $likes, commentCount: $commentCount, shareCount: $shareCount, songname: $songname, caption: $caption, videoUrl: $videoUrl, profilePhoto: $profilePhoto, thumbnail: $thumbnail)';
  }

  @override
  bool operator ==(covariant VideoModel other) {
    if (identical(this, other)) return true;

    return other.username == username &&
        other.uid == uid &&
        other.id == id &&
        listEquals(other.likes, likes) &&
        other.commentCount == commentCount &&
        other.shareCount == shareCount &&
        other.songname == songname &&
        other.caption == caption &&
        other.videoUrl == videoUrl &&
        other.profilePhoto == profilePhoto &&
        other.thumbnail == thumbnail;
  }

  @override
  int get hashCode {
    return username.hashCode ^
        uid.hashCode ^
        id.hashCode ^
        likes.hashCode ^
        commentCount.hashCode ^
        shareCount.hashCode ^
        songname.hashCode ^
        caption.hashCode ^
        videoUrl.hashCode ^
        profilePhoto.hashCode ^
        thumbnail.hashCode;
  }
}
