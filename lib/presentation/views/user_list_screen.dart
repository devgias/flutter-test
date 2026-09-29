import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gias_flutter_test/core/constants/assets.gen.dart';
import 'package:gias_flutter_test/core/constants/color_constants.dart';
import 'package:gias_flutter_test/core/constants/text_style_constants.dart';
import 'package:gias_flutter_test/core/constants/route_path_constants.dart';
import 'package:gias_flutter_test/presentation/widgets/user_card.dart';

import '../../core/di/injection.dart';
import '../cubit/user_cubit.dart';

class UserListScreen extends StatelessWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<UserCubit>()..fetchUsers(),
      child: Scaffold(
        backgroundColor: ColorConstants.scaffoldBackground,
        appBar: AppBar(
          backgroundColor: ColorConstants.white,
          surfaceTintColor: ColorConstants.transparent,
          elevation: 0.5,
          shadowColor: ColorConstants.black12,
          title: Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorConstants.githubDark,
                ),
                alignment: Alignment.center,
                child: Assets.icons.iconGithubLogo.svg(height: 18, width: 18),
              ),
              const SizedBox(width: 10),
              Text(
                'Github Users',
                style: TextStyleConstants.geistBold.copyWith(
                  fontSize: 18,
                  color: ColorConstants.githubDark,
                ),
              ),
            ],
          ),
        ),
        body: BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            return switch (state) {
              UserInitial() || UserLoading() => const Center(
                  child: CircularProgressIndicator(),
                ),
              UserError(:final message) => Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(message, style: const TextStyle(color: ColorConstants.errorRed)),
                    ],
                  ),
                ),
              UserLoaded(:final users) => users.isEmpty
                  ? RefreshIndicator(
                      onRefresh: () => context.read<UserCubit>().fetchUsers(),
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          return SingleChildScrollView(
                            physics: const AlwaysScrollableScrollPhysics(),
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                minHeight: constraints.maxHeight,
                              ),
                              child: Center(
                                child: Text(
                                  'No users found',
                                  style:
                                      TextStyleConstants.geistMedium.copyWith(
                                    fontSize: 16,
                                    color: ColorConstants.grey600,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  : RefreshIndicator(
                      onRefresh: () => context.read<UserCubit>().fetchUsers(),
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 16),
                        itemCount: users.length,
                        itemBuilder: (context, index) {
                          final user = users[index];
                          return UserCard(
                            username: user.login,
                            avatarUrl: user.avatarUrl,
                            userId: user.id,
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                RoutePathConstants.editUser,
                                arguments: user.login,
                              );
                            },
                          );
                        },
                      ),
                    ),
            };
          },
        ),
        floatingActionButton: BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            if (state is UserInitial || state is UserLoading) {
              return const SizedBox.shrink();
            }
            return FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, RoutePathConstants.addUser);
              },
              backgroundColor: ColorConstants.githubDark,
              child: const Icon(Icons.add, color: ColorConstants.white),
            );
          },
        ),
      ),
    );
  }
}
