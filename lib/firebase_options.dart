// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    // ignore: missing_enum_constant_in_switch
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
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD6P4AgWxhze_JRlYZtd99P3uSMU1xFmIQ',
    appId: '1:478931483210:android:9731a4c2c98072481c84b3',
    messagingSenderId: '478931483210',
    projectId: 'movies-32003',
    storageBucket: 'movies-32003.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCbCo-1FE-WEvNZxRigfofjtl05jbDqPMk',
    appId: '1:478931483210:ios:8a608056b1168fbf1c84b3',
    messagingSenderId: '478931483210',
    projectId: 'movies-32003',
    storageBucket: 'movies-32003.appspot.com',
    iosClientId: '478931483210-25a5uh1e7n9butdj53tl25qqnb6j6th1.apps.googleusercontent.com',
    iosBundleId: 'com.appgainMoviesHopez',
  );
}