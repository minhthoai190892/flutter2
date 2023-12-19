import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_flutter/models/models.dart';
import 'package:instagram_flutter/resources/storage_method.dart';
import 'package:uuid/uuid.dart';

class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // upload post
  Future<String> uploadPost(
      {required String description,
      required Uint8List file,
      required String username,
      required String profImage,
      required String uid}) async {
    String res = 'some error occurred';

    try {
      String photoUrl =
          await StorageMethod().uploadImageToStorage('posts', file, true);
      String postId = const Uuid().v1();
      Post post = Post(
          description: description,
          uid: uid,
          username: username,
          postId: postId,
          datePublished: DateTime.now(),
          postUrl: photoUrl,
          profImage: profImage,
          likes: []);
      // upload to firebaseStorage
      _firestore.collection('posts').doc().set(post.toMap());
      res = 'success';
    } catch (error) {
      res = error.toString();
    }
    return res;
  }
}
