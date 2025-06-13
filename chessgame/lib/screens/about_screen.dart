import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF9FA8DA), Color(0xFF5C6BC0)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'Giới thiệu',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                const CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.sports_esports,
                    size: 50,
                    color: Color(0xFF5C6BC0),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Chess Game Flutter',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 40),
                _buildInfoCard(Icons.info, 'Phiên bản', '1.0.0'),
                _buildInfoCard(Icons.group, 'Tác giả', 'Nhóm 5'),
                _buildInfoCard(Icons.description, 'Mô tả',
                    'Ứng dụng chơi cờ vua đơn giản, tích hợp chế độ AI và nhiều tính năng hấp dẫn.'),
                const Spacer(),
                Text(
                  '© 2025 Nhóm 5 - Đại học Mỏ - Địa chất',
                  style: theme.textTheme.bodySmall
                      ?.copyWith(color: Colors.white70),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard(IconData icon, String title, String value) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 4,
      child: ListTile(
        leading: Icon(icon, color: Color(0xFF5C6BC0)),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(value),
      ),
    );
  }
}
