import 'package:flutter_test_gias/models/userDetailModel.dart';

class UserFormData {
  const UserFormData({
    this.name = '',
    this.email = '',
    this.company = '',
  });

  factory UserFormData.fromDetail(UserDetailModel detail) {
    return UserFormData(
      name: detail.name ?? '',
      email: detail.email ?? '',
      company: detail.company ?? '',
    );
  }

  final String name;
  final String email;
  final String company;
}