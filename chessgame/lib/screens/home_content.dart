import 'package:flutter/material.dart';
import 'package:my_app/screens/play_ai_screen.dart';
import 'package:my_app/screens/play_friend_screen.dart';
import 'package:my_app/screens/learn_screen.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PlayAIScreen()),
              );
            },
            child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           SizedBox(width: 10),
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
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PlayFriendScreen()),
              );
            },
            child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           SizedBox(width: 10),
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
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LearnScreen()),
              );
            },
            child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           SizedBox(width: 10),
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
          const SizedBox(height: 20),
        ],
      ),
    );
  }

}
