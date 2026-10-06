import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_quiz/common/common.dart';
import 'package:flutter_test_quiz/core/core.dart';
import 'package:flutter_test_quiz/features/user/user.dart';
import 'package:flutter_test_quiz/utils/utils.dart';

@RoutePage()
class UserListPage extends StatelessWidget {
  const UserListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          locator<UsersBloc>()..add(const UsersEvent.getUsers()),
      child: const _UserListView(),
    );
  }
}

class _UserListView extends StatelessWidget {
  const _UserListView();

  /// Opens [route] and reloads the list when the form was saved.
  Future<void> _openForm(BuildContext context, PageRouteInfo route) async {
    final usersBloc = BlocProvider.of<UsersBloc>(context);

    final isSaved = await context.push<bool>(route);

    if (isSaved == true) {
      usersBloc.add(const UsersEvent.getUsers(shouldLoading: false));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'GitHub Users',
        subtitle: 'Tap a user to edit',
        showBackButton: false,
        actions: [
          CustomButton.icon(
            tooltip: 'Add user',
            icon: const Icon(Icons.person_add_alt_1_rounded),
            onPressed: () => _openForm(context, const AddUserRoute()),
          ),
        ],
      ),
      body: BlocBuilder<UsersBloc, UsersState>(
        builder: (context, state) => state.maybeWhen(
          orElse: () => const LoadingView(),
          error: (failure) => ErrorView(
            failure: failure,
            onRetry: () => BlocProvider.of<UsersBloc>(context)
                .add(const UsersEvent.getUsers()),
          ),
          loaded: (users) => RefreshIndicator(
            color: AppColors.primary400,
            backgroundColor: AppColors.background,
            onRefresh: () async => BlocProvider.of<UsersBloc>(context)
                .add(const UsersEvent.getUsers(shouldLoading: false)),
            child: users.isEmpty
                ? ListView(
                    children: [
                      SizedBox(
                        height: context.height / 2,
                        child: const EmptyView(message: 'No users found'),
                      ),
                    ],
                  )
                : ListView.separated(
                    padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
                    itemCount: users.length,
                    separatorBuilder: (_, _) => const Gap(20),
                    itemBuilder: (context, index) {
                      final user = users[index];

                      return UserCard(
                        user: user,
                        onTap: () => _openForm(
                          context,
                          EditUserRoute(login: user.login),
                        ),
                      );
                    },
                  ),
          ),
        ),
      ),
    );
  }
}
