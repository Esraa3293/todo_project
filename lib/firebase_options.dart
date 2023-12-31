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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBJRwOya3fn6TxSaZMHuyEw554m6bwhCHA',
    appId: '1:61736648410:web:e45f08c499aa6cbb96efe3',
    messagingSenderId: '61736648410',
    projectId: 'todo-project-805c4',
    authDomain: 'todo-project-805c4.firebaseapp.com',
    storageBucket: 'todo-project-805c4.appspot.com',
    measurementId: 'G-QW1DRWQZLF',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAk_CklTZq8vpxE1sSddYgXOWFY7QIQJ0I',
    appId: '1:61736648410:android:797ba210b05f166696efe3',
    messagingSenderId: '61736648410',
    projectId: 'todo-project-805c4',
    storageBucket: 'todo-project-805c4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBAAiavMfuCZ4ii58H-uQqR484rzp6nqCo',
    appId: '1:61736648410:ios:b9b7aa85b8ecb6b996efe3',
    messagingSenderId: '61736648410',
    projectId: 'todo-project-805c4',
    storageBucket: 'todo-project-805c4.appspot.com',
    iosBundleId: 'com.example.todoProject',
  );
}
