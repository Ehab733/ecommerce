// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wishlist_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WishListResponse<T> {

 String get status; int? get count; String? get message; List<T>? get data;
/// Create a copy of WishListResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WishListResponseCopyWith<T, WishListResponse<T>> get copyWith => _$WishListResponseCopyWithImpl<T, WishListResponse<T>>(this as WishListResponse<T>, _$identity);

  /// Serializes this WishListResponse to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT);


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WishListResponse<T>&&(identical(other.status, status) || other.status == status)&&(identical(other.count, count) || other.count == count)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,count,message,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'WishListResponse<$T>(status: $status, count: $count, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $WishListResponseCopyWith<T,$Res>  {
  factory $WishListResponseCopyWith(WishListResponse<T> value, $Res Function(WishListResponse<T>) _then) = _$WishListResponseCopyWithImpl;
@useResult
$Res call({
 String status, int? count, String? message, List<T>? data
});




}
/// @nodoc
class _$WishListResponseCopyWithImpl<T,$Res>
    implements $WishListResponseCopyWith<T, $Res> {
  _$WishListResponseCopyWithImpl(this._self, this._then);

  final WishListResponse<T> _self;
  final $Res Function(WishListResponse<T>) _then;

/// Create a copy of WishListResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? count = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(WishListResponse(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,count: freezed == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<T>?,
  ));
}

}


/// Adds pattern-matching-related methods to [WishListResponse].
extension WishListResponsePatterns<T> on WishListResponse<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WishListResponse<T> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WishListResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WishListResponse<T> value)  $default,){
final _that = this;
switch (_that) {
case _WishListResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WishListResponse<T> value)?  $default,){
final _that = this;
switch (_that) {
case _WishListResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status,  int? count,  String? message,  List<T>? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WishListResponse() when $default != null:
return $default(_that.status,_that.count,_that.message,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status,  int? count,  String? message,  List<T>? data)  $default,) {final _that = this;
switch (_that) {
case _WishListResponse():
return $default(_that.status,_that.count,_that.message,_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status,  int? count,  String? message,  List<T>? data)?  $default,) {final _that = this;
switch (_that) {
case _WishListResponse() when $default != null:
return $default(_that.status,_that.count,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)

class _WishListResponse<T> implements WishListResponse<T> {
  const _WishListResponse({required this.status, required this.count, required this.message, required  List<T>? data}): _data = data;
  factory _WishListResponse.fromJson(Map<String, dynamic> json,T Function(Object?) fromJsonT) => _$WishListResponseFromJson(json,fromJsonT);

@override final  String status;
@override final  int? count;
@override final  String? message;
 final  List<T>? _data;
@override List<T>? get data {
  final value = _data;
  if (value == null) return null;
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of WishListResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WishListResponseCopyWith<T, _WishListResponse<T>> get copyWith => __$WishListResponseCopyWithImpl<T, _WishListResponse<T>>(this, _$identity);

@override
Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
  return _$WishListResponseToJson<T>(this, toJsonT);
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WishListResponse<T>&&(identical(other.status, status) || other.status == status)&&(identical(other.count, count) || other.count == count)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,count,message,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'WishListResponse<$T>(status: $status, count: $count, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$WishListResponseCopyWith<T,$Res> implements $WishListResponseCopyWith<T, $Res> {
  factory _$WishListResponseCopyWith(_WishListResponse<T> value, $Res Function(_WishListResponse<T>) _then) = __$WishListResponseCopyWithImpl;
@override @useResult
$Res call({
 String status, int? count, String? message, List<T>? data
});




}
/// @nodoc
class __$WishListResponseCopyWithImpl<T,$Res>
    implements _$WishListResponseCopyWith<T, $Res> {
  __$WishListResponseCopyWithImpl(this._self, this._then);

  final _WishListResponse<T> _self;
  final $Res Function(_WishListResponse<T>) _then;

/// Create a copy of WishListResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? count = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_WishListResponse<T>(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,count: freezed == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<T>?,
  ));
}


}

// dart format on
