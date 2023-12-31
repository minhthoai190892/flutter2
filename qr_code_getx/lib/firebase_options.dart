// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBAvInDmHeLuvmDgTTpQ1UkfbHJOB9Mjtg',
    appId: '1:897580178568:web:e8491e3c25a4427eb6933d',
    messagingSenderId: '897580178568',
    projectId: 'qrcode-39d7c',
    authDomain: 'qrcode-39d7c.firebaseapp.com',
    storageBucket: 'qrcode-39d7c.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBCT4Y4JHdwfsZye6p5KJGUjkBy2sSGELk',
    appId: '1:897580178568:android:da5a7d9f0c299343b6933d',
    messagingSenderId: '897580178568',
    projectId: 'qrcode-39d7c',
    storageBucket: 'qrcode-39d7c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAqmPLV0_cE2hWGCLJ-IbMbShvXvhTFtxA',
    appId: '1:897580178568:ios:837711faf77e4da2b6933d',
    messagingSenderId: '897580178568',
    projectId: 'qrcode-39d7c',
    storageBucket: 'qrcode-39d7c.appspot.com',
    iosBundleId: 'com.example.qrCodeGetx',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAqmPLV0_cE2hWGCLJ-IbMbShvXvhTFtxA',
    appId: '1:897580178568:ios:a7ef5b85b4a3e114b6933d',
    messagingSenderId: '897580178568',
    projectId: 'qrcode-39d7c',
    storageBucket: 'qrcode-39d7c.appspot.com',
    iosBundleId: 'com.example.qrCodeGetx.RunnerTests',
  );
}
