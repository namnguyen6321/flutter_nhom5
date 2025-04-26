import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About')),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'Chess Game Flutter\n\n'
              'Phiên bản: 1.0.0\n'
              'Tác giả: Nhóm 5\n'
              'Ứng dụng chơi cờ vua đơn giản tích hợp chế độ AI và nhiều tính năng hấp dẫn.',
        ),
      ),
    );
  }
}
