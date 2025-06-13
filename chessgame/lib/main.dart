import 'package:flutter/material.dart';
import 'package:my_app/screens/about_screen.dart';
import 'package:my_app/screens/learn_screen.dart';
import 'package:my_app/screens/play_ai_screen.dart';
import 'package:my_app/screens/play_friend_screen.dart';
import 'package:my_app/screens/profile_screen.dart';
import 'package:my_app/screens/settings_creen.dart';
import 'package:my_app/screens/home_screen.dart';

void main() {
  runApp(const ChessGameApp());
}

class ChessGameApp extends StatefulWidget {
  const ChessGameApp({super.key});

  @override
  State<ChessGameApp> createState() => _ChessGameAppState();
}

class _ChessGameAppState extends State<ChessGameApp> {
  bool isDarkMode = false;

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Chess Game',
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: HomeScreen(
        isDarkMode: isDarkMode,
        onToggleTheme: toggleTheme,
      ),
      routes: {
        '/play_ai': (context) => const PlayAIScreen(),
        '/play_friend': (context) => const PlayFriendScreen(),
        '/settings': (context) => SettingsScreen(
              isDarkMode: isDarkMode,
              onToggleTheme: toggleTheme,
            ),
        '/about': (context) => const AboutScreen(),
        '/learn': (context) => const LearnScreen(),
        '/profile': (context) => const ProfileScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
