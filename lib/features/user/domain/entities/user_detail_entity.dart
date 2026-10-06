import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_detail_entity.freezed.dart';

@freezed
abstract class UserDetailEntity with _$UserDetailEntity {
  const factory UserDetailEntity({
    required int id,
    required String login,
    required String avatarUrl,
    required String type,
    String? name,
    String? email,
    String? company,
    @Default(false) bool isLocal,
  }) = _UserDetailEntity;
}
