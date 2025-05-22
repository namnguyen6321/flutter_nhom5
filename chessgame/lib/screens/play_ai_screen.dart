import 'package:flutter/material.dart';
import 'package:my_app/widget/game_board.dart';

class PlayAIScreen extends StatelessWidget {
  const PlayAIScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Play vs AI')),
      body: const Gameboard(
        vsAI: true,
      ),
    );
  }
}
