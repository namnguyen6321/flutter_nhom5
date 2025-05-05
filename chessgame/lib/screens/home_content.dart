import 'package:flutter/material.dart';
import 'package:my_app/screens/play_ai_screen.dart';
import 'package:my_app/screens/play_friend_screen.dart';
import 'package:my_app/screens/learn_screen.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildMenuItem(
              context,
              title: 'Play with AI',
              color: Colors.deepPurple,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PlayAIScreen()),
              ),
            ),
            const SizedBox(height: 20),
            _buildMenuItem(
              context,
              title: 'Play with Friend',
              color: Colors.deepPurple[400]!,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const PlayFriendScreen()),
              ),
            ),
            const SizedBox(height: 20),
            _buildMenuItem(
              context,
              title: 'Learn Chess',
              color: Colors.deepPurple[200]!,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LearnScreen()),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context,
      {required String title,
      required Color color,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            color: color,
            width: 120,
            height: 120,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
