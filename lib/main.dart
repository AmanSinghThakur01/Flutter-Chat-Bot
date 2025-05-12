import 'package:flutter/material.dart';
import 'package:flutter_chat_bot/constants/constants.dart';
import 'package:flutter_chat_bot/screens/chat_screen.dart';

import 'screens/image_generator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: ScaffoldBackgroundColor,
        appBarTheme: AppBarTheme(
          color: cardColor,
        )
      ),
      debugShowCheckedModeBanner: false,
      home: ChatScreen(),
    );
  }
}

