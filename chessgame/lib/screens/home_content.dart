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
              icon: Icons.smart_toy,
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
              icon: Icons.people,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PlayFriendScreen()),
              ),
            ),
            const SizedBox(height: 20),
            _buildMenuItem(
              context,
              title: 'Learn Chess',
              color: Colors.deepPurple[200]!,
              icon: Icons.school,
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
      required IconData icon,
      required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 6,
        color: color,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(icon, color: color),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Icon(Icons.arrow_forward_ios, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
