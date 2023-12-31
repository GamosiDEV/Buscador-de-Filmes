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
    apiKey: 'AIzaSyBFIW71g6VI8rlQKTPmfzCOxERI7lPhdDU',
    appId: '1:150773548065:web:0ee427e8431d86e4a48f60',
    messagingSenderId: '150773548065',
    projectId: 'buscador-de-filmes-d192c',
    authDomain: 'buscador-de-filmes-d192c.firebaseapp.com',
    storageBucket: 'buscador-de-filmes-d192c.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAauXovJuh_xAs5P5rhOl2xXqr0QbJ3ytE',
    appId: '1:150773548065:android:37aa19b161b493ffa48f60',
    messagingSenderId: '150773548065',
    projectId: 'buscador-de-filmes-d192c',
    storageBucket: 'buscador-de-filmes-d192c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB1ZDBJYIYmd8WqpzvIXHaWxuOBjTkawQs',
    appId: '1:150773548065:ios:308c992a18239f2ca48f60',
    messagingSenderId: '150773548065',
    projectId: 'buscador-de-filmes-d192c',
    storageBucket: 'buscador-de-filmes-d192c.appspot.com',
    iosBundleId: 'com.example.movieDatabase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB1ZDBJYIYmd8WqpzvIXHaWxuOBjTkawQs',
    appId: '1:150773548065:ios:7f69460a3bd9399da48f60',
    messagingSenderId: '150773548065',
    projectId: 'buscador-de-filmes-d192c',
    storageBucket: 'buscador-de-filmes-d192c.appspot.com',
    iosBundleId: 'com.example.movieDatabase.RunnerTests',
  );
}
