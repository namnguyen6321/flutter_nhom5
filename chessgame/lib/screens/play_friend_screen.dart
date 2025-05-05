import 'package:flutter/material.dart';
import 'package:my_app/widget/game_board.dart';

class PlayFriendScreen extends StatelessWidget {
  const PlayFriendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Play with Friend')),
      body: const Gameboard(),
    );
  }
}
