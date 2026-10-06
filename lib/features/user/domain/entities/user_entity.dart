import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';

/// Item shown on the user list.
@freezed
abstract class UserEntity with _$UserEntity {
  const factory UserEntity({
    required int id,
    required String login,
    required String avatarUrl,
    required String type,

    /// `true` when the user was created in-app and only exists locally.
    @Default(false) bool isLocal,
  }) = _UserEntity;
}
