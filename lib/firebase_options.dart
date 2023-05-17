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
    apiKey: 'AIzaSyDPjLDmrDO0Jm-6VJeAwJufSurFkYODObY',
    appId: '1:12842485575:web:5f2bd1a2e293e7a2e3ae62',
    messagingSenderId: '12842485575',
    projectId: 'iat-example',
    authDomain: 'iat-example.firebaseapp.com',
    storageBucket: 'iat-example.appspot.com',
    measurementId: 'G-Y1KHXNQ5YT',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDVdsh1e3gV9sRSRpp7ZHH2grgOUJqhz4M',
    appId: '1:12842485575:android:521fdaf423c93b4ee3ae62',
    messagingSenderId: '12842485575',
    projectId: 'iat-example',
    storageBucket: 'iat-example.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC3EWzaYc3DMjTrfcnC-cx-7vUEZtRqRWA',
    appId: '1:12842485575:ios:9e06d9679e494ccbe3ae62',
    messagingSenderId: '12842485575',
    projectId: 'iat-example',
    storageBucket: 'iat-example.appspot.com',
    iosClientId: '12842485575-rbd43amroplpcam6laqn1udg09soiku7.apps.googleusercontent.com',
    iosBundleId: 'com.example.iatExample',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC3EWzaYc3DMjTrfcnC-cx-7vUEZtRqRWA',
    appId: '1:12842485575:ios:1a654b8ae3a516a5e3ae62',
    messagingSenderId: '12842485575',
    projectId: 'iat-example',
    storageBucket: 'iat-example.appspot.com',
    iosClientId: '12842485575-uak9kf3c243f9ohq7lkkm010qsdsdeqq.apps.googleusercontent.com',
    iosBundleId: 'com.example.iatExample.RunnerTests',
  );
}
