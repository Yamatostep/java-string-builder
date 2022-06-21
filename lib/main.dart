import 'package:flutter/material.dart';

import 'screens/string_builder_screen.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: const StringBuilderScreen(title: 'Java String Builder'),
    );
  }
}
