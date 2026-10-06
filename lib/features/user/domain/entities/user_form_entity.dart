import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_form_entity.freezed.dart';

/// Values submitted from the add / edit user form.
@freezed
abstract class UserFormEntity with _$UserFormEntity {
  const factory UserFormEntity({
    required String name,
    required String email,
    String? company,
  }) = _UserFormEntity;
}
