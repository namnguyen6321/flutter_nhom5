import 'package:flutter/material.dart';
import 'package:my_app/screens/play_ai_screen.dart';
import 'package:my_app/screens/play_friend_screen.dart';
import 'package:my_app/screens/settings_creen.dart';

import 'about_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chess Game')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => PlayAIScreen())),
              child: Text('Play vs AI'),),

              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => PlayFriendScreen())),
                child: Text('Play with Friend'),
              ),
              SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => SettingsScreen())),
              child: Text('Settings'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => AboutScreen())),
              child: Text('About'),
            ),
          ],
        ),
      ),
    );
  }
}
