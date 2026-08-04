// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GetProductState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetProductState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GetProductState()';
}


}

/// @nodoc
class $GetProductStateCopyWith<$Res>  {
$GetProductStateCopyWith(GetProductState _, $Res Function(GetProductState) __);
}


/// Adds pattern-matching-related methods to [GetProductState].
extension GetProductStatePatterns on GetProductState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _inital value)?  initial,TResult Function( _loading value)?  loading,TResult Function( _error value)?  error,TResult Function( _success value)?  success,TResult Function( _quantityChanged value)?  quantityChanged,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _inital() when initial != null:
return initial(_that);case _loading() when loading != null:
return loading(_that);case _error() when error != null:
return error(_that);case _success() when success != null:
return success(_that);case _quantityChanged() when quantityChanged != null:
return quantityChanged(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _inital value)  initial,required TResult Function( _loading value)  loading,required TResult Function( _error value)  error,required TResult Function( _success value)  success,required TResult Function( _quantityChanged value)  quantityChanged,}){
final _that = this;
switch (_that) {
case _inital():
return initial(_that);case _loading():
return loading(_that);case _error():
return error(_that);case _success():
return success(_that);case _quantityChanged():
return quantityChanged(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _inital value)?  initial,TResult? Function( _loading value)?  loading,TResult? Function( _error value)?  error,TResult? Function( _success value)?  success,TResult? Function( _quantityChanged value)?  quantityChanged,}){
final _that = this;
switch (_that) {
case _inital() when initial != null:
return initial(_that);case _loading() when loading != null:
return loading(_that);case _error() when error != null:
return error(_that);case _success() when success != null:
return success(_that);case _quantityChanged() when quantityChanged != null:
return quantityChanged(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( String message)?  error,TResult Function( List<Product> products)?  success,TResult Function( int quantity)?  quantityChanged,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _inital() when initial != null:
return initial();case _loading() when loading != null:
return loading();case _error() when error != null:
return error(_that.message);case _success() when success != null:
return success(_that.products);case _quantityChanged() when quantityChanged != null:
return quantityChanged(_that.quantity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( String message)  error,required TResult Function( List<Product> products)  success,required TResult Function( int quantity)  quantityChanged,}) {final _that = this;
switch (_that) {
case _inital():
return initial();case _loading():
return loading();case _error():
return error(_that.message);case _success():
return success(_that.products);case _quantityChanged():
return quantityChanged(_that.quantity);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( String message)?  error,TResult? Function( List<Product> products)?  success,TResult? Function( int quantity)?  quantityChanged,}) {final _that = this;
switch (_that) {
case _inital() when initial != null:
return initial();case _loading() when loading != null:
return loading();case _error() when error != null:
return error(_that.message);case _success() when success != null:
return success(_that.products);case _quantityChanged() when quantityChanged != null:
return quantityChanged(_that.quantity);case _:
  return null;

}
}

}

/// @nodoc


class _inital implements GetProductState {
  const _inital();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _inital);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GetProductState.initial()';
}


}




/// @nodoc


class _loading implements GetProductState {
  const _loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GetProductState.loading()';
}


}




/// @nodoc


class _error implements GetProductState {
  const _error({required this.message});
  

 final  String message;

/// Create a copy of GetProductState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$errorCopyWith<_error> get copyWith => __$errorCopyWithImpl<_error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _error&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'GetProductState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$errorCopyWith<$Res> implements $GetProductStateCopyWith<$Res> {
  factory _$errorCopyWith(_error value, $Res Function(_error) _then) = __$errorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$errorCopyWithImpl<$Res>
    implements _$errorCopyWith<$Res> {
  __$errorCopyWithImpl(this._self, this._then);

  final _error _self;
  final $Res Function(_error) _then;

/// Create a copy of GetProductState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_error(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _success implements GetProductState {
  const _success({required  List<Product> products}): _products = products;
  

 final  List<Product> _products;
 List<Product> get products {
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_products);
}


/// Create a copy of GetProductState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$successCopyWith<_success> get copyWith => __$successCopyWithImpl<_success>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _success&&const DeepCollectionEquality().equals(other._products, _products));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_products));

@override
String toString() {
  return 'GetProductState.success(products: $products)';
}


}

/// @nodoc
abstract mixin class _$successCopyWith<$Res> implements $GetProductStateCopyWith<$Res> {
  factory _$successCopyWith(_success value, $Res Function(_success) _then) = __$successCopyWithImpl;
@useResult
$Res call({
 List<Product> products
});




}
/// @nodoc
class __$successCopyWithImpl<$Res>
    implements _$successCopyWith<$Res> {
  __$successCopyWithImpl(this._self, this._then);

  final _success _self;
  final $Res Function(_success) _then;

/// Create a copy of GetProductState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? products = null,}) {
  return _then(_success(
products: null == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<Product>,
  ));
}


}

/// @nodoc


class _quantityChanged implements GetProductState {
  const _quantityChanged({required this.quantity});
  

 final  int quantity;

/// Create a copy of GetProductState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$quantityChangedCopyWith<_quantityChanged> get copyWith => __$quantityChangedCopyWithImpl<_quantityChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _quantityChanged&&(identical(other.quantity, quantity) || other.quantity == quantity));
}


@override
int get hashCode => Object.hash(runtimeType,quantity);

@override
String toString() {
  return 'GetProductState.quantityChanged(quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class _$quantityChangedCopyWith<$Res> implements $GetProductStateCopyWith<$Res> {
  factory _$quantityChangedCopyWith(_quantityChanged value, $Res Function(_quantityChanged) _then) = __$quantityChangedCopyWithImpl;
@useResult
$Res call({
 int quantity
});




}
/// @nodoc
class __$quantityChangedCopyWithImpl<$Res>
    implements _$quantityChangedCopyWith<$Res> {
  __$quantityChangedCopyWithImpl(this._self, this._then);

  final _quantityChanged _self;
  final $Res Function(_quantityChanged) _then;

/// Create a copy of GetProductState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? quantity = null,}) {
  return _then(_quantityChanged(
quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
