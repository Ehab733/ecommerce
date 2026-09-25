// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_cubit_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeCubitState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeCubitState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeCubitState()';
}


}

/// @nodoc
class $HomeCubitStateCopyWith<$Res>  {
$HomeCubitStateCopyWith(HomeCubitState _, $Res Function(HomeCubitState) __);
}


/// Adds pattern-matching-related methods to [HomeCubitState].
extension HomeCubitStatePatterns on HomeCubitState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _initial value)?  homeCubitInitial,TResult Function( _getCategoriesLoading value)?  getCategoriesLoading,TResult Function( _getCategoriesFailure value)?  getCategoriesFailure,TResult Function( _getCategoriesSuccess value)?  getCategoriesSuccess,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _initial() when homeCubitInitial != null:
return homeCubitInitial(_that);case _getCategoriesLoading() when getCategoriesLoading != null:
return getCategoriesLoading(_that);case _getCategoriesFailure() when getCategoriesFailure != null:
return getCategoriesFailure(_that);case _getCategoriesSuccess() when getCategoriesSuccess != null:
return getCategoriesSuccess(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _initial value)  homeCubitInitial,required TResult Function( _getCategoriesLoading value)  getCategoriesLoading,required TResult Function( _getCategoriesFailure value)  getCategoriesFailure,required TResult Function( _getCategoriesSuccess value)  getCategoriesSuccess,}){
final _that = this;
switch (_that) {
case _initial():
return homeCubitInitial(_that);case _getCategoriesLoading():
return getCategoriesLoading(_that);case _getCategoriesFailure():
return getCategoriesFailure(_that);case _getCategoriesSuccess():
return getCategoriesSuccess(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _initial value)?  homeCubitInitial,TResult? Function( _getCategoriesLoading value)?  getCategoriesLoading,TResult? Function( _getCategoriesFailure value)?  getCategoriesFailure,TResult? Function( _getCategoriesSuccess value)?  getCategoriesSuccess,}){
final _that = this;
switch (_that) {
case _initial() when homeCubitInitial != null:
return homeCubitInitial(_that);case _getCategoriesLoading() when getCategoriesLoading != null:
return getCategoriesLoading(_that);case _getCategoriesFailure() when getCategoriesFailure != null:
return getCategoriesFailure(_that);case _getCategoriesSuccess() when getCategoriesSuccess != null:
return getCategoriesSuccess(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  homeCubitInitial,TResult Function()?  getCategoriesLoading,TResult Function( String message)?  getCategoriesFailure,TResult Function( List<Category> categories)?  getCategoriesSuccess,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _initial() when homeCubitInitial != null:
return homeCubitInitial();case _getCategoriesLoading() when getCategoriesLoading != null:
return getCategoriesLoading();case _getCategoriesFailure() when getCategoriesFailure != null:
return getCategoriesFailure(_that.message);case _getCategoriesSuccess() when getCategoriesSuccess != null:
return getCategoriesSuccess(_that.categories);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  homeCubitInitial,required TResult Function()  getCategoriesLoading,required TResult Function( String message)  getCategoriesFailure,required TResult Function( List<Category> categories)  getCategoriesSuccess,}) {final _that = this;
switch (_that) {
case _initial():
return homeCubitInitial();case _getCategoriesLoading():
return getCategoriesLoading();case _getCategoriesFailure():
return getCategoriesFailure(_that.message);case _getCategoriesSuccess():
return getCategoriesSuccess(_that.categories);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  homeCubitInitial,TResult? Function()?  getCategoriesLoading,TResult? Function( String message)?  getCategoriesFailure,TResult? Function( List<Category> categories)?  getCategoriesSuccess,}) {final _that = this;
switch (_that) {
case _initial() when homeCubitInitial != null:
return homeCubitInitial();case _getCategoriesLoading() when getCategoriesLoading != null:
return getCategoriesLoading();case _getCategoriesFailure() when getCategoriesFailure != null:
return getCategoriesFailure(_that.message);case _getCategoriesSuccess() when getCategoriesSuccess != null:
return getCategoriesSuccess(_that.categories);case _:
  return null;

}
}

}

/// @nodoc


class _initial implements HomeCubitState {
  const _initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeCubitState.homeCubitInitial()';
}


}




/// @nodoc


class _getCategoriesLoading implements HomeCubitState {
  const _getCategoriesLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _getCategoriesLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeCubitState.getCategoriesLoading()';
}


}




/// @nodoc


class _getCategoriesFailure implements HomeCubitState {
  const _getCategoriesFailure({required this.message});
  

 final  String message;

/// Create a copy of HomeCubitState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$getCategoriesFailureCopyWith<_getCategoriesFailure> get copyWith => __$getCategoriesFailureCopyWithImpl<_getCategoriesFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _getCategoriesFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'HomeCubitState.getCategoriesFailure(message: $message)';
}


}

/// @nodoc
abstract mixin class _$getCategoriesFailureCopyWith<$Res> implements $HomeCubitStateCopyWith<$Res> {
  factory _$getCategoriesFailureCopyWith(_getCategoriesFailure value, $Res Function(_getCategoriesFailure) _then) = __$getCategoriesFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$getCategoriesFailureCopyWithImpl<$Res>
    implements _$getCategoriesFailureCopyWith<$Res> {
  __$getCategoriesFailureCopyWithImpl(this._self, this._then);

  final _getCategoriesFailure _self;
  final $Res Function(_getCategoriesFailure) _then;

/// Create a copy of HomeCubitState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_getCategoriesFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _getCategoriesSuccess implements HomeCubitState {
  const _getCategoriesSuccess({required  List<Category> categories}): _categories = categories;
  

 final  List<Category> _categories;
 List<Category> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}


/// Create a copy of HomeCubitState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$getCategoriesSuccessCopyWith<_getCategoriesSuccess> get copyWith => __$getCategoriesSuccessCopyWithImpl<_getCategoriesSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _getCategoriesSuccess&&const DeepCollectionEquality().equals(other._categories, _categories));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_categories));

@override
String toString() {
  return 'HomeCubitState.getCategoriesSuccess(categories: $categories)';
}


}

/// @nodoc
abstract mixin class _$getCategoriesSuccessCopyWith<$Res> implements $HomeCubitStateCopyWith<$Res> {
  factory _$getCategoriesSuccessCopyWith(_getCategoriesSuccess value, $Res Function(_getCategoriesSuccess) _then) = __$getCategoriesSuccessCopyWithImpl;
@useResult
$Res call({
 List<Category> categories
});




}
/// @nodoc
class __$getCategoriesSuccessCopyWithImpl<$Res>
    implements _$getCategoriesSuccessCopyWith<$Res> {
  __$getCategoriesSuccessCopyWithImpl(this._self, this._then);

  final _getCategoriesSuccess _self;
  final $Res Function(_getCategoriesSuccess) _then;

/// Create a copy of HomeCubitState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? categories = null,}) {
  return _then(_getCategoriesSuccess(
categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<Category>,
  ));
}


}

// dart format on
