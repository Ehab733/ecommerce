// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CartModel {

@JsonKey(name: '_id') String get id; String get cartOwner; List<CartItemModel> get products; double get totalCartPrice;
/// Create a copy of CartModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CartModelCopyWith<CartModel> get copyWith => _$CartModelCopyWithImpl<CartModel>(this as CartModel, _$identity);

  /// Serializes this CartModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartModel&&(identical(other.id, id) || other.id == id)&&(identical(other.cartOwner, cartOwner) || other.cartOwner == cartOwner)&&const DeepCollectionEquality().equals(other.products, products)&&(identical(other.totalCartPrice, totalCartPrice) || other.totalCartPrice == totalCartPrice));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,cartOwner,const DeepCollectionEquality().hash(products),totalCartPrice);

@override
String toString() {
  return 'CartModel(id: $id, cartOwner: $cartOwner, products: $products, totalCartPrice: $totalCartPrice)';
}


}

/// @nodoc
abstract mixin class $CartModelCopyWith<$Res>  {
  factory $CartModelCopyWith(CartModel value, $Res Function(CartModel) _then) = _$CartModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String id, String cartOwner, List<CartItemModel> products, double totalCartPrice
});




}
/// @nodoc
class _$CartModelCopyWithImpl<$Res>
    implements $CartModelCopyWith<$Res> {
  _$CartModelCopyWithImpl(this._self, this._then);

  final CartModel _self;
  final $Res Function(CartModel) _then;

/// Create a copy of CartModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? cartOwner = null,Object? products = null,Object? totalCartPrice = null,}) {
  return _then(CartModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,cartOwner: null == cartOwner ? _self.cartOwner : cartOwner // ignore: cast_nullable_to_non_nullable
as String,products: null == products ? _self.products : products // ignore: cast_nullable_to_non_nullable
as List<CartItemModel>,totalCartPrice: null == totalCartPrice ? _self.totalCartPrice : totalCartPrice // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [CartModel].
extension CartModelPatterns on CartModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CartModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CartModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CartModel value)  $default,){
final _that = this;
switch (_that) {
case _CartModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CartModel value)?  $default,){
final _that = this;
switch (_that) {
case _CartModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String id,  String cartOwner,  List<CartItemModel> products,  double totalCartPrice)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CartModel() when $default != null:
return $default(_that.id,_that.cartOwner,_that.products,_that.totalCartPrice);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String id,  String cartOwner,  List<CartItemModel> products,  double totalCartPrice)  $default,) {final _that = this;
switch (_that) {
case _CartModel():
return $default(_that.id,_that.cartOwner,_that.products,_that.totalCartPrice);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: '_id')  String id,  String cartOwner,  List<CartItemModel> products,  double totalCartPrice)?  $default,) {final _that = this;
switch (_that) {
case _CartModel() when $default != null:
return $default(_that.id,_that.cartOwner,_that.products,_that.totalCartPrice);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CartModel implements CartModel {
  const _CartModel({@JsonKey(name: '_id') this.id = '', this.cartOwner = '',  List<CartItemModel> products = const [], this.totalCartPrice = 0.0}): _products = products;
  factory _CartModel.fromJson(Map<String, dynamic> json) => _$CartModelFromJson(json);

@override@JsonKey(name: '_id') final  String id;
@override@JsonKey() final  String cartOwner;
 final  List<CartItemModel> _products;
@override@JsonKey() List<CartItemModel> get products {
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_products);
}

@override@JsonKey() final  double totalCartPrice;

/// Create a copy of CartModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CartModelCopyWith<_CartModel> get copyWith => __$CartModelCopyWithImpl<_CartModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CartModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CartModel&&(identical(other.id, id) || other.id == id)&&(identical(other.cartOwner, cartOwner) || other.cartOwner == cartOwner)&&const DeepCollectionEquality().equals(other._products, _products)&&(identical(other.totalCartPrice, totalCartPrice) || other.totalCartPrice == totalCartPrice));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,cartOwner,const DeepCollectionEquality().hash(_products),totalCartPrice);

@override
String toString() {
  return 'CartModel(id: $id, cartOwner: $cartOwner, products: $products, totalCartPrice: $totalCartPrice)';
}


}

/// @nodoc
abstract mixin class _$CartModelCopyWith<$Res> implements $CartModelCopyWith<$Res> {
  factory _$CartModelCopyWith(_CartModel value, $Res Function(_CartModel) _then) = __$CartModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String id, String cartOwner, List<CartItemModel> products, double totalCartPrice
});




}
/// @nodoc
class __$CartModelCopyWithImpl<$Res>
    implements _$CartModelCopyWith<$Res> {
  __$CartModelCopyWithImpl(this._self, this._then);

  final _CartModel _self;
  final $Res Function(_CartModel) _then;

/// Create a copy of CartModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? cartOwner = null,Object? products = null,Object? totalCartPrice = null,}) {
  return _then(_CartModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,cartOwner: null == cartOwner ? _self.cartOwner : cartOwner // ignore: cast_nullable_to_non_nullable
as String,products: null == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<CartItemModel>,totalCartPrice: null == totalCartPrice ? _self.totalCartPrice : totalCartPrice // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
