// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CartProductModel {

@JsonKey(name: '_id') String get id; String get title; String get imageCover; double get ratingsAverage;
/// Create a copy of CartProductModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CartProductModelCopyWith<CartProductModel> get copyWith => _$CartProductModelCopyWithImpl<CartProductModel>(this as CartProductModel, _$identity);

  /// Serializes this CartProductModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartProductModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.imageCover, imageCover) || other.imageCover == imageCover)&&(identical(other.ratingsAverage, ratingsAverage) || other.ratingsAverage == ratingsAverage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,imageCover,ratingsAverage);

@override
String toString() {
  return 'CartProductModel(id: $id, title: $title, imageCover: $imageCover, ratingsAverage: $ratingsAverage)';
}


}

/// @nodoc
abstract mixin class $CartProductModelCopyWith<$Res>  {
  factory $CartProductModelCopyWith(CartProductModel value, $Res Function(CartProductModel) _then) = _$CartProductModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String id, String title, String imageCover, double ratingsAverage
});




}
/// @nodoc
class _$CartProductModelCopyWithImpl<$Res>
    implements $CartProductModelCopyWith<$Res> {
  _$CartProductModelCopyWithImpl(this._self, this._then);

  final CartProductModel _self;
  final $Res Function(CartProductModel) _then;

/// Create a copy of CartProductModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? imageCover = null,Object? ratingsAverage = null,}) {
  return _then(CartProductModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,imageCover: null == imageCover ? _self.imageCover : imageCover // ignore: cast_nullable_to_non_nullable
as String,ratingsAverage: null == ratingsAverage ? _self.ratingsAverage : ratingsAverage // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [CartProductModel].
extension CartProductModelPatterns on CartProductModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CartProductModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CartProductModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CartProductModel value)  $default,){
final _that = this;
switch (_that) {
case _CartProductModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CartProductModel value)?  $default,){
final _that = this;
switch (_that) {
case _CartProductModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String id,  String title,  String imageCover,  double ratingsAverage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CartProductModel() when $default != null:
return $default(_that.id,_that.title,_that.imageCover,_that.ratingsAverage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String id,  String title,  String imageCover,  double ratingsAverage)  $default,) {final _that = this;
switch (_that) {
case _CartProductModel():
return $default(_that.id,_that.title,_that.imageCover,_that.ratingsAverage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: '_id')  String id,  String title,  String imageCover,  double ratingsAverage)?  $default,) {final _that = this;
switch (_that) {
case _CartProductModel() when $default != null:
return $default(_that.id,_that.title,_that.imageCover,_that.ratingsAverage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CartProductModel implements CartProductModel {
  const _CartProductModel({@JsonKey(name: '_id') this.id = '', this.title = '', this.imageCover = '', this.ratingsAverage = 0.0});
  factory _CartProductModel.fromJson(Map<String, dynamic> json) => _$CartProductModelFromJson(json);

@override@JsonKey(name: '_id') final  String id;
@override@JsonKey() final  String title;
@override@JsonKey() final  String imageCover;
@override@JsonKey() final  double ratingsAverage;

/// Create a copy of CartProductModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CartProductModelCopyWith<_CartProductModel> get copyWith => __$CartProductModelCopyWithImpl<_CartProductModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CartProductModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CartProductModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.imageCover, imageCover) || other.imageCover == imageCover)&&(identical(other.ratingsAverage, ratingsAverage) || other.ratingsAverage == ratingsAverage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,imageCover,ratingsAverage);

@override
String toString() {
  return 'CartProductModel(id: $id, title: $title, imageCover: $imageCover, ratingsAverage: $ratingsAverage)';
}


}

/// @nodoc
abstract mixin class _$CartProductModelCopyWith<$Res> implements $CartProductModelCopyWith<$Res> {
  factory _$CartProductModelCopyWith(_CartProductModel value, $Res Function(_CartProductModel) _then) = __$CartProductModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String id, String title, String imageCover, double ratingsAverage
});




}
/// @nodoc
class __$CartProductModelCopyWithImpl<$Res>
    implements _$CartProductModelCopyWith<$Res> {
  __$CartProductModelCopyWithImpl(this._self, this._then);

  final _CartProductModel _self;
  final $Res Function(_CartProductModel) _then;

/// Create a copy of CartProductModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? imageCover = null,Object? ratingsAverage = null,}) {
  return _then(_CartProductModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,imageCover: null == imageCover ? _self.imageCover : imageCover // ignore: cast_nullable_to_non_nullable
as String,ratingsAverage: null == ratingsAverage ? _self.ratingsAverage : ratingsAverage // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
