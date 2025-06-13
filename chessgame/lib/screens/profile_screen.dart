import 'package:flutter/material.dart';
import 'edit_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String name = 'Nguyen Dinh Nam';
  String email = 'nguyendinhnam@gmail.com';
  String phone = '0123 456 789';
  String address = '123 Flutter St, VN';
  String birthday = '01/01/2000';
  String gender = 'Nam';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/king.png'),
            ),
            const SizedBox(height: 12),
            _buildInfoRow(theme, 'Name', name),
            _buildInfoRow(theme, 'Email', email),
            _buildInfoRow(theme, 'Phone', phone),
            _buildInfoRow(theme, 'Address', address),
            _buildInfoRow(theme, 'Birthday', birthday),
            _buildInfoRow(theme, 'Gender', gender),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              icon: const Icon(Icons.edit),
              label: const Text('Edit Profile'),
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                backgroundColor: theme.colorScheme.primary,
                foregroundColor: theme.colorScheme.onPrimary,
              ),
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => EditProfileScreen(
                      name: name,
                      email: email,
                      phone: phone,
                      address: address,
                      birthday: birthday,
                      gender: gender,
                    ),
                  ),
                );

                if (result != null) {
                  setState(() {
                    name = result['name'];
                    email = result['email'];
                    phone = result['phone'];
                    address = result['address'];
                    birthday = result['birthday'];
                    gender = result['gender'];
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(ThemeData theme, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$title: ',
            style: theme.textTheme.bodyLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Text(
              value,
              style: theme.textTheme.bodyLarge,
            ),
          ),
        ],
      ),
    );
  }
}
