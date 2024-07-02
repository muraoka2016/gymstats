import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDlU4fp6eOUhZopQUDdWQXQ-s1LA-iwjFk",
            authDomain: "gymstats-b7dd6.firebaseapp.com",
            projectId: "gymstats-b7dd6",
            storageBucket: "gymstats-b7dd6.appspot.com",
            messagingSenderId: "806873281630",
            appId: "1:806873281630:web:b4152bce70fd9c7b4130cf"));
  } else {
    await Firebase.initializeApp();
  }
}
