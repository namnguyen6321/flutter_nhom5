import 'package:flutter/material.dart';
import 'package:my_app/screens/about_screen.dart';
import 'package:my_app/screens/learn_screen.dart';
import 'package:my_app/screens/login_screen.dart';
import 'package:my_app/screens/play_ai_screen.dart';
import 'package:my_app/screens/play_friend_screen.dart';
import 'package:my_app/screens/profile_screen.dart';
import 'package:my_app/screens/settings_creen.dart';
import 'screens/home_screen.dart';
import 'package:my_app/widget/game_board.dart';

void main() {
  runApp(ChessGameApp());
}

class ChessGameApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Chess Game',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: HomeScreen(),
      routes: {
        '/play_ai': (context) => PlayAIScreen(),
        '/play_friend': (context) => PlayFriendScreen(),
        '/settings': (context) => SettingsScreen(),
        '/about': (context) => AboutScreen(),
        '/learn': (context) => LearnScreen(),
        '/home': (context) => HomeScreen(),
        '/profile': (context) => ProfileScreen(),
        '/login': (context) => LoginScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
