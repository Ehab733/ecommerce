// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wishlist_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WishlistItemModel {

 List<String> get images; String? get id; String? get title; int get price; String? get imageCover;
/// Create a copy of WishlistItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WishlistItemModelCopyWith<WishlistItemModel> get copyWith => _$WishlistItemModelCopyWithImpl<WishlistItemModel>(this as WishlistItemModel, _$identity);

  /// Serializes this WishlistItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WishlistItemModel&&const DeepCollectionEquality().equals(other.images, images)&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.price, price) || other.price == price)&&(identical(other.imageCover, imageCover) || other.imageCover == imageCover));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(images),id,title,price,imageCover);

@override
String toString() {
  return 'WishlistItemModel(images: $images, id: $id, title: $title, price: $price, imageCover: $imageCover)';
}


}

/// @nodoc
abstract mixin class $WishlistItemModelCopyWith<$Res>  {
  factory $WishlistItemModelCopyWith(WishlistItemModel value, $Res Function(WishlistItemModel) _then) = _$WishlistItemModelCopyWithImpl;
@useResult
$Res call({
 List<String> images, String? id, String? title, int price, String? imageCover
});




}
/// @nodoc
class _$WishlistItemModelCopyWithImpl<$Res>
    implements $WishlistItemModelCopyWith<$Res> {
  _$WishlistItemModelCopyWithImpl(this._self, this._then);

  final WishlistItemModel _self;
  final $Res Function(WishlistItemModel) _then;

/// Create a copy of WishlistItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? images = null,Object? id = freezed,Object? title = freezed,Object? price = null,Object? imageCover = freezed,}) {
  return _then(WishlistItemModel(
images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<String>,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,imageCover: freezed == imageCover ? _self.imageCover : imageCover // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [WishlistItemModel].
extension WishlistItemModelPatterns on WishlistItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WishlistItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WishlistItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WishlistItemModel value)  $default,){
final _that = this;
switch (_that) {
case _WishlistItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WishlistItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _WishlistItemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String> images,  String? id,  String? title,  int price,  String? imageCover)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WishlistItemModel() when $default != null:
return $default(_that.images,_that.id,_that.title,_that.price,_that.imageCover);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String> images,  String? id,  String? title,  int price,  String? imageCover)  $default,) {final _that = this;
switch (_that) {
case _WishlistItemModel():
return $default(_that.images,_that.id,_that.title,_that.price,_that.imageCover);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String> images,  String? id,  String? title,  int price,  String? imageCover)?  $default,) {final _that = this;
switch (_that) {
case _WishlistItemModel() when $default != null:
return $default(_that.images,_that.id,_that.title,_that.price,_that.imageCover);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WishlistItemModel implements WishlistItemModel {
  const _WishlistItemModel({required  List<String> images, required this.id, required this.title, required this.price, required this.imageCover}): _images = images;
  factory _WishlistItemModel.fromJson(Map<String, dynamic> json) => _$WishlistItemModelFromJson(json);

 final  List<String> _images;
@override List<String> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}

@override final  String? id;
@override final  String? title;
@override final  int price;
@override final  String? imageCover;

/// Create a copy of WishlistItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WishlistItemModelCopyWith<_WishlistItemModel> get copyWith => __$WishlistItemModelCopyWithImpl<_WishlistItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WishlistItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WishlistItemModel&&const DeepCollectionEquality().equals(other._images, _images)&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.price, price) || other.price == price)&&(identical(other.imageCover, imageCover) || other.imageCover == imageCover));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_images),id,title,price,imageCover);

@override
String toString() {
  return 'WishlistItemModel(images: $images, id: $id, title: $title, price: $price, imageCover: $imageCover)';
}


}

/// @nodoc
abstract mixin class _$WishlistItemModelCopyWith<$Res> implements $WishlistItemModelCopyWith<$Res> {
  factory _$WishlistItemModelCopyWith(_WishlistItemModel value, $Res Function(_WishlistItemModel) _then) = __$WishlistItemModelCopyWithImpl;
@override @useResult
$Res call({
 List<String> images, String? id, String? title, int price, String? imageCover
});




}
/// @nodoc
class __$WishlistItemModelCopyWithImpl<$Res>
    implements _$WishlistItemModelCopyWith<$Res> {
  __$WishlistItemModelCopyWithImpl(this._self, this._then);

  final _WishlistItemModel _self;
  final $Res Function(_WishlistItemModel) _then;

/// Create a copy of WishlistItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? images = null,Object? id = freezed,Object? title = freezed,Object? price = null,Object? imageCover = freezed,}) {
  return _then(_WishlistItemModel(
images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<String>,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,imageCover: freezed == imageCover ? _self.imageCover : imageCover // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
