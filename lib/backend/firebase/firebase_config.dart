import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAqVSzq_0nDZ65hbm7HVhh-Ba1XP-cvVF0",
            authDomain: "neighborhood-noise-fcf5qa.firebaseapp.com",
            projectId: "neighborhood-noise-fcf5qa",
            storageBucket: "neighborhood-noise-fcf5qa.firebasestorage.app",
            messagingSenderId: "922006682129",
            appId: "1:922006682129:web:1be79a3b48952422a84fb0"));
  } else {
    await Firebase.initializeApp();
  }
}
