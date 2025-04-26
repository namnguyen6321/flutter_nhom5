import 'package:flutter/material.dart';

class PlayFriendScreen extends StatelessWidget {
  const PlayFriendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Play with Friend')),
      body: const Center(
        child: Text('Chơi với bạn bè - bàn cờ sẽ hiển thị ở đây'),
      ),
    );
  }
}
