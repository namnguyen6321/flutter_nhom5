import 'package:flutter/material.dart';

class PlayAIScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Play vs AI')),
      body: Center(
        child: Text('Chơi với AI - bàn cờ sẽ hiển thị ở đây'),
      ),
    );
  }
}
