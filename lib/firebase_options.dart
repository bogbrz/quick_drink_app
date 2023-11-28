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
    apiKey: 'AIzaSyCX6um714c5moT_aVH_C2ypIm5iNndKYI0',
    appId: '1:350658212835:web:aa82c1f0ccbec6853c66d6',
    messagingSenderId: '350658212835',
    projectId: 'rankingjulkow',
    authDomain: 'rankingjulkow.firebaseapp.com',
    storageBucket: 'rankingjulkow.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAcMJni05iBwY6qyXM9Q3Ro8gpOIEo4rSA',
    appId: '1:350658212835:android:765d61e055cb177a3c66d6',
    messagingSenderId: '350658212835',
    projectId: 'rankingjulkow',
    storageBucket: 'rankingjulkow.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBNgeVll4MkIuJga90y7_f8hK34I5NpEUo',
    appId: '1:350658212835:ios:7d78d41256cff2ba3c66d6',
    messagingSenderId: '350658212835',
    projectId: 'rankingjulkow',
    storageBucket: 'rankingjulkow.appspot.com',
    iosBundleId: 'com.example.quickDrinkApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBNgeVll4MkIuJga90y7_f8hK34I5NpEUo',
    appId: '1:350658212835:ios:53f8d92aea1950793c66d6',
    messagingSenderId: '350658212835',
    projectId: 'rankingjulkow',
    storageBucket: 'rankingjulkow.appspot.com',
    iosBundleId: 'com.example.quickDrinkApp.RunnerTests',
  );
}
