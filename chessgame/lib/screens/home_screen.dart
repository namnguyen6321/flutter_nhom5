import 'package:flutter/material.dart';
import 'package:my_app/screens/home_content.dart';
import 'package:my_app/screens/profile_screen.dart';
import 'package:my_app/screens/about_screen.dart';
import 'package:my_app/screens/settings_creen.dart';

class HomeScreen extends StatefulWidget {
  final bool isDarkMode;
  final VoidCallback onToggleTheme;

  const HomeScreen({
    super.key,
    required this.isDarkMode,
    required this.onToggleTheme,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      const HomeContent(),
      const ProfileScreen(),
      SettingsScreen(
        isDarkMode: widget.isDarkMode,
        onToggleTheme: widget.onToggleTheme,
      ),
      const AboutScreen(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chess Game'),
        centerTitle: true,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'About'),
        ],
      ),
    );
  }
}
