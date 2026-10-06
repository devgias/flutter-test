// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_detail_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserDetailEntity {

 int get id; String get login; String get avatarUrl; String get type; String? get name; String? get email; String? get company; bool get isLocal;
/// Create a copy of UserDetailEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserDetailEntityCopyWith<UserDetailEntity> get copyWith => _$UserDetailEntityCopyWithImpl<UserDetailEntity>(this as UserDetailEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserDetailEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.login, login) || other.login == login)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.type, type) || other.type == type)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.company, company) || other.company == company)&&(identical(other.isLocal, isLocal) || other.isLocal == isLocal));
}


@override
int get hashCode => Object.hash(runtimeType,id,login,avatarUrl,type,name,email,company,isLocal);

@override
String toString() {
  return 'UserDetailEntity(id: $id, login: $login, avatarUrl: $avatarUrl, type: $type, name: $name, email: $email, company: $company, isLocal: $isLocal)';
}


}

/// @nodoc
abstract mixin class $UserDetailEntityCopyWith<$Res>  {
  factory $UserDetailEntityCopyWith(UserDetailEntity value, $Res Function(UserDetailEntity) _then) = _$UserDetailEntityCopyWithImpl;
@useResult
$Res call({
 int id, String login, String avatarUrl, String type, String? name, String? email, String? company, bool isLocal
});




}
/// @nodoc
class _$UserDetailEntityCopyWithImpl<$Res>
    implements $UserDetailEntityCopyWith<$Res> {
  _$UserDetailEntityCopyWithImpl(this._self, this._then);

  final UserDetailEntity _self;
  final $Res Function(UserDetailEntity) _then;

/// Create a copy of UserDetailEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? login = null,Object? avatarUrl = null,Object? type = null,Object? name = freezed,Object? email = freezed,Object? company = freezed,Object? isLocal = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,login: null == login ? _self.login : login // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: null == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,company: freezed == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as String?,isLocal: null == isLocal ? _self.isLocal : isLocal // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [UserDetailEntity].
extension UserDetailEntityPatterns on UserDetailEntity {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserDetailEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserDetailEntity() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserDetailEntity value)  $default,){
final _that = this;
switch (_that) {
case _UserDetailEntity():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserDetailEntity value)?  $default,){
final _that = this;
switch (_that) {
case _UserDetailEntity() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String login,  String avatarUrl,  String type,  String? name,  String? email,  String? company,  bool isLocal)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserDetailEntity() when $default != null:
return $default(_that.id,_that.login,_that.avatarUrl,_that.type,_that.name,_that.email,_that.company,_that.isLocal);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String login,  String avatarUrl,  String type,  String? name,  String? email,  String? company,  bool isLocal)  $default,) {final _that = this;
switch (_that) {
case _UserDetailEntity():
return $default(_that.id,_that.login,_that.avatarUrl,_that.type,_that.name,_that.email,_that.company,_that.isLocal);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String login,  String avatarUrl,  String type,  String? name,  String? email,  String? company,  bool isLocal)?  $default,) {final _that = this;
switch (_that) {
case _UserDetailEntity() when $default != null:
return $default(_that.id,_that.login,_that.avatarUrl,_that.type,_that.name,_that.email,_that.company,_that.isLocal);case _:
  return null;

}
}

}

/// @nodoc


class _UserDetailEntity implements UserDetailEntity {
  const _UserDetailEntity({required this.id, required this.login, required this.avatarUrl, required this.type, this.name, this.email, this.company, this.isLocal = false});
  

@override final  int id;
@override final  String login;
@override final  String avatarUrl;
@override final  String type;
@override final  String? name;
@override final  String? email;
@override final  String? company;
@override@JsonKey() final  bool isLocal;

/// Create a copy of UserDetailEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserDetailEntityCopyWith<_UserDetailEntity> get copyWith => __$UserDetailEntityCopyWithImpl<_UserDetailEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserDetailEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.login, login) || other.login == login)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.type, type) || other.type == type)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.company, company) || other.company == company)&&(identical(other.isLocal, isLocal) || other.isLocal == isLocal));
}


@override
int get hashCode => Object.hash(runtimeType,id,login,avatarUrl,type,name,email,company,isLocal);

@override
String toString() {
  return 'UserDetailEntity(id: $id, login: $login, avatarUrl: $avatarUrl, type: $type, name: $name, email: $email, company: $company, isLocal: $isLocal)';
}


}

/// @nodoc
abstract mixin class _$UserDetailEntityCopyWith<$Res> implements $UserDetailEntityCopyWith<$Res> {
  factory _$UserDetailEntityCopyWith(_UserDetailEntity value, $Res Function(_UserDetailEntity) _then) = __$UserDetailEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String login, String avatarUrl, String type, String? name, String? email, String? company, bool isLocal
});




}
/// @nodoc
class __$UserDetailEntityCopyWithImpl<$Res>
    implements _$UserDetailEntityCopyWith<$Res> {
  __$UserDetailEntityCopyWithImpl(this._self, this._then);

  final _UserDetailEntity _self;
  final $Res Function(_UserDetailEntity) _then;

/// Create a copy of UserDetailEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? login = null,Object? avatarUrl = null,Object? type = null,Object? name = freezed,Object? email = freezed,Object? company = freezed,Object? isLocal = null,}) {
  return _then(_UserDetailEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,login: null == login ? _self.login : login // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: null == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,company: freezed == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as String?,isLocal: null == isLocal ? _self.isLocal : isLocal // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
