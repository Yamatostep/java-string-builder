import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'screens/my_home_page_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Java String Builder',
      theme: ThemeData(
        useMaterial3: true,

        colorScheme: ColorScheme.fromSeed(
          background: Colors.black,
          primary: const Color(0xFFeb1616),
          onPrimary: Colors.white,
          secondary: const Color(0xFF191C24),
          onSecondary: const Color(0xFF6C7293),
          surface: const Color(0xFF191C24),
          onSurface: Colors.white,
          seedColor: const Color(0xFFeb1616),
          brightness: Brightness.dark,
        ),

        textTheme: TextTheme(
          displayLarge: const TextStyle(
            fontSize: 72,
            fontWeight: FontWeight.bold,
          ),
          titleLarge: GoogleFonts.sarabun(
            fontSize: 30,
          ),
          bodyMedium: GoogleFonts.sarabun(),
          displaySmall: GoogleFonts.sarabun(),
        ),
      ),
      home: const MyHomePageScreen(),
    );
  }
}
