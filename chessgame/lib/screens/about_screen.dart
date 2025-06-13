import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    // Gradient tương thích theme
    final gradientColors = isDark
        ? [const Color(0xFF1F1C2C), const Color(0xFF928DAB)] // dark tone
        : [const Color(0xFF00DBDE), const Color(0xFFFC00FF)]; // bright tone

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'About',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),

                // Avatar + App Name
                Center(
                  child: Column(
                    children: [
                      const CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.sports_esports,
                            size: 50, color: Colors.deepPurple),
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
                    ],
                  ),
                ),
                const SizedBox(height: 30),

                // Info Cards
                _buildInfoCard(Icons.info, 'Version', '1.0.0'),
                _buildInfoCard(Icons.group, 'Author', 'Nhóm 5'),
                _buildInfoCard(Icons.description, 'Description',
                    'Ứng dụng chơi cờ vua đơn giản, tích hợp AI và nhiều chế độ hấp dẫn.'),

                const Spacer(),

                // Footer
                Center(
                  child: Text(
                    '© 2025 Nhóm 5 - Đại học Mỏ - Địa chất',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: Colors.white70,
                    ),
                    textAlign: TextAlign.center,
                  ),
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
      color: Colors.white.withOpacity(0.95),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        leading: Icon(icon, color: Colors.deepPurple),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        subtitle: Text(
          value,
          style: const TextStyle(color: Colors.black54),
        ),
      ),
    );
  }
}
