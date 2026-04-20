import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;

/// Default [FirebaseOptions] for use with your Firebase apps.
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    // This is a stub! You must replace this class by running:
    // `flutterfire configure`
    return const FirebaseOptions(
      apiKey: 'STUB_API_KEY',
      appId: 'STUB_APP_ID',
      messagingSenderId: 'STUB_SENDER_ID',
      projectId: 'STUB_PROJECT_ID',
    );
  }
}
