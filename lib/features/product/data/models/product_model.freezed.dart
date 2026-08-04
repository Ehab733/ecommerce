// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductModel {

 int get sold; List<String> get images; int get ratingsQuantity;@JsonKey(name: '_id') String get id; String get title; String get slug; String get description; int get quantity; int get price; String get imageCover; CategoryModel get category; Brand get brand; double get ratingsAverage; String get createdAt; String get updatedAt; double? get priceAfterDiscount;
/// Create a copy of ProductModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductModelCopyWith<ProductModel> get copyWith => _$ProductModelCopyWithImpl<ProductModel>(this as ProductModel, _$identity);

  /// Serializes this ProductModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductModel&&(identical(other.sold, sold) || other.sold == sold)&&const DeepCollectionEquality().equals(other.images, images)&&(identical(other.ratingsQuantity, ratingsQuantity) || other.ratingsQuantity == ratingsQuantity)&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.description, description) || other.description == description)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.price, price) || other.price == price)&&(identical(other.imageCover, imageCover) || other.imageCover == imageCover)&&(identical(other.category, category) || other.category == category)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.ratingsAverage, ratingsAverage) || other.ratingsAverage == ratingsAverage)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.priceAfterDiscount, priceAfterDiscount) || other.priceAfterDiscount == priceAfterDiscount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sold,const DeepCollectionEquality().hash(images),ratingsQuantity,id,title,slug,description,quantity,price,imageCover,category,brand,ratingsAverage,createdAt,updatedAt,priceAfterDiscount);

@override
String toString() {
  return 'ProductModel(sold: $sold, images: $images, ratingsQuantity: $ratingsQuantity, id: $id, title: $title, slug: $slug, description: $description, quantity: $quantity, price: $price, imageCover: $imageCover, category: $category, brand: $brand, ratingsAverage: $ratingsAverage, createdAt: $createdAt, updatedAt: $updatedAt, priceAfterDiscount: $priceAfterDiscount)';
}


}

/// @nodoc
abstract mixin class $ProductModelCopyWith<$Res>  {
  factory $ProductModelCopyWith(ProductModel value, $Res Function(ProductModel) _then) = _$ProductModelCopyWithImpl;
@useResult
$Res call({
 int sold, List<String> images, int ratingsQuantity,@JsonKey(name: '_id') String id, String title, String slug, String description, int quantity, int price, String imageCover, CategoryModel category, Brand brand, double ratingsAverage, String createdAt, String updatedAt, double? priceAfterDiscount
});


$CategoryModelCopyWith<$Res> get category;$BrandCopyWith<$Res> get brand;

}
/// @nodoc
class _$ProductModelCopyWithImpl<$Res>
    implements $ProductModelCopyWith<$Res> {
  _$ProductModelCopyWithImpl(this._self, this._then);

  final ProductModel _self;
  final $Res Function(ProductModel) _then;

/// Create a copy of ProductModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sold = null,Object? images = null,Object? ratingsQuantity = null,Object? id = null,Object? title = null,Object? slug = null,Object? description = null,Object? quantity = null,Object? price = null,Object? imageCover = null,Object? category = null,Object? brand = null,Object? ratingsAverage = null,Object? createdAt = null,Object? updatedAt = null,Object? priceAfterDiscount = freezed,}) {
  return _then(ProductModel(
sold: null == sold ? _self.sold : sold // ignore: cast_nullable_to_non_nullable
as int,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<String>,ratingsQuantity: null == ratingsQuantity ? _self.ratingsQuantity : ratingsQuantity // ignore: cast_nullable_to_non_nullable
as int,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,imageCover: null == imageCover ? _self.imageCover : imageCover // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryModel,brand: null == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as Brand,ratingsAverage: null == ratingsAverage ? _self.ratingsAverage : ratingsAverage // ignore: cast_nullable_to_non_nullable
as double,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,priceAfterDiscount: freezed == priceAfterDiscount ? _self.priceAfterDiscount : priceAfterDiscount // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}
/// Create a copy of ProductModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryModelCopyWith<$Res> get category {
  
  return $CategoryModelCopyWith<$Res>(_self.category, (value) {
    return _then(_self.copyWith(category: value));
  });
}/// Create a copy of ProductModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BrandCopyWith<$Res> get brand {
  
  return $BrandCopyWith<$Res>(_self.brand, (value) {
    return _then(_self.copyWith(brand: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProductModel].
extension ProductModelPatterns on ProductModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductModel value)  $default,){
final _that = this;
switch (_that) {
case _ProductModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProductModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int sold,  List<String> images,  int ratingsQuantity, @JsonKey(name: '_id')  String id,  String title,  String slug,  String description,  int quantity,  int price,  String imageCover,  CategoryModel category,  Brand brand,  double ratingsAverage,  String createdAt,  String updatedAt,  double? priceAfterDiscount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductModel() when $default != null:
return $default(_that.sold,_that.images,_that.ratingsQuantity,_that.id,_that.title,_that.slug,_that.description,_that.quantity,_that.price,_that.imageCover,_that.category,_that.brand,_that.ratingsAverage,_that.createdAt,_that.updatedAt,_that.priceAfterDiscount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int sold,  List<String> images,  int ratingsQuantity, @JsonKey(name: '_id')  String id,  String title,  String slug,  String description,  int quantity,  int price,  String imageCover,  CategoryModel category,  Brand brand,  double ratingsAverage,  String createdAt,  String updatedAt,  double? priceAfterDiscount)  $default,) {final _that = this;
switch (_that) {
case _ProductModel():
return $default(_that.sold,_that.images,_that.ratingsQuantity,_that.id,_that.title,_that.slug,_that.description,_that.quantity,_that.price,_that.imageCover,_that.category,_that.brand,_that.ratingsAverage,_that.createdAt,_that.updatedAt,_that.priceAfterDiscount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int sold,  List<String> images,  int ratingsQuantity, @JsonKey(name: '_id')  String id,  String title,  String slug,  String description,  int quantity,  int price,  String imageCover,  CategoryModel category,  Brand brand,  double ratingsAverage,  String createdAt,  String updatedAt,  double? priceAfterDiscount)?  $default,) {final _that = this;
switch (_that) {
case _ProductModel() when $default != null:
return $default(_that.sold,_that.images,_that.ratingsQuantity,_that.id,_that.title,_that.slug,_that.description,_that.quantity,_that.price,_that.imageCover,_that.category,_that.brand,_that.ratingsAverage,_that.createdAt,_that.updatedAt,_that.priceAfterDiscount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductModel implements ProductModel {
  const _ProductModel({required this.sold, required  List<String> images, required this.ratingsQuantity, @JsonKey(name: '_id') required this.id, required this.title, required this.slug, required this.description, required this.quantity, required this.price, required this.imageCover, required this.category, required this.brand, required this.ratingsAverage, required this.createdAt, required this.updatedAt, required this.priceAfterDiscount}): _images = images;
  factory _ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);

@override final  int sold;
 final  List<String> _images;
@override List<String> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}

@override final  int ratingsQuantity;
@override@JsonKey(name: '_id') final  String id;
@override final  String title;
@override final  String slug;
@override final  String description;
@override final  int quantity;
@override final  int price;
@override final  String imageCover;
@override final  CategoryModel category;
@override final  Brand brand;
@override final  double ratingsAverage;
@override final  String createdAt;
@override final  String updatedAt;
@override final  double? priceAfterDiscount;

/// Create a copy of ProductModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductModelCopyWith<_ProductModel> get copyWith => __$ProductModelCopyWithImpl<_ProductModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductModel&&(identical(other.sold, sold) || other.sold == sold)&&const DeepCollectionEquality().equals(other._images, _images)&&(identical(other.ratingsQuantity, ratingsQuantity) || other.ratingsQuantity == ratingsQuantity)&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.description, description) || other.description == description)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.price, price) || other.price == price)&&(identical(other.imageCover, imageCover) || other.imageCover == imageCover)&&(identical(other.category, category) || other.category == category)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.ratingsAverage, ratingsAverage) || other.ratingsAverage == ratingsAverage)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.priceAfterDiscount, priceAfterDiscount) || other.priceAfterDiscount == priceAfterDiscount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sold,const DeepCollectionEquality().hash(_images),ratingsQuantity,id,title,slug,description,quantity,price,imageCover,category,brand,ratingsAverage,createdAt,updatedAt,priceAfterDiscount);

@override
String toString() {
  return 'ProductModel(sold: $sold, images: $images, ratingsQuantity: $ratingsQuantity, id: $id, title: $title, slug: $slug, description: $description, quantity: $quantity, price: $price, imageCover: $imageCover, category: $category, brand: $brand, ratingsAverage: $ratingsAverage, createdAt: $createdAt, updatedAt: $updatedAt, priceAfterDiscount: $priceAfterDiscount)';
}


}

/// @nodoc
abstract mixin class _$ProductModelCopyWith<$Res> implements $ProductModelCopyWith<$Res> {
  factory _$ProductModelCopyWith(_ProductModel value, $Res Function(_ProductModel) _then) = __$ProductModelCopyWithImpl;
@override @useResult
$Res call({
 int sold, List<String> images, int ratingsQuantity,@JsonKey(name: '_id') String id, String title, String slug, String description, int quantity, int price, String imageCover, CategoryModel category, Brand brand, double ratingsAverage, String createdAt, String updatedAt, double? priceAfterDiscount
});


@override $CategoryModelCopyWith<$Res> get category;@override $BrandCopyWith<$Res> get brand;

}
/// @nodoc
class __$ProductModelCopyWithImpl<$Res>
    implements _$ProductModelCopyWith<$Res> {
  __$ProductModelCopyWithImpl(this._self, this._then);

  final _ProductModel _self;
  final $Res Function(_ProductModel) _then;

/// Create a copy of ProductModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sold = null,Object? images = null,Object? ratingsQuantity = null,Object? id = null,Object? title = null,Object? slug = null,Object? description = null,Object? quantity = null,Object? price = null,Object? imageCover = null,Object? category = null,Object? brand = null,Object? ratingsAverage = null,Object? createdAt = null,Object? updatedAt = null,Object? priceAfterDiscount = freezed,}) {
  return _then(_ProductModel(
sold: null == sold ? _self.sold : sold // ignore: cast_nullable_to_non_nullable
as int,images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<String>,ratingsQuantity: null == ratingsQuantity ? _self.ratingsQuantity : ratingsQuantity // ignore: cast_nullable_to_non_nullable
as int,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,imageCover: null == imageCover ? _self.imageCover : imageCover // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryModel,brand: null == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as Brand,ratingsAverage: null == ratingsAverage ? _self.ratingsAverage : ratingsAverage // ignore: cast_nullable_to_non_nullable
as double,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,priceAfterDiscount: freezed == priceAfterDiscount ? _self.priceAfterDiscount : priceAfterDiscount // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

/// Create a copy of ProductModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryModelCopyWith<$Res> get category {
  
  return $CategoryModelCopyWith<$Res>(_self.category, (value) {
    return _then(_self.copyWith(category: value));
  });
}/// Create a copy of ProductModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BrandCopyWith<$Res> get brand {
  
  return $BrandCopyWith<$Res>(_self.brand, (value) {
    return _then(_self.copyWith(brand: value));
  });
}
}

// dart format on
