import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controllers/user/userBloc.dart';
import '../../models/userModel.dart';
import '../../repositories/userRepository.dart';
import '../widgets/bottomLoader.dart';
import '../widgets/userListItems.dart';
import 'addUserPage.dart';
import 'editUserPage.dart';
class UserListPage extends StatelessWidget {
  const UserListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(
        userRepository: context.read<UserRepository>(),
      )..add(const UserFetched()),
      child: const UserListView(),
    );
  }
}

class UserListView extends StatefulWidget {
  const UserListView({super.key});

  @override
  State<UserListView> createState() => _UserListViewState();
}

class _UserListViewState extends State<UserListView> {
  static const double _loadMoreThreshold = 0.9;

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    final userBloc = context.read<UserBloc>();
    // Saat gagal, load ulang hanya lewat tombol retry agar tidak spam request.
    if (userBloc.state.status == UserStatus.failure) return;
    if (_isNearBottom) userBloc.add(const UserFetched());
  }

  bool get _isNearBottom {
    if (!_scrollController.hasClients) return false;
    final position = _scrollController.position;
    return position.pixels >= position.maxScrollExtent * _loadMoreThreshold;
  }

  void _retryFetch() => context.read<UserBloc>().add(const UserFetched());

  void _openEditPage(UserModel user) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => EditUserPage(login: user.login),
      ),
    );
  }

  void _openAddPage() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (_) => const AddUserPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GitHub Users')),
      floatingActionButton: FloatingActionButton(
        onPressed: _openAddPage,
        tooltip: 'Add User',
        child: const Icon(Icons.add),
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state.users.isEmpty) {
            return _buildEmptyState(state);
          }
          return _buildUserList(state);
        },
      ),
    );
  }

  Widget _buildEmptyState(UserState state) {
    if (state.status == UserStatus.failure) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(state.errorMessage ?? 'Terjadi kesalahan.'),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: _retryFetch,
              child: const Text('Coba lagi'),
            ),
          ],
        ),
      );
    }
    if (state.status == UserStatus.success) {
      return const Center(child: Text('Tidak ada data user.'));
    }
    return const Center(child: CircularProgressIndicator());
  }

  Widget _buildUserList(UserState state) {
    final itemCount =
    state.hasReachedMax ? state.users.length : state.users.length + 1;

    return ListView.builder(
      controller: _scrollController,
      itemCount: itemCount,
      itemBuilder: (context, index) {
        if (index >= state.users.length) {
          return BottomLoader(
            hasError: state.status == UserStatus.failure,
            onRetry: _retryFetch,
          );
        }
        final user = state.users[index];
        return UserListItem(user: user, onTap: () => _openEditPage(user));
      },
    );
  }
}