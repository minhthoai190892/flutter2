// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:get/get.dart';
// import 'package:tiktok_flutter/constraint.dart';
// import 'package:tiktok_flutter/models/models.dart';
// import 'package:video_compress/video_compress.dart';

// class UploadVideoController extends GetxController {
//   uploadVideo(
//       {required String songname,
//       required String caption,
//       required String videoPath}) async {
//     try {
//       // lấy uid người dùng hiện tại
//       String uid = firebaseAuth.currentUser!.uid;
//       // lấy thông tin người dùng từ firebase bằng uid
//       DocumentSnapshot userDoc =
//           await firebaseFirestore.collection('users').doc(uid).get();
//       // get id vide
//       var allDocs = await firebaseFirestore.collection('videos').get();
//       int len = allDocs.docs.length;
//       String videoUrl = await _uploadVideoToStorage("Video $len", videoPath);
//       String thumbnail = await _uploadImageToStorage("Video $len", videoPath);
//       VideoModel videoModel = VideoModel(
//           username: (userDoc.data() as Map<String, dynamic>)['username'],
//           uid: uid,
//           id: "Video $len",
//           likes: [],
//           commentCount: 0,
//           shareCount: 0,
//           songname: songname,
//           caption: caption,
//           videoUrl: videoUrl,
//           profilePhoto:
//               (userDoc.data() as Map<String, dynamic>)['profilePhoto'],
//           thumbnail: thumbnail);
//       // luu thông tin video
//       await firebaseFirestore
//           .collection('videos')
//           .doc("Video $len")
//           .set(videoModel.toMap());
//       Get.back();
//     } catch (e) {
//       Get.snackbar('Error Uploading Video', e.toString());
//     }
//   }

//   Future<String> _uploadVideoToStorage(String id, String videoPath) async {
//     // tạo vùng lưu trữ
//     Reference ref = firebaseStorage.ref().child('videos').child(id);
//     UploadTask uploadTask =
//         ref.putFile(await _compressVideo(videoPath) );
//     Task.ref.getDownloadUSnapshot snap = await uploadTask;
//     String downloadUrl = await snapRL();
//     return downloadUrl;
//   }

//  _compressVideo(String videoPath) async {
//     final compressVideo = await VideoCompress.compressVideo(videoPath,
//         quality: VideoQuality.MediumQuality);
//     return compressVideo!.file;
//   }

//   Future<String> _uploadImageToStorage(String id, String videoPath) async {
//     // tạo vùng lưu trữ
//     Reference ref = firebaseStorage.ref().child('thumbnails').child(id);

//     UploadTask uploadTask =
//         ref.putFile(await _compressImage(videoPath));
//     TaskSnapshot snap = await uploadTask;
//     String downloadUrl = await snap.ref.getDownloadURL();
//     return downloadUrl;
//   }

//   _compressImage(String videoPath) async {
//     final thumbanil = await VideoCompress.getFileThumbnail(videoPath);
//     return thumbanil;
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:tiktok_flutter/constraint.dart';
import 'package:tiktok_flutter/models/models.dart';
import 'package:video_compress/video_compress.dart';

class UploadVideoController extends GetxController {
  /// nén video
  _compressVideo(String videoPath) async {
    final compressedVideo = await VideoCompress.compressVideo(
      videoPath,
      quality: VideoQuality.MediumQuality,
    );
    return compressedVideo!.file;
  }

  /// lưu video trên Storage
  Future<String> _uploadVideoToStorage(String id, String videoPath) async {
    // tạo khu vực lưu trữ video
    Reference ref = firebaseStorage.ref().child('videos').child(id);

    UploadTask uploadTask = ref.putFile(await _compressVideo(videoPath));
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  /// lưu image trên Storage

  _getThumbnail(String videoPath) async {
    final thumbnail = await VideoCompress.getFileThumbnail(videoPath);
    return thumbnail;
  }

  /// lưu image trên Storage
  Future<String> _uploadImageToStorage(String id, String videoPath) async {
    Reference ref = firebaseStorage.ref().child('thumbnails').child(id);
    UploadTask uploadTask = ref.putFile(await _getThumbnail(videoPath));
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  // upload video
  uploadVideo(String songName, String caption, String videoPath) async {
    try {
      String uid = firebaseAuth.currentUser!.uid;
      // lấy user bằng id
      DocumentSnapshot userDoc =
          await firebaseFirestore.collection('users').doc(uid).get();
      // get id
      var allDocs = await firebaseFirestore.collection('videos').get();
      int len = allDocs.docs.length;
      String videoUrl = await _uploadVideoToStorage("Video $len", videoPath);
      String thumbnail = await _uploadImageToStorage("Video $len", videoPath);
  // khởi tạo đối tượng
      VideoModel video = VideoModel(
        username: (userDoc.data()! as Map<String, dynamic>)['name'],
        uid: uid,
        id: "Video $len",
        likes: [],
        commentCount: 0,
        shareCount: 0,
        songname: songName,
        caption: caption,
        videoUrl: videoUrl,
        profilePhoto: (userDoc.data()! as Map<String, dynamic>)['profilePhoto'],
        thumbnail: thumbnail,
      );
  // lưu thông tin video
      await firebaseFirestore
          .collection('videos')
          .doc('Video $len')
          .set(video.toMap());
      Get.back();
    } catch (e) {
      Get.snackbar(
        'Error Uploading Video',
        e.toString(),
      );
    }
  }
}
