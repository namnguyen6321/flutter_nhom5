import 'package:flutter/material.dart';
import 'package:my_app/screens/play_ai_screen.dart';
import 'package:my_app/screens/play_friend_screen.dart';
import 'package:my_app/screens/settings_creen.dart';

import 'about_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chess Game')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
    GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const PlayAIScreen()),
        );
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.deepPurple,
            width: 200,
            height: 200,  
          ),
          const SizedBox(width: 10),
          Padding(
            padding:  EdgeInsets.only(top: 10),
            child: Text('Play with AI', style: TextStyle(fontSize: 20,color: Colors.black)),
          ),
         
      
        ],
        
      ),
    ),
    Container(
      height: 10,
    ),
    GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const PlayFriendScreen()),
        );
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.deepPurple[400],
             width: 200,
            height: 200,
          ),
           SizedBox(width: 10),
          Padding(
            padding:  EdgeInsets.only(top: 10),
            child: Text('Play with Friend', style: TextStyle(fontSize: 20,color: Colors.black)),
          ),
        ],
      ),
    ),
    Container(
      height: 10,
    ),
    Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: Colors.deepPurple[300], 
          width: 200,
          height: 200,
        ),
        SizedBox(width: 10),
        Padding(
          padding:  EdgeInsets.only(top: 10),
          child: Text('Intructions', style: TextStyle(fontSize: 20,color: Colors.black)),
        ),
      ],
    ),
  ],
),

      drawer: Drawer(
        backgroundColor: Colors.deepPurple[100],
        child: Column(
          children: [
            DrawerHeader(
              child: Icon(Icons.favorite, size: 100, color: Colors.deepPurple),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home Page'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingsScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('profile'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
