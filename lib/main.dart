import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/splash_screen.dart';
import 'screens/home_screen.dart';
import 'screens/chapter_screen.dart';
import 'screens/pdf_viewer_screen.dart';
import 'screens/exercise_screen.dart';
import 'screens/progress_screen.dart';
import 'models/chapter_model.dart';
import 'services/progress_service.dart';

void main() {
  runApp(const EntryPassportApp());
}

class EntryPassportApp extends StatelessWidget {
  const EntryPassportApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Entry Passport - Journey to the World',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xFFB3E5FC), // Baby blue
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFB3E5FC),
          secondary: const Color(0xFFF8BBD9), // Baby pink
        ),
        fontFamily: 'Comic Sans MS',
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFB3E5FC),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFF8BBD9),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
        ),
      ),
      home: const SplashScreen(),
      routes: {
        '/home': (context) => const HomeScreen(),
        '/progress': (context) => const ProgressScreen(),
      },
    );
  }
}
