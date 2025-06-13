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
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            _buildMenuItem(
              context,
              title: 'Play with AI',
              colors: [Color(0xFF00C9FF), Color(0xFF92FE9D)],
              icon: Icons.smart_toy_rounded,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const PlayAIScreen()),
              ),
            ),
            const SizedBox(height: 26),
            _buildMenuItem(
              context,
              title: 'Play with Friend',
              colors: [Color(0xFFFF6E7F), Color(0xFFFFB88C)],
              icon: Icons.people_alt_rounded,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const PlayFriendScreen()),
              ),
            ),
            const SizedBox(height: 26),
            _buildMenuItem(
              context,
              title: 'Learn Chess',
              colors: [Color(0xFF8E2DE2), Color(0xFF4A00E0)],
              icon: Icons.school_rounded,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const LearnScreen()),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context, {
    required String title,
    required List<Color> colors,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(24),
      onTap: onTap,
      child: Ink(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: colors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: colors.last.withOpacity(0.3),
              offset: const Offset(0, 8),
              blurRadius: 14,
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(14),
                child: Icon(
                  icon,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1,
                  ),
                ),
              ),
              const Icon(Icons.arrow_forward_ios_rounded,
                  color: Colors.white, size: 20),
            ],
          ),
        ),
      ),
    );
  }
}
