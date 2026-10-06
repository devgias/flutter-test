import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_quiz/common/common.dart';
import 'package:flutter_test_quiz/core/core.dart';
import 'package:flutter_test_quiz/features/user/user.dart';
import 'package:flutter_test_quiz/utils/utils.dart';

@RoutePage()
class AddUserPage extends StatelessWidget {
  const AddUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<UserFormBloc>(),
      child: BlocListener<UserFormBloc, UserFormState>(
        listener: (context, state) => state.whenOrNull<void>(
          success: (user) {
            context.customSnackbar.showSuccess('${user.name} added');
            context.maybePop(true);
          },
          error: (failure) => context.customSnackbar
              .showError(failure.toUserMessage(fallback: 'Failed to add user')),
        ),
        child: Scaffold(
          appBar: const CustomAppBar(title: 'Add User'),
          body: Builder(
            builder: (context) => UserFormView(
              submitLabel: 'Add User',
              onSubmit: (form) => BlocProvider.of<UserFormBloc>(context)
                  .add(UserFormEvent.addUser(form)),
            ),
          ),
        ),
      ),
    );
  }
}
