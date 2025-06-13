import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  final bool isDarkMode;
  final VoidCallback onToggleTheme;

  const SettingsScreen({
    super.key,
    required this.isDarkMode,
    required this.onToggleTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cài đặt'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView(
          children: [
            const Text(
              'Giao diện',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: SwitchListTile(
                title: const Text("Chế độ tối", style: TextStyle(fontSize: 16)),
                value: isDarkMode,
                onChanged: (_) => onToggleTheme(),
                secondary: Icon(
                  isDarkMode ? Icons.dark_mode : Icons.light_mode,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
