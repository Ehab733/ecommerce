// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'network_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NetworkState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NetworkState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NetworkState()';
}


}

/// @nodoc
class $NetworkStateCopyWith<$Res>  {
$NetworkStateCopyWith(NetworkState _, $Res Function(NetworkState) __);
}


/// Adds pattern-matching-related methods to [NetworkState].
extension NetworkStatePatterns on NetworkState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _initial value)?  initial,TResult Function( _connected value)?  connected,TResult Function( _disConnected value)?  disConnected,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _initial() when initial != null:
return initial(_that);case _connected() when connected != null:
return connected(_that);case _disConnected() when disConnected != null:
return disConnected(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _initial value)  initial,required TResult Function( _connected value)  connected,required TResult Function( _disConnected value)  disConnected,}){
final _that = this;
switch (_that) {
case _initial():
return initial(_that);case _connected():
return connected(_that);case _disConnected():
return disConnected(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _initial value)?  initial,TResult? Function( _connected value)?  connected,TResult? Function( _disConnected value)?  disConnected,}){
final _that = this;
switch (_that) {
case _initial() when initial != null:
return initial(_that);case _connected() when connected != null:
return connected(_that);case _disConnected() when disConnected != null:
return disConnected(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  connected,TResult Function()?  disConnected,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _initial() when initial != null:
return initial();case _connected() when connected != null:
return connected();case _disConnected() when disConnected != null:
return disConnected();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  connected,required TResult Function()  disConnected,}) {final _that = this;
switch (_that) {
case _initial():
return initial();case _connected():
return connected();case _disConnected():
return disConnected();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  connected,TResult? Function()?  disConnected,}) {final _that = this;
switch (_that) {
case _initial() when initial != null:
return initial();case _connected() when connected != null:
return connected();case _disConnected() when disConnected != null:
return disConnected();case _:
  return null;

}
}

}

/// @nodoc


class _initial implements NetworkState {
  const _initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NetworkState.initial()';
}


}




/// @nodoc


class _connected implements NetworkState {
  const _connected();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _connected);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NetworkState.connected()';
}


}




/// @nodoc


class _disConnected implements NetworkState {
  const _disConnected();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _disConnected);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NetworkState.disConnected()';
}


}




// dart format on
