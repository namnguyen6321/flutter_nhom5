
import 'package:flutter/material.dart';

class PlayAIScreen extends StatelessWidget {
  const PlayAIScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Play vs AI')),
      body: const Center(
        child: Text('Chơi với AI - bàn cờ sẽ hiển thị ở đây'),
      ),
    );
  }
}
