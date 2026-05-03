import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';
import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase.
  // Make sure you have created a Firebase project and run `flutterfire configure`.
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    // 🔐 Sign in anonymously BEFORE running the app
    UserCredential userCredential =
        await FirebaseAuth.instance.signInAnonymously();

    // 🧪 Debug: print UID
    debugPrint("USER UID: ${userCredential.user?.uid}");
  } catch (e) {
    debugPrint(
        "Firebase initialization failed. Please run flutterfire configure. Error: $e");
  }

  runApp(const AgroScanApp());
}

class AgroScanApp extends StatelessWidget {
  const AgroScanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AgroScan',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
