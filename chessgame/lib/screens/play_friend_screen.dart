import 'package:flutter/material.dart';

class PlayFriendScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Play with Friend')),
      body: Center(
        child: Text('Chơi với bạn bè - bàn cờ sẽ hiển thị ở đây'),
      ),
    );
  }
}
