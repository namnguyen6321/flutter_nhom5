import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileScreen extends StatefulWidget {
  final String name;
  final String email;
  final String phone;
  final String address;
  final String birthday;
  final String gender;
  final String? avatarPath;

  const EditProfileScreen({
    super.key,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.birthday,
    required this.gender,
    this.avatarPath,
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
  String? _avatarPath;

  @override
  void initState() {
    super.initState();
    _nameCtrl = TextEditingController(text: widget.name);
    _emailCtrl = TextEditingController(text: widget.email);
    _phoneCtrl = TextEditingController(text: widget.phone);
    _addressCtrl = TextEditingController(text: widget.address);
    _birthdayCtrl = TextEditingController(text: widget.birthday);
    _genderCtrl = TextEditingController(text: widget.gender);
    _avatarPath = widget.avatarPath;
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _avatarPath = pickedFile.path;
      });
    }
  }

  void _saveProfile() {
    Navigator.pop(context, {
      'name': _nameCtrl.text,
      'email': _emailCtrl.text,
      'phone': _phoneCtrl.text,
      'address': _addressCtrl.text,
      'birthday': _birthdayCtrl.text,
      'gender': _genderCtrl.text,
      'avatarPath': _avatarPath,
    });
  }

  @override
  Widget build(BuildContext context) {
    final avatarImage = _avatarPath != null && _avatarPath!.isNotEmpty
        ? FileImage(File(_avatarPath!))
        : const AssetImage('assets/images/king.png');

    return Scaffold(
      appBar: AppBar(title: const Text('Edit Profile')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: avatarImage as ImageProvider,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: InkWell(
                      onTap: _pickImage,
                      child: const CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.black54,
                        child: Icon(Icons.camera_alt, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
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
