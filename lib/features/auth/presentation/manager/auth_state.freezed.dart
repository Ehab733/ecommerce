// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState()';
}


}

/// @nodoc
class $AuthStateCopyWith<$Res>  {
$AuthStateCopyWith(AuthState _, $Res Function(AuthState) __);
}


/// Adds pattern-matching-related methods to [AuthState].
extension AuthStatePatterns on AuthState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _RegisterLoading value)?  registerLoading,TResult Function( _RegisterSuccess value)?  registerSuccess,TResult Function( _RegisterError value)?  registerError,TResult Function( _LoginLoading value)?  loginLoading,TResult Function( _LoginSuccess value)?  loginSuccess,TResult Function( _LoginError value)?  loginError,TResult Function( _LogoutLoading value)?  logoutLoading,TResult Function( _LogoutSuccess value)?  logoutSuccess,TResult Function( _LogoutError value)?  logoutError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _RegisterLoading() when registerLoading != null:
return registerLoading(_that);case _RegisterSuccess() when registerSuccess != null:
return registerSuccess(_that);case _RegisterError() when registerError != null:
return registerError(_that);case _LoginLoading() when loginLoading != null:
return loginLoading(_that);case _LoginSuccess() when loginSuccess != null:
return loginSuccess(_that);case _LoginError() when loginError != null:
return loginError(_that);case _LogoutLoading() when logoutLoading != null:
return logoutLoading(_that);case _LogoutSuccess() when logoutSuccess != null:
return logoutSuccess(_that);case _LogoutError() when logoutError != null:
return logoutError(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _RegisterLoading value)  registerLoading,required TResult Function( _RegisterSuccess value)  registerSuccess,required TResult Function( _RegisterError value)  registerError,required TResult Function( _LoginLoading value)  loginLoading,required TResult Function( _LoginSuccess value)  loginSuccess,required TResult Function( _LoginError value)  loginError,required TResult Function( _LogoutLoading value)  logoutLoading,required TResult Function( _LogoutSuccess value)  logoutSuccess,required TResult Function( _LogoutError value)  logoutError,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _RegisterLoading():
return registerLoading(_that);case _RegisterSuccess():
return registerSuccess(_that);case _RegisterError():
return registerError(_that);case _LoginLoading():
return loginLoading(_that);case _LoginSuccess():
return loginSuccess(_that);case _LoginError():
return loginError(_that);case _LogoutLoading():
return logoutLoading(_that);case _LogoutSuccess():
return logoutSuccess(_that);case _LogoutError():
return logoutError(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _RegisterLoading value)?  registerLoading,TResult? Function( _RegisterSuccess value)?  registerSuccess,TResult? Function( _RegisterError value)?  registerError,TResult? Function( _LoginLoading value)?  loginLoading,TResult? Function( _LoginSuccess value)?  loginSuccess,TResult? Function( _LoginError value)?  loginError,TResult? Function( _LogoutLoading value)?  logoutLoading,TResult? Function( _LogoutSuccess value)?  logoutSuccess,TResult? Function( _LogoutError value)?  logoutError,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _RegisterLoading() when registerLoading != null:
return registerLoading(_that);case _RegisterSuccess() when registerSuccess != null:
return registerSuccess(_that);case _RegisterError() when registerError != null:
return registerError(_that);case _LoginLoading() when loginLoading != null:
return loginLoading(_that);case _LoginSuccess() when loginSuccess != null:
return loginSuccess(_that);case _LoginError() when loginError != null:
return loginError(_that);case _LogoutLoading() when logoutLoading != null:
return logoutLoading(_that);case _LogoutSuccess() when logoutSuccess != null:
return logoutSuccess(_that);case _LogoutError() when logoutError != null:
return logoutError(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  registerLoading,TResult Function()?  registerSuccess,TResult Function( String messageError)?  registerError,TResult Function()?  loginLoading,TResult Function()?  loginSuccess,TResult Function( String messageError)?  loginError,TResult Function()?  logoutLoading,TResult Function()?  logoutSuccess,TResult Function( String messageError)?  logoutError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _RegisterLoading() when registerLoading != null:
return registerLoading();case _RegisterSuccess() when registerSuccess != null:
return registerSuccess();case _RegisterError() when registerError != null:
return registerError(_that.messageError);case _LoginLoading() when loginLoading != null:
return loginLoading();case _LoginSuccess() when loginSuccess != null:
return loginSuccess();case _LoginError() when loginError != null:
return loginError(_that.messageError);case _LogoutLoading() when logoutLoading != null:
return logoutLoading();case _LogoutSuccess() when logoutSuccess != null:
return logoutSuccess();case _LogoutError() when logoutError != null:
return logoutError(_that.messageError);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  registerLoading,required TResult Function()  registerSuccess,required TResult Function( String messageError)  registerError,required TResult Function()  loginLoading,required TResult Function()  loginSuccess,required TResult Function( String messageError)  loginError,required TResult Function()  logoutLoading,required TResult Function()  logoutSuccess,required TResult Function( String messageError)  logoutError,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _RegisterLoading():
return registerLoading();case _RegisterSuccess():
return registerSuccess();case _RegisterError():
return registerError(_that.messageError);case _LoginLoading():
return loginLoading();case _LoginSuccess():
return loginSuccess();case _LoginError():
return loginError(_that.messageError);case _LogoutLoading():
return logoutLoading();case _LogoutSuccess():
return logoutSuccess();case _LogoutError():
return logoutError(_that.messageError);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  registerLoading,TResult? Function()?  registerSuccess,TResult? Function( String messageError)?  registerError,TResult? Function()?  loginLoading,TResult? Function()?  loginSuccess,TResult? Function( String messageError)?  loginError,TResult? Function()?  logoutLoading,TResult? Function()?  logoutSuccess,TResult? Function( String messageError)?  logoutError,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _RegisterLoading() when registerLoading != null:
return registerLoading();case _RegisterSuccess() when registerSuccess != null:
return registerSuccess();case _RegisterError() when registerError != null:
return registerError(_that.messageError);case _LoginLoading() when loginLoading != null:
return loginLoading();case _LoginSuccess() when loginSuccess != null:
return loginSuccess();case _LoginError() when loginError != null:
return loginError(_that.messageError);case _LogoutLoading() when logoutLoading != null:
return logoutLoading();case _LogoutSuccess() when logoutSuccess != null:
return logoutSuccess();case _LogoutError() when logoutError != null:
return logoutError(_that.messageError);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements AuthState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.initial()';
}


}




/// @nodoc


class _RegisterLoading implements AuthState {
  const _RegisterLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegisterLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.registerLoading()';
}


}




/// @nodoc


class _RegisterSuccess implements AuthState {
  const _RegisterSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegisterSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.registerSuccess()';
}


}




/// @nodoc


class _RegisterError implements AuthState {
  const _RegisterError({required this.messageError});
  

 final  String messageError;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegisterErrorCopyWith<_RegisterError> get copyWith => __$RegisterErrorCopyWithImpl<_RegisterError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegisterError&&(identical(other.messageError, messageError) || other.messageError == messageError));
}


@override
int get hashCode => Object.hash(runtimeType,messageError);

@override
String toString() {
  return 'AuthState.registerError(messageError: $messageError)';
}


}

/// @nodoc
abstract mixin class _$RegisterErrorCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$RegisterErrorCopyWith(_RegisterError value, $Res Function(_RegisterError) _then) = __$RegisterErrorCopyWithImpl;
@useResult
$Res call({
 String messageError
});




}
/// @nodoc
class __$RegisterErrorCopyWithImpl<$Res>
    implements _$RegisterErrorCopyWith<$Res> {
  __$RegisterErrorCopyWithImpl(this._self, this._then);

  final _RegisterError _self;
  final $Res Function(_RegisterError) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? messageError = null,}) {
  return _then(_RegisterError(
messageError: null == messageError ? _self.messageError : messageError // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _LoginLoading implements AuthState {
  const _LoginLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.loginLoading()';
}


}




/// @nodoc


class _LoginSuccess implements AuthState {
  const _LoginSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.loginSuccess()';
}


}




/// @nodoc


class _LoginError implements AuthState {
  const _LoginError({required this.messageError});
  

 final  String messageError;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginErrorCopyWith<_LoginError> get copyWith => __$LoginErrorCopyWithImpl<_LoginError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginError&&(identical(other.messageError, messageError) || other.messageError == messageError));
}


@override
int get hashCode => Object.hash(runtimeType,messageError);

@override
String toString() {
  return 'AuthState.loginError(messageError: $messageError)';
}


}

/// @nodoc
abstract mixin class _$LoginErrorCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$LoginErrorCopyWith(_LoginError value, $Res Function(_LoginError) _then) = __$LoginErrorCopyWithImpl;
@useResult
$Res call({
 String messageError
});




}
/// @nodoc
class __$LoginErrorCopyWithImpl<$Res>
    implements _$LoginErrorCopyWith<$Res> {
  __$LoginErrorCopyWithImpl(this._self, this._then);

  final _LoginError _self;
  final $Res Function(_LoginError) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? messageError = null,}) {
  return _then(_LoginError(
messageError: null == messageError ? _self.messageError : messageError // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _LogoutLoading implements AuthState {
  const _LogoutLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LogoutLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.logoutLoading()';
}


}




/// @nodoc


class _LogoutSuccess implements AuthState {
  const _LogoutSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LogoutSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.logoutSuccess()';
}


}




/// @nodoc


class _LogoutError implements AuthState {
  const _LogoutError({required this.messageError});
  

 final  String messageError;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LogoutErrorCopyWith<_LogoutError> get copyWith => __$LogoutErrorCopyWithImpl<_LogoutError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LogoutError&&(identical(other.messageError, messageError) || other.messageError == messageError));
}


@override
int get hashCode => Object.hash(runtimeType,messageError);

@override
String toString() {
  return 'AuthState.logoutError(messageError: $messageError)';
}


}

/// @nodoc
abstract mixin class _$LogoutErrorCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$LogoutErrorCopyWith(_LogoutError value, $Res Function(_LogoutError) _then) = __$LogoutErrorCopyWithImpl;
@useResult
$Res call({
 String messageError
});




}
/// @nodoc
class __$LogoutErrorCopyWithImpl<$Res>
    implements _$LogoutErrorCopyWith<$Res> {
  __$LogoutErrorCopyWithImpl(this._self, this._then);

  final _LogoutError _self;
  final $Res Function(_LogoutError) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? messageError = null,}) {
  return _then(_LogoutError(
messageError: null == messageError ? _self.messageError : messageError // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
