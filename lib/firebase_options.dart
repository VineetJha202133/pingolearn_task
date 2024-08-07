// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyC58PxbcHFj2LQKecHGnvbL_wzoZGenZp8',
    appId: '1:717129472935:web:959f4544337475251ff482',
    messagingSenderId: '717129472935',
    projectId: 'pingo-learn-task',
    authDomain: 'pingo-learn-task.firebaseapp.com',
    storageBucket: 'pingo-learn-task.appspot.com',
    measurementId: 'G-GHJFG5YD8Z',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCs1M1zTTX45WEnFWDb1blGl7ozfkrLqCM',
    appId: '1:717129472935:android:ee0895200d31c7061ff482',
    messagingSenderId: '717129472935',
    projectId: 'pingo-learn-task',
    storageBucket: 'pingo-learn-task.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBXAfaSK1Y2DTxT_5MRD5Ckg_Yh8qB1JE8',
    appId: '1:717129472935:ios:a430b0787f4687d71ff482',
    messagingSenderId: '717129472935',
    projectId: 'pingo-learn-task',
    storageBucket: 'pingo-learn-task.appspot.com',
    iosBundleId: 'com.example.pingolearnTask',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBXAfaSK1Y2DTxT_5MRD5Ckg_Yh8qB1JE8',
    appId: '1:717129472935:ios:a430b0787f4687d71ff482',
    messagingSenderId: '717129472935',
    projectId: 'pingo-learn-task',
    storageBucket: 'pingo-learn-task.appspot.com',
    iosBundleId: 'com.example.pingolearnTask',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC58PxbcHFj2LQKecHGnvbL_wzoZGenZp8',
    appId: '1:717129472935:web:465ac9b5f1d5e12e1ff482',
    messagingSenderId: '717129472935',
    projectId: 'pingo-learn-task',
    authDomain: 'pingo-learn-task.firebaseapp.com',
    storageBucket: 'pingo-learn-task.appspot.com',
    measurementId: 'G-HD7V193LRR',
  );
}
