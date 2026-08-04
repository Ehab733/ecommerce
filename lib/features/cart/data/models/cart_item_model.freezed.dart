// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CartItemModel {

 int get count;@JsonKey(name: '_id') String get id; CartProductModel get product; double get price;
/// Create a copy of CartItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CartItemModelCopyWith<CartItemModel> get copyWith => _$CartItemModelCopyWithImpl<CartItemModel>(this as CartItemModel, _$identity);

  /// Serializes this CartItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartItemModel&&(identical(other.count, count) || other.count == count)&&(identical(other.id, id) || other.id == id)&&(identical(other.product, product) || other.product == product)&&(identical(other.price, price) || other.price == price));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count,id,product,price);

@override
String toString() {
  return 'CartItemModel(count: $count, id: $id, product: $product, price: $price)';
}


}

/// @nodoc
abstract mixin class $CartItemModelCopyWith<$Res>  {
  factory $CartItemModelCopyWith(CartItemModel value, $Res Function(CartItemModel) _then) = _$CartItemModelCopyWithImpl;
@useResult
$Res call({
 int count,@JsonKey(name: '_id') String id, CartProductModel product, double price
});


$CartProductModelCopyWith<$Res> get product;

}
/// @nodoc
class _$CartItemModelCopyWithImpl<$Res>
    implements $CartItemModelCopyWith<$Res> {
  _$CartItemModelCopyWithImpl(this._self, this._then);

  final CartItemModel _self;
  final $Res Function(CartItemModel) _then;

/// Create a copy of CartItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? count = null,Object? id = null,Object? product = null,Object? price = null,}) {
  return _then(CartItemModel(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as CartProductModel,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,
  ));
}
/// Create a copy of CartItemModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CartProductModelCopyWith<$Res> get product {
  
  return $CartProductModelCopyWith<$Res>(_self.product, (value) {
    return _then(_self.copyWith(product: value));
  });
}
}


/// Adds pattern-matching-related methods to [CartItemModel].
extension CartItemModelPatterns on CartItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CartItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CartItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CartItemModel value)  $default,){
final _that = this;
switch (_that) {
case _CartItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CartItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _CartItemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int count, @JsonKey(name: '_id')  String id,  CartProductModel product,  double price)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CartItemModel() when $default != null:
return $default(_that.count,_that.id,_that.product,_that.price);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int count, @JsonKey(name: '_id')  String id,  CartProductModel product,  double price)  $default,) {final _that = this;
switch (_that) {
case _CartItemModel():
return $default(_that.count,_that.id,_that.product,_that.price);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int count, @JsonKey(name: '_id')  String id,  CartProductModel product,  double price)?  $default,) {final _that = this;
switch (_that) {
case _CartItemModel() when $default != null:
return $default(_that.count,_that.id,_that.product,_that.price);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CartItemModel implements CartItemModel {
  const _CartItemModel({this.count = 0, @JsonKey(name: '_id') this.id = '', required this.product, this.price = 0.0});
  factory _CartItemModel.fromJson(Map<String, dynamic> json) => _$CartItemModelFromJson(json);

@override@JsonKey() final  int count;
@override@JsonKey(name: '_id') final  String id;
@override final  CartProductModel product;
@override@JsonKey() final  double price;

/// Create a copy of CartItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CartItemModelCopyWith<_CartItemModel> get copyWith => __$CartItemModelCopyWithImpl<_CartItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CartItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CartItemModel&&(identical(other.count, count) || other.count == count)&&(identical(other.id, id) || other.id == id)&&(identical(other.product, product) || other.product == product)&&(identical(other.price, price) || other.price == price));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count,id,product,price);

@override
String toString() {
  return 'CartItemModel(count: $count, id: $id, product: $product, price: $price)';
}


}

/// @nodoc
abstract mixin class _$CartItemModelCopyWith<$Res> implements $CartItemModelCopyWith<$Res> {
  factory _$CartItemModelCopyWith(_CartItemModel value, $Res Function(_CartItemModel) _then) = __$CartItemModelCopyWithImpl;
@override @useResult
$Res call({
 int count,@JsonKey(name: '_id') String id, CartProductModel product, double price
});


@override $CartProductModelCopyWith<$Res> get product;

}
/// @nodoc
class __$CartItemModelCopyWithImpl<$Res>
    implements _$CartItemModelCopyWith<$Res> {
  __$CartItemModelCopyWithImpl(this._self, this._then);

  final _CartItemModel _self;
  final $Res Function(_CartItemModel) _then;

/// Create a copy of CartItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? count = null,Object? id = null,Object? product = null,Object? price = null,}) {
  return _then(_CartItemModel(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as CartProductModel,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

/// Create a copy of CartItemModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CartProductModelCopyWith<$Res> get product {
  
  return $CartProductModelCopyWith<$Res>(_self.product, (value) {
    return _then(_self.copyWith(product: value));
  });
}
}

// dart format on
