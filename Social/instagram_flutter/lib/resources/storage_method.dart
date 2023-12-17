import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class StorageMethod {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // add image to the storage
  /// @param childname tên thư mục được tạo trong Storage
  /// @param file file hình ảnh
  Future<String> uploadImage(
      String childname, Uint8List file, bool isPost) async {
    Reference ref =
        _storage.ref().child(childname).child(_auth.currentUser!.uid);
    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snap = await uploadTask;
    // có thể tải hình ảnh xuống
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }
}
