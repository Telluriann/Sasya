# Sasya 

Sasya is a Flutter application that allows users to scan a crop or plant using their phone camera and identify the plant using an AI API.

## 🚀 Getting Started

Since this code was scaffolded dynamically, you will need to finish the initialization locally on your machine where Flutter is installed.

### 1. Generate Platform Folders
Navigate to this directory in your terminal and run:
```bash
flutter create .
```
This will automatically generate the corresponding iOS, Android, and web platform folders without touching the `lib/` files we created!

### 2. Get Dependencies
Run the following command to download all specified packages in `pubspec.yaml`:
```bash
flutter pub get
```

### 3. Firebase Configuration
We have added `firebase_core` to your project and set up the initialization hook in `lib/main.dart`, but the project is not yet linked to an actual Firebase environment.
To initialize it properly:
1. Create a Firebase project in the [Firebase Console](https://console.firebase.google.com/).
2. Run `flutterfire configure` in this project directory to connect your app to Firebase. This command will update `lib/firebase_options.dart` with real API keys and update platform-specific initialization files.

### 4. Connect Real API
The core Plant Identification flow is functional, but it uses a Mock implementation in `lib/services/api_service.dart`.
Once you get your API keys from a provider like Pl@ntNet or Plant.id, uncomment the `http` code in the service and adjust the request payload to match their specification.
