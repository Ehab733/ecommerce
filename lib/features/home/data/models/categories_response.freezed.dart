// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'categories_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CategoryResponse {

 int get results; MetaData get metadata; List<CategoryModel> get data;
/// Create a copy of CategoryResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryResponseCopyWith<CategoryResponse> get copyWith => _$CategoryResponseCopyWithImpl<CategoryResponse>(this as CategoryResponse, _$identity);

  /// Serializes this CategoryResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryResponse&&(identical(other.results, results) || other.results == results)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,results,metadata,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'CategoryResponse(results: $results, metadata: $metadata, data: $data)';
}


}

/// @nodoc
abstract mixin class $CategoryResponseCopyWith<$Res>  {
  factory $CategoryResponseCopyWith(CategoryResponse value, $Res Function(CategoryResponse) _then) = _$CategoryResponseCopyWithImpl;
@useResult
$Res call({
 int results, MetaData metadata, List<CategoryModel> data
});


$MetaDataCopyWith<$Res> get metadata;

}
/// @nodoc
class _$CategoryResponseCopyWithImpl<$Res>
    implements $CategoryResponseCopyWith<$Res> {
  _$CategoryResponseCopyWithImpl(this._self, this._then);

  final CategoryResponse _self;
  final $Res Function(CategoryResponse) _then;

/// Create a copy of CategoryResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? results = null,Object? metadata = null,Object? data = null,}) {
  return _then(CategoryResponse(
results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as int,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as MetaData,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<CategoryModel>,
  ));
}
/// Create a copy of CategoryResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetaDataCopyWith<$Res> get metadata {
  
  return $MetaDataCopyWith<$Res>(_self.metadata, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}
}


/// Adds pattern-matching-related methods to [CategoryResponse].
extension CategoryResponsePatterns on CategoryResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CategoryResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CategoryResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CategoryResponse value)  $default,){
final _that = this;
switch (_that) {
case _CategoryResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CategoryResponse value)?  $default,){
final _that = this;
switch (_that) {
case _CategoryResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int results,  MetaData metadata,  List<CategoryModel> data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CategoryResponse() when $default != null:
return $default(_that.results,_that.metadata,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int results,  MetaData metadata,  List<CategoryModel> data)  $default,) {final _that = this;
switch (_that) {
case _CategoryResponse():
return $default(_that.results,_that.metadata,_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int results,  MetaData metadata,  List<CategoryModel> data)?  $default,) {final _that = this;
switch (_that) {
case _CategoryResponse() when $default != null:
return $default(_that.results,_that.metadata,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CategoryResponse implements CategoryResponse {
  const _CategoryResponse({required this.results, required this.metadata, required  List<CategoryModel> data}): _data = data;
  factory _CategoryResponse.fromJson(Map<String, dynamic> json) => _$CategoryResponseFromJson(json);

@override final  int results;
@override final  MetaData metadata;
 final  List<CategoryModel> _data;
@override List<CategoryModel> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of CategoryResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryResponseCopyWith<_CategoryResponse> get copyWith => __$CategoryResponseCopyWithImpl<_CategoryResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CategoryResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoryResponse&&(identical(other.results, results) || other.results == results)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,results,metadata,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'CategoryResponse(results: $results, metadata: $metadata, data: $data)';
}


}

/// @nodoc
abstract mixin class _$CategoryResponseCopyWith<$Res> implements $CategoryResponseCopyWith<$Res> {
  factory _$CategoryResponseCopyWith(_CategoryResponse value, $Res Function(_CategoryResponse) _then) = __$CategoryResponseCopyWithImpl;
@override @useResult
$Res call({
 int results, MetaData metadata, List<CategoryModel> data
});


@override $MetaDataCopyWith<$Res> get metadata;

}
/// @nodoc
class __$CategoryResponseCopyWithImpl<$Res>
    implements _$CategoryResponseCopyWith<$Res> {
  __$CategoryResponseCopyWithImpl(this._self, this._then);

  final _CategoryResponse _self;
  final $Res Function(_CategoryResponse) _then;

/// Create a copy of CategoryResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? results = null,Object? metadata = null,Object? data = null,}) {
  return _then(_CategoryResponse(
results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as int,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as MetaData,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<CategoryModel>,
  ));
}

/// Create a copy of CategoryResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetaDataCopyWith<$Res> get metadata {
  
  return $MetaDataCopyWith<$Res>(_self.metadata, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}
}

// dart format on
