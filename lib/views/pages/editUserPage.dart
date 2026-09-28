import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controllers/user/userDetail/userDetailBloc.dart';
import '../../models/userFormData.dart';
import '../../repositories/userRepository.dart';
import '../widgets/userForm.dart';

class EditUserPage extends StatelessWidget {
  const EditUserPage({super.key, required this.login});

  final String login;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserDetailBloc(
        userRepository: context.read<UserRepository>(),
      )..add(UserDetailRequested(login)),
      child: EditUserView(login: login),
    );
  }
}

class EditUserView extends StatelessWidget {
  const EditUserView({super.key, required this.login});

  final String login;

  void _handleSubmit(BuildContext context, UserFormData data) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Perubahan untuk ${data.name} disimpan')),
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit User')),
      body: BlocBuilder<UserDetailBloc, UserDetailState>(
        builder: (context, state) {
          switch (state.status) {
            case UserDetailStatus.success:
              return UserForm(
                initialData: UserFormData.fromDetail(state.detail!),
                submitLabel: 'Simpan',
                onSubmit: (data) => _handleSubmit(context, data),
              );
            case UserDetailStatus.failure:
              return _buildError(context, state.errorMessage);
            case UserDetailStatus.initial:
            case UserDetailStatus.loading:
              return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget _buildError(BuildContext context, String? message) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(message ?? 'Terjadi kesalahan.'),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () => context
                .read<UserDetailBloc>()
                .add(UserDetailRequested(login)),
            child: const Text('Coba lagi'),
          ),
        ],
      ),
    );
  }
}