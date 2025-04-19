import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

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
      debugShowCheckedModeBanner: false,
    );
  }
}