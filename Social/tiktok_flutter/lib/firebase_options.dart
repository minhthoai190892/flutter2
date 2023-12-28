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
    apiKey: 'AIzaSyCY4ep5Lb9BZ_mZFiDzf1ZIc6gaYRCJE50',
    appId: '1:1085999655023:web:cb200968bff02efbbe859a',
    messagingSenderId: '1085999655023',
    projectId: 'tiktok-tutorial-1bee9',
    authDomain: 'tiktok-tutorial-1bee9.firebaseapp.com',
    storageBucket: 'tiktok-tutorial-1bee9.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAhtZ0-2hGX7YXA3wxFR44TSEfYWtd2m8M',
    appId: '1:1085999655023:android:0af20de2f34c5e6ebe859a',
    messagingSenderId: '1085999655023',
    projectId: 'tiktok-tutorial-1bee9',
    storageBucket: 'tiktok-tutorial-1bee9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAHO0WSS6tE7XRITOYEQh7vob6g4-alhzo',
    appId: '1:1085999655023:ios:35e26edf7c08a4e8be859a',
    messagingSenderId: '1085999655023',
    projectId: 'tiktok-tutorial-1bee9',
    storageBucket: 'tiktok-tutorial-1bee9.appspot.com',
    iosBundleId: 'com.example.tiktokFlutter',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAHO0WSS6tE7XRITOYEQh7vob6g4-alhzo',
    appId: '1:1085999655023:ios:466519baf38aa977be859a',
    messagingSenderId: '1085999655023',
    projectId: 'tiktok-tutorial-1bee9',
    storageBucket: 'tiktok-tutorial-1bee9.appspot.com',
    iosBundleId: 'com.example.tiktokFlutter.RunnerTests',
  );
}
