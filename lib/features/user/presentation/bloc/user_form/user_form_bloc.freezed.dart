// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_form_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserFormEvent {

 UserFormEntity get form;
/// Create a copy of UserFormEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserFormEventCopyWith<UserFormEvent> get copyWith => _$UserFormEventCopyWithImpl<UserFormEvent>(this as UserFormEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserFormEvent&&(identical(other.form, form) || other.form == form));
}


@override
int get hashCode => Object.hash(runtimeType,form);

@override
String toString() {
  return 'UserFormEvent(form: $form)';
}


}

/// @nodoc
abstract mixin class $UserFormEventCopyWith<$Res>  {
  factory $UserFormEventCopyWith(UserFormEvent value, $Res Function(UserFormEvent) _then) = _$UserFormEventCopyWithImpl;
@useResult
$Res call({
 UserFormEntity form
});


$UserFormEntityCopyWith<$Res> get form;

}
/// @nodoc
class _$UserFormEventCopyWithImpl<$Res>
    implements $UserFormEventCopyWith<$Res> {
  _$UserFormEventCopyWithImpl(this._self, this._then);

  final UserFormEvent _self;
  final $Res Function(UserFormEvent) _then;

/// Create a copy of UserFormEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? form = null,}) {
  return _then(_self.copyWith(
form: null == form ? _self.form : form // ignore: cast_nullable_to_non_nullable
as UserFormEntity,
  ));
}
/// Create a copy of UserFormEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserFormEntityCopyWith<$Res> get form {
  
  return $UserFormEntityCopyWith<$Res>(_self.form, (value) {
    return _then(_self.copyWith(form: value));
  });
}
}


/// Adds pattern-matching-related methods to [UserFormEvent].
extension UserFormEventPatterns on UserFormEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _AddUser value)?  addUser,TResult Function( _UpdateUser value)?  updateUser,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddUser() when addUser != null:
return addUser(_that);case _UpdateUser() when updateUser != null:
return updateUser(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _AddUser value)  addUser,required TResult Function( _UpdateUser value)  updateUser,}){
final _that = this;
switch (_that) {
case _AddUser():
return addUser(_that);case _UpdateUser():
return updateUser(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _AddUser value)?  addUser,TResult? Function( _UpdateUser value)?  updateUser,}){
final _that = this;
switch (_that) {
case _AddUser() when addUser != null:
return addUser(_that);case _UpdateUser() when updateUser != null:
return updateUser(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( UserFormEntity form)?  addUser,TResult Function( UserDetailEntity user,  UserFormEntity form)?  updateUser,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddUser() when addUser != null:
return addUser(_that.form);case _UpdateUser() when updateUser != null:
return updateUser(_that.user,_that.form);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( UserFormEntity form)  addUser,required TResult Function( UserDetailEntity user,  UserFormEntity form)  updateUser,}) {final _that = this;
switch (_that) {
case _AddUser():
return addUser(_that.form);case _UpdateUser():
return updateUser(_that.user,_that.form);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( UserFormEntity form)?  addUser,TResult? Function( UserDetailEntity user,  UserFormEntity form)?  updateUser,}) {final _that = this;
switch (_that) {
case _AddUser() when addUser != null:
return addUser(_that.form);case _UpdateUser() when updateUser != null:
return updateUser(_that.user,_that.form);case _:
  return null;

}
}

}

/// @nodoc


class _AddUser implements UserFormEvent {
  const _AddUser(this.form);
  

@override final  UserFormEntity form;

/// Create a copy of UserFormEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddUserCopyWith<_AddUser> get copyWith => __$AddUserCopyWithImpl<_AddUser>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddUser&&(identical(other.form, form) || other.form == form));
}


@override
int get hashCode => Object.hash(runtimeType,form);

@override
String toString() {
  return 'UserFormEvent.addUser(form: $form)';
}


}

/// @nodoc
abstract mixin class _$AddUserCopyWith<$Res> implements $UserFormEventCopyWith<$Res> {
  factory _$AddUserCopyWith(_AddUser value, $Res Function(_AddUser) _then) = __$AddUserCopyWithImpl;
@override @useResult
$Res call({
 UserFormEntity form
});


@override $UserFormEntityCopyWith<$Res> get form;

}
/// @nodoc
class __$AddUserCopyWithImpl<$Res>
    implements _$AddUserCopyWith<$Res> {
  __$AddUserCopyWithImpl(this._self, this._then);

  final _AddUser _self;
  final $Res Function(_AddUser) _then;

/// Create a copy of UserFormEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? form = null,}) {
  return _then(_AddUser(
null == form ? _self.form : form // ignore: cast_nullable_to_non_nullable
as UserFormEntity,
  ));
}

/// Create a copy of UserFormEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserFormEntityCopyWith<$Res> get form {
  
  return $UserFormEntityCopyWith<$Res>(_self.form, (value) {
    return _then(_self.copyWith(form: value));
  });
}
}

/// @nodoc


class _UpdateUser implements UserFormEvent {
  const _UpdateUser({required this.user, required this.form});
  

 final  UserDetailEntity user;
@override final  UserFormEntity form;

/// Create a copy of UserFormEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateUserCopyWith<_UpdateUser> get copyWith => __$UpdateUserCopyWithImpl<_UpdateUser>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateUser&&(identical(other.user, user) || other.user == user)&&(identical(other.form, form) || other.form == form));
}


@override
int get hashCode => Object.hash(runtimeType,user,form);

@override
String toString() {
  return 'UserFormEvent.updateUser(user: $user, form: $form)';
}


}

/// @nodoc
abstract mixin class _$UpdateUserCopyWith<$Res> implements $UserFormEventCopyWith<$Res> {
  factory _$UpdateUserCopyWith(_UpdateUser value, $Res Function(_UpdateUser) _then) = __$UpdateUserCopyWithImpl;
@override @useResult
$Res call({
 UserDetailEntity user, UserFormEntity form
});


$UserDetailEntityCopyWith<$Res> get user;@override $UserFormEntityCopyWith<$Res> get form;

}
/// @nodoc
class __$UpdateUserCopyWithImpl<$Res>
    implements _$UpdateUserCopyWith<$Res> {
  __$UpdateUserCopyWithImpl(this._self, this._then);

  final _UpdateUser _self;
  final $Res Function(_UpdateUser) _then;

/// Create a copy of UserFormEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? user = null,Object? form = null,}) {
  return _then(_UpdateUser(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserDetailEntity,form: null == form ? _self.form : form // ignore: cast_nullable_to_non_nullable
as UserFormEntity,
  ));
}

/// Create a copy of UserFormEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserDetailEntityCopyWith<$Res> get user {
  
  return $UserDetailEntityCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of UserFormEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserFormEntityCopyWith<$Res> get form {
  
  return $UserFormEntityCopyWith<$Res>(_self.form, (value) {
    return _then(_self.copyWith(form: value));
  });
}
}

/// @nodoc
mixin _$UserFormState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserFormState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserFormState()';
}


}

/// @nodoc
class $UserFormStateCopyWith<$Res>  {
$UserFormStateCopyWith(UserFormState _, $Res Function(UserFormState) __);
}


/// Adds pattern-matching-related methods to [UserFormState].
extension UserFormStatePatterns on UserFormState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Submitting value)?  submitting,TResult Function( _Success value)?  success,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Submitting() when submitting != null:
return submitting(_that);case _Success() when success != null:
return success(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Submitting value)  submitting,required TResult Function( _Success value)  success,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Submitting():
return submitting(_that);case _Success():
return success(_that);case _Error():
return error(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Submitting value)?  submitting,TResult? Function( _Success value)?  success,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Submitting() when submitting != null:
return submitting(_that);case _Success() when success != null:
return success(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  submitting,TResult Function( UserDetailEntity user)?  success,TResult Function( Failure failure)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Submitting() when submitting != null:
return submitting();case _Success() when success != null:
return success(_that.user);case _Error() when error != null:
return error(_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  submitting,required TResult Function( UserDetailEntity user)  success,required TResult Function( Failure failure)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Submitting():
return submitting();case _Success():
return success(_that.user);case _Error():
return error(_that.failure);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  submitting,TResult? Function( UserDetailEntity user)?  success,TResult? Function( Failure failure)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Submitting() when submitting != null:
return submitting();case _Success() when success != null:
return success(_that.user);case _Error() when error != null:
return error(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements UserFormState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserFormState.initial()';
}


}




/// @nodoc


class _Submitting implements UserFormState {
  const _Submitting();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Submitting);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserFormState.submitting()';
}


}




/// @nodoc


class _Success implements UserFormState {
  const _Success(this.user);
  

 final  UserDetailEntity user;

/// Create a copy of UserFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessCopyWith<_Success> get copyWith => __$SuccessCopyWithImpl<_Success>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'UserFormState.success(user: $user)';
}


}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res> implements $UserFormStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) _then) = __$SuccessCopyWithImpl;
@useResult
$Res call({
 UserDetailEntity user
});


$UserDetailEntityCopyWith<$Res> get user;

}
/// @nodoc
class __$SuccessCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success _self;
  final $Res Function(_Success) _then;

/// Create a copy of UserFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(_Success(
null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserDetailEntity,
  ));
}

/// Create a copy of UserFormState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserDetailEntityCopyWith<$Res> get user {
  
  return $UserDetailEntityCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

/// @nodoc


class _Error implements UserFormState {
  const _Error(this.failure);
  

 final  Failure failure;

/// Create a copy of UserFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'UserFormState.error(failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $UserFormStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 Failure failure
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of UserFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(_Error(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

// dart format on
