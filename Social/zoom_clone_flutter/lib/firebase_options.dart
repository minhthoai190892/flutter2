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
    apiKey: 'AIzaSyBdziNA9QLaXtVjBgQxEzY9LxWvjZvzgjA',
    appId: '1:681477217204:web:c07e22b10909836dffb0e1',
    messagingSenderId: '681477217204',
    projectId: 'zoom-clone-tutorial-44dad',
    authDomain: 'zoom-clone-tutorial-44dad.firebaseapp.com',
    storageBucket: 'zoom-clone-tutorial-44dad.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCcP0YZqkIJBRsDAGrifbGnqqgZ3GTF6YI',
    appId: '1:681477217204:android:0023d37cccdecd59ffb0e1',
    messagingSenderId: '681477217204',
    projectId: 'zoom-clone-tutorial-44dad',
    storageBucket: 'zoom-clone-tutorial-44dad.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD6z88BzjDmZ3TUGMKriY6qN6Ify82wH6Y',
    appId: '1:681477217204:ios:11c975d22afa5617ffb0e1',
    messagingSenderId: '681477217204',
    projectId: 'zoom-clone-tutorial-44dad',
    storageBucket: 'zoom-clone-tutorial-44dad.appspot.com',
    iosClientId: '681477217204-sf3o5rfhdd1638uklbiukqf31ql2u639.apps.googleusercontent.com',
    iosBundleId: 'com.example.zoomCloneFlutter',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD6z88BzjDmZ3TUGMKriY6qN6Ify82wH6Y',
    appId: '1:681477217204:ios:419f9e7b33842267ffb0e1',
    messagingSenderId: '681477217204',
    projectId: 'zoom-clone-tutorial-44dad',
    storageBucket: 'zoom-clone-tutorial-44dad.appspot.com',
    iosClientId: '681477217204-cuamfqntrjsf90tep5cpjpff1ig4a0kd.apps.googleusercontent.com',
    iosBundleId: 'com.example.zoomCloneFlutter.RunnerTests',
  );
}
