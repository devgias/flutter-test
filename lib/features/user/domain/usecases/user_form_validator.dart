import 'package:dartz/dartz.dart';
import 'package:flutter_test_quiz/common/common.dart';
import 'package:flutter_test_quiz/features/user/user.dart';
import 'package:flutter_test_quiz/utils/utils.dart';

/// Business rules shared by the add and edit use cases.
mixin UserFormValidator {
  static final _emailRegex = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');

  /// Trims every field, lower-cases the email and rejects invalid input.
  Either<Failure, UserFormEntity> normalize(UserFormEntity form) {
    final name = form.name.trim();
    final email = form.email.trim().toLowerCase();

    if (name.isEmpty) return left(ValidationFailure('Name is required'));
    if (!_emailRegex.hasMatch(email)) {
      return left(ValidationFailure('Email is not valid'));
    }

    return right(
      UserFormEntity(
        name: name,
        email: email,
        company: form.company.nullIfBlank,
      ),
    );
  }
}
