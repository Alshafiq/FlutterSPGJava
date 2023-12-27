# flutter_spg_java

A new Flutter project with Java API.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

1. Create new Flutter project thru Android Studio using Flutter Engine with Java language.
2. Copy paste libs folder into AndroidStudioProjects\flutter_spg_java\android\app.
3. Modify build.gradle within flutter_spg_java\android\app by adding repositories{} and dependencies{}.
4. Copy code in class _MyHomePageState from main.dart accordingly. Import 'package:flutter/services.dart' to support MethodChannel.
5. Copy code from MainActivity.java. Open AndroidStudioProjects\flutter_spg_java\android\app in another Android Studio to get the Gradle build the project (click top right corner of Android Studio IDE 'Open for Editing in Android Studio'). Setup SDK if needed (Java 1.8).
6. Ensure to also copy all imports in MainActivity.java. 
7. Build the project.
8. Run this Flutter project.
9. Data to be sent to SPG app will need to be changed by hardcoding the value in variable 'String data' in main.dart.