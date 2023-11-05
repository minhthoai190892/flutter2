// ignore_for_file: avoid_print

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ulearning_app/firebase_options.dart';
import 'package:ulearning_app/services/storage.dart';

class Global {
  static late StorageService storageService;

  /// sử dụng cho firebase service
  ///
  /// Tải và phân tích [SharedPreferences] cho ứng dụng này từ đĩa.
  Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    storageService = await StorageService().init();
   
  }
}
