// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_list_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PokemonListResponseDto {

 int get count; String? get next; String? get previous; List<PokemonListItemDto> get results;
/// Create a copy of PokemonListResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PokemonListResponseDtoCopyWith<PokemonListResponseDto> get copyWith => _$PokemonListResponseDtoCopyWithImpl<PokemonListResponseDto>(this as PokemonListResponseDto, _$identity);

  /// Serializes this PokemonListResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PokemonListResponseDto&&(identical(other.count, count) || other.count == count)&&(identical(other.next, next) || other.next == next)&&(identical(other.previous, previous) || other.previous == previous)&&const DeepCollectionEquality().equals(other.results, results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count,next,previous,const DeepCollectionEquality().hash(results));

@override
String toString() {
  return 'PokemonListResponseDto(count: $count, next: $next, previous: $previous, results: $results)';
}


}

/// @nodoc
abstract mixin class $PokemonListResponseDtoCopyWith<$Res>  {
  factory $PokemonListResponseDtoCopyWith(PokemonListResponseDto value, $Res Function(PokemonListResponseDto) _then) = _$PokemonListResponseDtoCopyWithImpl;
@useResult
$Res call({
 int count, String? next, String? previous, List<PokemonListItemDto> results
});




}
/// @nodoc
class _$PokemonListResponseDtoCopyWithImpl<$Res>
    implements $PokemonListResponseDtoCopyWith<$Res> {
  _$PokemonListResponseDtoCopyWithImpl(this._self, this._then);

  final PokemonListResponseDto _self;
  final $Res Function(PokemonListResponseDto) _then;

/// Create a copy of PokemonListResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? count = null,Object? next = freezed,Object? previous = freezed,Object? results = null,}) {
  return _then(_self.copyWith(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,next: freezed == next ? _self.next : next // ignore: cast_nullable_to_non_nullable
as String?,previous: freezed == previous ? _self.previous : previous // ignore: cast_nullable_to_non_nullable
as String?,results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<PokemonListItemDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [PokemonListResponseDto].
extension PokemonListResponseDtoPatterns on PokemonListResponseDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PokemonListResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PokemonListResponseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PokemonListResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _PokemonListResponseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PokemonListResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _PokemonListResponseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int count,  String? next,  String? previous,  List<PokemonListItemDto> results)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PokemonListResponseDto() when $default != null:
return $default(_that.count,_that.next,_that.previous,_that.results);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int count,  String? next,  String? previous,  List<PokemonListItemDto> results)  $default,) {final _that = this;
switch (_that) {
case _PokemonListResponseDto():
return $default(_that.count,_that.next,_that.previous,_that.results);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int count,  String? next,  String? previous,  List<PokemonListItemDto> results)?  $default,) {final _that = this;
switch (_that) {
case _PokemonListResponseDto() when $default != null:
return $default(_that.count,_that.next,_that.previous,_that.results);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PokemonListResponseDto implements PokemonListResponseDto {
  const _PokemonListResponseDto({required this.count, this.next, this.previous, required final  List<PokemonListItemDto> results}): _results = results;
  factory _PokemonListResponseDto.fromJson(Map<String, dynamic> json) => _$PokemonListResponseDtoFromJson(json);

@override final  int count;
@override final  String? next;
@override final  String? previous;
 final  List<PokemonListItemDto> _results;
@override List<PokemonListItemDto> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}


/// Create a copy of PokemonListResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PokemonListResponseDtoCopyWith<_PokemonListResponseDto> get copyWith => __$PokemonListResponseDtoCopyWithImpl<_PokemonListResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PokemonListResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PokemonListResponseDto&&(identical(other.count, count) || other.count == count)&&(identical(other.next, next) || other.next == next)&&(identical(other.previous, previous) || other.previous == previous)&&const DeepCollectionEquality().equals(other._results, _results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count,next,previous,const DeepCollectionEquality().hash(_results));

@override
String toString() {
  return 'PokemonListResponseDto(count: $count, next: $next, previous: $previous, results: $results)';
}


}

/// @nodoc
abstract mixin class _$PokemonListResponseDtoCopyWith<$Res> implements $PokemonListResponseDtoCopyWith<$Res> {
  factory _$PokemonListResponseDtoCopyWith(_PokemonListResponseDto value, $Res Function(_PokemonListResponseDto) _then) = __$PokemonListResponseDtoCopyWithImpl;
@override @useResult
$Res call({
 int count, String? next, String? previous, List<PokemonListItemDto> results
});




}
/// @nodoc
class __$PokemonListResponseDtoCopyWithImpl<$Res>
    implements _$PokemonListResponseDtoCopyWith<$Res> {
  __$PokemonListResponseDtoCopyWithImpl(this._self, this._then);

  final _PokemonListResponseDto _self;
  final $Res Function(_PokemonListResponseDto) _then;

/// Create a copy of PokemonListResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? count = null,Object? next = freezed,Object? previous = freezed,Object? results = null,}) {
  return _then(_PokemonListResponseDto(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,next: freezed == next ? _self.next : next // ignore: cast_nullable_to_non_nullable
as String?,previous: freezed == previous ? _self.previous : previous // ignore: cast_nullable_to_non_nullable
as String?,results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<PokemonListItemDto>,
  ));
}


}


/// @nodoc
mixin _$PokemonListItemDto {

 String get name; String get url;
/// Create a copy of PokemonListItemDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PokemonListItemDtoCopyWith<PokemonListItemDto> get copyWith => _$PokemonListItemDtoCopyWithImpl<PokemonListItemDto>(this as PokemonListItemDto, _$identity);

  /// Serializes this PokemonListItemDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PokemonListItemDto&&(identical(other.name, name) || other.name == name)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,url);

@override
String toString() {
  return 'PokemonListItemDto(name: $name, url: $url)';
}


}

/// @nodoc
abstract mixin class $PokemonListItemDtoCopyWith<$Res>  {
  factory $PokemonListItemDtoCopyWith(PokemonListItemDto value, $Res Function(PokemonListItemDto) _then) = _$PokemonListItemDtoCopyWithImpl;
@useResult
$Res call({
 String name, String url
});




}
/// @nodoc
class _$PokemonListItemDtoCopyWithImpl<$Res>
    implements $PokemonListItemDtoCopyWith<$Res> {
  _$PokemonListItemDtoCopyWithImpl(this._self, this._then);

  final PokemonListItemDto _self;
  final $Res Function(PokemonListItemDto) _then;

/// Create a copy of PokemonListItemDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? url = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PokemonListItemDto].
extension PokemonListItemDtoPatterns on PokemonListItemDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PokemonListItemDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PokemonListItemDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PokemonListItemDto value)  $default,){
final _that = this;
switch (_that) {
case _PokemonListItemDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PokemonListItemDto value)?  $default,){
final _that = this;
switch (_that) {
case _PokemonListItemDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String url)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PokemonListItemDto() when $default != null:
return $default(_that.name,_that.url);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String url)  $default,) {final _that = this;
switch (_that) {
case _PokemonListItemDto():
return $default(_that.name,_that.url);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String url)?  $default,) {final _that = this;
switch (_that) {
case _PokemonListItemDto() when $default != null:
return $default(_that.name,_that.url);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PokemonListItemDto extends PokemonListItemDto {
  const _PokemonListItemDto({required this.name, required this.url}): super._();
  factory _PokemonListItemDto.fromJson(Map<String, dynamic> json) => _$PokemonListItemDtoFromJson(json);

@override final  String name;
@override final  String url;

/// Create a copy of PokemonListItemDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PokemonListItemDtoCopyWith<_PokemonListItemDto> get copyWith => __$PokemonListItemDtoCopyWithImpl<_PokemonListItemDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PokemonListItemDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PokemonListItemDto&&(identical(other.name, name) || other.name == name)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,url);

@override
String toString() {
  return 'PokemonListItemDto(name: $name, url: $url)';
}


}

/// @nodoc
abstract mixin class _$PokemonListItemDtoCopyWith<$Res> implements $PokemonListItemDtoCopyWith<$Res> {
  factory _$PokemonListItemDtoCopyWith(_PokemonListItemDto value, $Res Function(_PokemonListItemDto) _then) = __$PokemonListItemDtoCopyWithImpl;
@override @useResult
$Res call({
 String name, String url
});




}
/// @nodoc
class __$PokemonListItemDtoCopyWithImpl<$Res>
    implements _$PokemonListItemDtoCopyWith<$Res> {
  __$PokemonListItemDtoCopyWithImpl(this._self, this._then);

  final _PokemonListItemDto _self;
  final $Res Function(_PokemonListItemDto) _then;

/// Create a copy of PokemonListItemDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? url = null,}) {
  return _then(_PokemonListItemDto(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
