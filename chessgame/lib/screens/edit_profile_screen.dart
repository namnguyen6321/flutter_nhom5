import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  final String name;
  final String email;
  final String phone;
  final String address;
  final String birthday;
  final String gender;

  const EditProfileScreen({
    super.key,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.birthday,
    required this.gender,
  });

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController _nameCtrl;
  late TextEditingController _emailCtrl;
  late TextEditingController _phoneCtrl;
  late TextEditingController _addressCtrl;
  late TextEditingController _birthdayCtrl;
  late TextEditingController _genderCtrl;

  @override
  void initState() {
    super.initState();
    _nameCtrl = TextEditingController(text: widget.name);
    _emailCtrl = TextEditingController(text: widget.email);
    _phoneCtrl = TextEditingController(text: widget.phone);
    _addressCtrl = TextEditingController(text: widget.address);
    _birthdayCtrl = TextEditingController(text: widget.birthday);
    _genderCtrl = TextEditingController(text: widget.gender);
  }

  void _saveProfile() {
    Navigator.pop(context, {
      'name': _nameCtrl.text,
      'email': _emailCtrl.text,
      'phone': _phoneCtrl.text,
      'address': _addressCtrl.text,
      'birthday': _birthdayCtrl.text,
      'gender': _genderCtrl.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Profile')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            TextField(
                controller: _nameCtrl,
                decoration: const InputDecoration(labelText: 'Name')),
            TextField(
                controller: _emailCtrl,
                decoration: const InputDecoration(labelText: 'Email')),
            TextField(
                controller: _phoneCtrl,
                decoration: const InputDecoration(labelText: 'Phone')),
            TextField(
                controller: _addressCtrl,
                decoration: const InputDecoration(labelText: 'Address')),
            TextField(
                controller: _birthdayCtrl,
                decoration: const InputDecoration(labelText: 'Birthday')),
            TextField(
                controller: _genderCtrl,
                decoration: const InputDecoration(labelText: 'Gender')),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _saveProfile, child: const Text('Save')),
          ],
        ),
      ),
    );
  }
}
