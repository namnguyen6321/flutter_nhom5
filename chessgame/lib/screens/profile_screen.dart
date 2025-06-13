import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        centerTitle: true,
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: theme.colorScheme.onPrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Column(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/avatar.png'),
                ),
                const SizedBox(height: 12),
                Text(
                  'Nguyen Dinh Nam',
                  style: theme.textTheme.headlineSmall
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  'nguyendinhnam@gmail.com',
                  style: theme.textTheme.bodyMedium
                      ?.copyWith(color: theme.hintColor),
                ),
                const SizedBox(height: 4),
                Text(
                  'Phone: 0123 456 789',
                  style: theme.textTheme.bodyMedium,
                ),
                Text(
                  'Address: 123 Flutter St, VN',
                  style: theme.textTheme.bodyMedium,
                ),
              ],
            ),
            const SizedBox(height: 30),
            _buildProfileOption(
              context,
              icon: Icons.edit,
              title: 'Edit Profile',
              onTap: () {
                // Navigator.push(...);
              },
            ),
            const SizedBox(height: 12),
            _buildProfileOption(
              context,
              icon: Icons.help_outline,
              title: 'Help & Support',
              onTap: () {},
            ),
            const SizedBox(height: 12),
            _buildProfileOption(
              context,
              icon: Icons.logout,
              title: 'Log Out',
              iconColor: Colors.red,
              onTap: () {
                // logout function
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileOption(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color? iconColor,
  }) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            if (theme.brightness == Brightness.light)
              BoxShadow(
                color: Colors.grey.withOpacity(0.15),
                blurRadius: 6,
                offset: const Offset(0, 4),
              ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, color: iconColor ?? theme.colorScheme.primary),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: theme.textTheme.bodyLarge,
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 16, color: theme.hintColor),
          ],
        ),
      ),
    );
  }
}
