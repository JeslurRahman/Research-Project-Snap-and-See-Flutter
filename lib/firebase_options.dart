// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';
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
    apiKey: 'AIzaSyAgo9a0sshqOGo9qZM7tfSBNMN3qiEyUK0',
    appId: '1:557432449633:web:b1ab371c0a17270dd91820',
    messagingSenderId: '557432449633',
    projectId: 'bemyeyes-3c6ef',
    authDomain: 'bemyeyes-3c6ef.firebaseapp.com',
    databaseURL: 'https://bemyeyes-3c6ef-default-rtdb.firebaseio.com',
    storageBucket: 'bemyeyes-3c6ef.appspot.com',
    measurementId: 'G-L2JTBP93Z0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBih4QGTn7GRVJWGfPQLwEAzRo-FGwjzO4',
    appId: '1:557432449633:android:036335afa3c89d92d91820',
    messagingSenderId: '557432449633',
    projectId: 'bemyeyes-3c6ef',
    databaseURL: 'https://bemyeyes-3c6ef-default-rtdb.firebaseio.com',
    storageBucket: 'bemyeyes-3c6ef.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCciw150V79MZBxnTSBDbgenCkgCXJfM70',
    appId: '1:557432449633:ios:c6b663cf55f84da8d91820',
    messagingSenderId: '557432449633',
    projectId: 'bemyeyes-3c6ef',
    databaseURL: 'https://bemyeyes-3c6ef-default-rtdb.firebaseio.com',
    storageBucket: 'bemyeyes-3c6ef.appspot.com',
    iosBundleId: 'com.example.beMyEyes',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCciw150V79MZBxnTSBDbgenCkgCXJfM70',
    appId: '1:557432449633:ios:8816d99fcddd33c8d91820',
    messagingSenderId: '557432449633',
    projectId: 'bemyeyes-3c6ef',
    databaseURL: 'https://bemyeyes-3c6ef-default-rtdb.firebaseio.com',
    storageBucket: 'bemyeyes-3c6ef.appspot.com',
    iosBundleId: 'com.example.beMyEyes.RunnerTests',
  );
}
