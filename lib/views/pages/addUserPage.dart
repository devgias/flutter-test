import 'package:flutter/material.dart';

import '../../models/userFormData.dart';
import '../widgets/userForm.dart';

class AddUserPage extends StatelessWidget {
  const AddUserPage({super.key});

  void _handleSubmit(BuildContext context, UserFormData data) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('User ${data.name} berhasil ditambahkan')),
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add User')),
      body: UserForm(
        submitLabel: 'Tambah',
        onSubmit: (data) => _handleSubmit(context, data),
      ),
    );
  }
}