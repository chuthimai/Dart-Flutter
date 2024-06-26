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
    apiKey: 'AIzaSyD0tpFUHJXUDpPnp2YZOpUfx1ODC9TMVM0',
    appId: '1:987543967291:web:39a1d768d28cdf37f12e1e',
    messagingSenderId: '987543967291',
    projectId: 'flutter-chat-app-edcf1',
    authDomain: 'flutter-chat-app-edcf1.firebaseapp.com',
    storageBucket: 'flutter-chat-app-edcf1.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDhj5itf1avLWZcgYnYUNzv2z7uHDhqc04',
    appId: '1:987543967291:android:2ab6e4a202403a60f12e1e',
    messagingSenderId: '987543967291',
    projectId: 'flutter-chat-app-edcf1',
    storageBucket: 'flutter-chat-app-edcf1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCGNoR_mlJ5RST5aa2Gtva-9ImFWGXEBt8',
    appId: '1:987543967291:ios:6f4ac1c8548b4689f12e1e',
    messagingSenderId: '987543967291',
    projectId: 'flutter-chat-app-edcf1',
    storageBucket: 'flutter-chat-app-edcf1.appspot.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCGNoR_mlJ5RST5aa2Gtva-9ImFWGXEBt8',
    appId: '1:987543967291:ios:6f4ac1c8548b4689f12e1e',
    messagingSenderId: '987543967291',
    projectId: 'flutter-chat-app-edcf1',
    storageBucket: 'flutter-chat-app-edcf1.appspot.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD0tpFUHJXUDpPnp2YZOpUfx1ODC9TMVM0',
    appId: '1:987543967291:web:836fdbb554e95d6cf12e1e',
    messagingSenderId: '987543967291',
    projectId: 'flutter-chat-app-edcf1',
    authDomain: 'flutter-chat-app-edcf1.firebaseapp.com',
    storageBucket: 'flutter-chat-app-edcf1.appspot.com',
  );

}