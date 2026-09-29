import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/constants/color_constants.dart';
import '../../core/constants/text_style_constants.dart';
import '../../core/di/injection.dart';
import '../cubit/user_detail_cubit.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/primary_button.dart';

class EditUserPage extends StatefulWidget {
  final String username;

  const EditUserPage({super.key, required this.username});

  @override
  State<EditUserPage> createState() => _EditUserPageState();
}

class _EditUserPageState extends State<EditUserPage> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _companyController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _companyController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _companyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<UserDetailCubit>()..fetchUserDetail(widget.username),
      child: Scaffold(
        backgroundColor: ColorConstants.scaffoldBackground,
        appBar: AppBar(
          backgroundColor: ColorConstants.white,
          surfaceTintColor: ColorConstants.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          title: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: ColorConstants.githubDark,
                    size: 22,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              const SizedBox(width: 4),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Edit User',
                    style: TextStyleConstants.geistBold.copyWith(
                      fontSize: 18,
                      color: ColorConstants.githubDark,
                    ),
                  ),
                  Text(
                    'https://api.github.com/users/${widget.username}',
                    style: TextStyleConstants.geistMonoRegular.copyWith(
                      fontSize: 12,
                      color: ColorConstants.grey600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        body: BlocConsumer<UserDetailCubit, UserDetailState>(
          listener: (context, state) {
            if (state is UserDetailLoaded) {
              _nameController.text = state.user.name ?? '';
              _emailController.text = state.user.email ?? '';
              _companyController.text = state.user.company ?? '';
            }
          },
          builder: (context, state) {
            return switch (state) {
              UserDetailInitial() || UserDetailLoading() => const Center(
                  child: CircularProgressIndicator(),
                ),
              UserDetailError error => Center(
                  child: Text(error.message,
                      style: const TextStyle(color: ColorConstants.errorRed)),
                ),
              UserDetailLoaded() => SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 32.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: _nameController,
                          label: 'Name',
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Name cannot be empty';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        CustomTextField(
                          controller: _emailController,
                          label: 'Email',
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Email cannot be empty';
                            }
                            final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                            if (!emailRegex.hasMatch(value)) {
                              return 'Enter a valid email address';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        CustomTextField(
                          controller: _companyController,
                          label: 'Company',
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Company cannot be empty';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 32),
                        PrimaryButton(
                          text: 'Update User',
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Edit user feature is not available'),
                                ),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
            };
          },
        ),
      ),
    );
  }
}
