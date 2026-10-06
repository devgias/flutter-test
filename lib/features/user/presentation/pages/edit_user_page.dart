import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_quiz/common/common.dart';
import 'package:flutter_test_quiz/core/core.dart';
import 'package:flutter_test_quiz/features/user/user.dart';
import 'package:flutter_test_quiz/utils/utils.dart';

@RoutePage()
class EditUserPage extends StatelessWidget {
  /// GitHub username, e.g. `mojombo`.
  final String login;

  const EditUserPage({super.key, required this.login});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => locator<UserDetailBloc>()
            ..add(UserDetailEvent.getUserDetail(login)),
        ),
        BlocProvider(create: (context) => locator<UserFormBloc>()),
      ],
      child: BlocListener<UserFormBloc, UserFormState>(
        listener: (context, state) => state.whenOrNull<void>(
          success: (_) {
            context.customSnackbar.showSuccess('User updated successfully');
            context.maybePop(true);
          },
          error: (failure) => context.customSnackbar
              .showError(failure.toUserMessage(fallback: 'Failed to update user')),
        ),
        child: Scaffold(
          appBar: const CustomAppBar(title: 'Edit User'),
          body: BlocBuilder<UserDetailBloc, UserDetailState>(
            builder: (context, state) => state.maybeWhen(
              orElse: () => const LoadingView(),
              error: (failure) => ErrorView(
                failure: failure,
                onRetry: () => BlocProvider.of<UserDetailBloc>(context)
                    .add(UserDetailEvent.getUserDetail(login)),
              ),
              loaded: (user) => UserFormView(
                initialUser: user,
                submitLabel: 'Save Changes',
                onSubmit: (form) => BlocProvider.of<UserFormBloc>(context).add(
                  UserFormEvent.updateUser(user: user, form: form),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
