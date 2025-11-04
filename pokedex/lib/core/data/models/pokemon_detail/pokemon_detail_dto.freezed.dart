// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_detail_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PokemonDetailDto {

 int get id; String get name; int get height; int get weight; List<PokemonTypeSlotDto> get types; List<PokemonStatDto> get stats; PokemonSpritesDto get sprites;
/// Create a copy of PokemonDetailDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PokemonDetailDtoCopyWith<PokemonDetailDto> get copyWith => _$PokemonDetailDtoCopyWithImpl<PokemonDetailDto>(this as PokemonDetailDto, _$identity);

  /// Serializes this PokemonDetailDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PokemonDetailDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.height, height) || other.height == height)&&(identical(other.weight, weight) || other.weight == weight)&&const DeepCollectionEquality().equals(other.types, types)&&const DeepCollectionEquality().equals(other.stats, stats)&&(identical(other.sprites, sprites) || other.sprites == sprites));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,height,weight,const DeepCollectionEquality().hash(types),const DeepCollectionEquality().hash(stats),sprites);

@override
String toString() {
  return 'PokemonDetailDto(id: $id, name: $name, height: $height, weight: $weight, types: $types, stats: $stats, sprites: $sprites)';
}


}

/// @nodoc
abstract mixin class $PokemonDetailDtoCopyWith<$Res>  {
  factory $PokemonDetailDtoCopyWith(PokemonDetailDto value, $Res Function(PokemonDetailDto) _then) = _$PokemonDetailDtoCopyWithImpl;
@useResult
$Res call({
 int id, String name, int height, int weight, List<PokemonTypeSlotDto> types, List<PokemonStatDto> stats, PokemonSpritesDto sprites
});


$PokemonSpritesDtoCopyWith<$Res> get sprites;

}
/// @nodoc
class _$PokemonDetailDtoCopyWithImpl<$Res>
    implements $PokemonDetailDtoCopyWith<$Res> {
  _$PokemonDetailDtoCopyWithImpl(this._self, this._then);

  final PokemonDetailDto _self;
  final $Res Function(PokemonDetailDto) _then;

/// Create a copy of PokemonDetailDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? height = null,Object? weight = null,Object? types = null,Object? stats = null,Object? sprites = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int,weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as int,types: null == types ? _self.types : types // ignore: cast_nullable_to_non_nullable
as List<PokemonTypeSlotDto>,stats: null == stats ? _self.stats : stats // ignore: cast_nullable_to_non_nullable
as List<PokemonStatDto>,sprites: null == sprites ? _self.sprites : sprites // ignore: cast_nullable_to_non_nullable
as PokemonSpritesDto,
  ));
}
/// Create a copy of PokemonDetailDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PokemonSpritesDtoCopyWith<$Res> get sprites {
  
  return $PokemonSpritesDtoCopyWith<$Res>(_self.sprites, (value) {
    return _then(_self.copyWith(sprites: value));
  });
}
}


/// Adds pattern-matching-related methods to [PokemonDetailDto].
extension PokemonDetailDtoPatterns on PokemonDetailDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PokemonDetailDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PokemonDetailDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PokemonDetailDto value)  $default,){
final _that = this;
switch (_that) {
case _PokemonDetailDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PokemonDetailDto value)?  $default,){
final _that = this;
switch (_that) {
case _PokemonDetailDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  int height,  int weight,  List<PokemonTypeSlotDto> types,  List<PokemonStatDto> stats,  PokemonSpritesDto sprites)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PokemonDetailDto() when $default != null:
return $default(_that.id,_that.name,_that.height,_that.weight,_that.types,_that.stats,_that.sprites);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  int height,  int weight,  List<PokemonTypeSlotDto> types,  List<PokemonStatDto> stats,  PokemonSpritesDto sprites)  $default,) {final _that = this;
switch (_that) {
case _PokemonDetailDto():
return $default(_that.id,_that.name,_that.height,_that.weight,_that.types,_that.stats,_that.sprites);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  int height,  int weight,  List<PokemonTypeSlotDto> types,  List<PokemonStatDto> stats,  PokemonSpritesDto sprites)?  $default,) {final _that = this;
switch (_that) {
case _PokemonDetailDto() when $default != null:
return $default(_that.id,_that.name,_that.height,_that.weight,_that.types,_that.stats,_that.sprites);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PokemonDetailDto implements PokemonDetailDto {
  const _PokemonDetailDto({required this.id, required this.name, required this.height, required this.weight, required final  List<PokemonTypeSlotDto> types, required final  List<PokemonStatDto> stats, required this.sprites}): _types = types,_stats = stats;
  factory _PokemonDetailDto.fromJson(Map<String, dynamic> json) => _$PokemonDetailDtoFromJson(json);

@override final  int id;
@override final  String name;
@override final  int height;
@override final  int weight;
 final  List<PokemonTypeSlotDto> _types;
@override List<PokemonTypeSlotDto> get types {
  if (_types is EqualUnmodifiableListView) return _types;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_types);
}

 final  List<PokemonStatDto> _stats;
@override List<PokemonStatDto> get stats {
  if (_stats is EqualUnmodifiableListView) return _stats;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_stats);
}

@override final  PokemonSpritesDto sprites;

/// Create a copy of PokemonDetailDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PokemonDetailDtoCopyWith<_PokemonDetailDto> get copyWith => __$PokemonDetailDtoCopyWithImpl<_PokemonDetailDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PokemonDetailDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PokemonDetailDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.height, height) || other.height == height)&&(identical(other.weight, weight) || other.weight == weight)&&const DeepCollectionEquality().equals(other._types, _types)&&const DeepCollectionEquality().equals(other._stats, _stats)&&(identical(other.sprites, sprites) || other.sprites == sprites));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,height,weight,const DeepCollectionEquality().hash(_types),const DeepCollectionEquality().hash(_stats),sprites);

@override
String toString() {
  return 'PokemonDetailDto(id: $id, name: $name, height: $height, weight: $weight, types: $types, stats: $stats, sprites: $sprites)';
}


}

/// @nodoc
abstract mixin class _$PokemonDetailDtoCopyWith<$Res> implements $PokemonDetailDtoCopyWith<$Res> {
  factory _$PokemonDetailDtoCopyWith(_PokemonDetailDto value, $Res Function(_PokemonDetailDto) _then) = __$PokemonDetailDtoCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, int height, int weight, List<PokemonTypeSlotDto> types, List<PokemonStatDto> stats, PokemonSpritesDto sprites
});


@override $PokemonSpritesDtoCopyWith<$Res> get sprites;

}
/// @nodoc
class __$PokemonDetailDtoCopyWithImpl<$Res>
    implements _$PokemonDetailDtoCopyWith<$Res> {
  __$PokemonDetailDtoCopyWithImpl(this._self, this._then);

  final _PokemonDetailDto _self;
  final $Res Function(_PokemonDetailDto) _then;

/// Create a copy of PokemonDetailDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? height = null,Object? weight = null,Object? types = null,Object? stats = null,Object? sprites = null,}) {
  return _then(_PokemonDetailDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int,weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as int,types: null == types ? _self._types : types // ignore: cast_nullable_to_non_nullable
as List<PokemonTypeSlotDto>,stats: null == stats ? _self._stats : stats // ignore: cast_nullable_to_non_nullable
as List<PokemonStatDto>,sprites: null == sprites ? _self.sprites : sprites // ignore: cast_nullable_to_non_nullable
as PokemonSpritesDto,
  ));
}

/// Create a copy of PokemonDetailDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PokemonSpritesDtoCopyWith<$Res> get sprites {
  
  return $PokemonSpritesDtoCopyWith<$Res>(_self.sprites, (value) {
    return _then(_self.copyWith(sprites: value));
  });
}
}


/// @nodoc
mixin _$PokemonTypeSlotDto {

 int get slot; PokemonTypeInfoDto get type;
/// Create a copy of PokemonTypeSlotDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PokemonTypeSlotDtoCopyWith<PokemonTypeSlotDto> get copyWith => _$PokemonTypeSlotDtoCopyWithImpl<PokemonTypeSlotDto>(this as PokemonTypeSlotDto, _$identity);

  /// Serializes this PokemonTypeSlotDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PokemonTypeSlotDto&&(identical(other.slot, slot) || other.slot == slot)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,slot,type);

@override
String toString() {
  return 'PokemonTypeSlotDto(slot: $slot, type: $type)';
}


}

/// @nodoc
abstract mixin class $PokemonTypeSlotDtoCopyWith<$Res>  {
  factory $PokemonTypeSlotDtoCopyWith(PokemonTypeSlotDto value, $Res Function(PokemonTypeSlotDto) _then) = _$PokemonTypeSlotDtoCopyWithImpl;
@useResult
$Res call({
 int slot, PokemonTypeInfoDto type
});


$PokemonTypeInfoDtoCopyWith<$Res> get type;

}
/// @nodoc
class _$PokemonTypeSlotDtoCopyWithImpl<$Res>
    implements $PokemonTypeSlotDtoCopyWith<$Res> {
  _$PokemonTypeSlotDtoCopyWithImpl(this._self, this._then);

  final PokemonTypeSlotDto _self;
  final $Res Function(PokemonTypeSlotDto) _then;

/// Create a copy of PokemonTypeSlotDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? slot = null,Object? type = null,}) {
  return _then(_self.copyWith(
slot: null == slot ? _self.slot : slot // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as PokemonTypeInfoDto,
  ));
}
/// Create a copy of PokemonTypeSlotDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PokemonTypeInfoDtoCopyWith<$Res> get type {
  
  return $PokemonTypeInfoDtoCopyWith<$Res>(_self.type, (value) {
    return _then(_self.copyWith(type: value));
  });
}
}


/// Adds pattern-matching-related methods to [PokemonTypeSlotDto].
extension PokemonTypeSlotDtoPatterns on PokemonTypeSlotDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PokemonTypeSlotDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PokemonTypeSlotDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PokemonTypeSlotDto value)  $default,){
final _that = this;
switch (_that) {
case _PokemonTypeSlotDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PokemonTypeSlotDto value)?  $default,){
final _that = this;
switch (_that) {
case _PokemonTypeSlotDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int slot,  PokemonTypeInfoDto type)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PokemonTypeSlotDto() when $default != null:
return $default(_that.slot,_that.type);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int slot,  PokemonTypeInfoDto type)  $default,) {final _that = this;
switch (_that) {
case _PokemonTypeSlotDto():
return $default(_that.slot,_that.type);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int slot,  PokemonTypeInfoDto type)?  $default,) {final _that = this;
switch (_that) {
case _PokemonTypeSlotDto() when $default != null:
return $default(_that.slot,_that.type);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PokemonTypeSlotDto implements PokemonTypeSlotDto {
  const _PokemonTypeSlotDto({required this.slot, required this.type});
  factory _PokemonTypeSlotDto.fromJson(Map<String, dynamic> json) => _$PokemonTypeSlotDtoFromJson(json);

@override final  int slot;
@override final  PokemonTypeInfoDto type;

/// Create a copy of PokemonTypeSlotDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PokemonTypeSlotDtoCopyWith<_PokemonTypeSlotDto> get copyWith => __$PokemonTypeSlotDtoCopyWithImpl<_PokemonTypeSlotDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PokemonTypeSlotDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PokemonTypeSlotDto&&(identical(other.slot, slot) || other.slot == slot)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,slot,type);

@override
String toString() {
  return 'PokemonTypeSlotDto(slot: $slot, type: $type)';
}


}

/// @nodoc
abstract mixin class _$PokemonTypeSlotDtoCopyWith<$Res> implements $PokemonTypeSlotDtoCopyWith<$Res> {
  factory _$PokemonTypeSlotDtoCopyWith(_PokemonTypeSlotDto value, $Res Function(_PokemonTypeSlotDto) _then) = __$PokemonTypeSlotDtoCopyWithImpl;
@override @useResult
$Res call({
 int slot, PokemonTypeInfoDto type
});


@override $PokemonTypeInfoDtoCopyWith<$Res> get type;

}
/// @nodoc
class __$PokemonTypeSlotDtoCopyWithImpl<$Res>
    implements _$PokemonTypeSlotDtoCopyWith<$Res> {
  __$PokemonTypeSlotDtoCopyWithImpl(this._self, this._then);

  final _PokemonTypeSlotDto _self;
  final $Res Function(_PokemonTypeSlotDto) _then;

/// Create a copy of PokemonTypeSlotDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? slot = null,Object? type = null,}) {
  return _then(_PokemonTypeSlotDto(
slot: null == slot ? _self.slot : slot // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as PokemonTypeInfoDto,
  ));
}

/// Create a copy of PokemonTypeSlotDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PokemonTypeInfoDtoCopyWith<$Res> get type {
  
  return $PokemonTypeInfoDtoCopyWith<$Res>(_self.type, (value) {
    return _then(_self.copyWith(type: value));
  });
}
}


/// @nodoc
mixin _$PokemonTypeInfoDto {

 String get name; String get url;
/// Create a copy of PokemonTypeInfoDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PokemonTypeInfoDtoCopyWith<PokemonTypeInfoDto> get copyWith => _$PokemonTypeInfoDtoCopyWithImpl<PokemonTypeInfoDto>(this as PokemonTypeInfoDto, _$identity);

  /// Serializes this PokemonTypeInfoDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PokemonTypeInfoDto&&(identical(other.name, name) || other.name == name)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,url);

@override
String toString() {
  return 'PokemonTypeInfoDto(name: $name, url: $url)';
}


}

/// @nodoc
abstract mixin class $PokemonTypeInfoDtoCopyWith<$Res>  {
  factory $PokemonTypeInfoDtoCopyWith(PokemonTypeInfoDto value, $Res Function(PokemonTypeInfoDto) _then) = _$PokemonTypeInfoDtoCopyWithImpl;
@useResult
$Res call({
 String name, String url
});




}
/// @nodoc
class _$PokemonTypeInfoDtoCopyWithImpl<$Res>
    implements $PokemonTypeInfoDtoCopyWith<$Res> {
  _$PokemonTypeInfoDtoCopyWithImpl(this._self, this._then);

  final PokemonTypeInfoDto _self;
  final $Res Function(PokemonTypeInfoDto) _then;

/// Create a copy of PokemonTypeInfoDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? url = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PokemonTypeInfoDto].
extension PokemonTypeInfoDtoPatterns on PokemonTypeInfoDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PokemonTypeInfoDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PokemonTypeInfoDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PokemonTypeInfoDto value)  $default,){
final _that = this;
switch (_that) {
case _PokemonTypeInfoDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PokemonTypeInfoDto value)?  $default,){
final _that = this;
switch (_that) {
case _PokemonTypeInfoDto() when $default != null:
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
case _PokemonTypeInfoDto() when $default != null:
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
case _PokemonTypeInfoDto():
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
case _PokemonTypeInfoDto() when $default != null:
return $default(_that.name,_that.url);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PokemonTypeInfoDto implements PokemonTypeInfoDto {
  const _PokemonTypeInfoDto({required this.name, required this.url});
  factory _PokemonTypeInfoDto.fromJson(Map<String, dynamic> json) => _$PokemonTypeInfoDtoFromJson(json);

@override final  String name;
@override final  String url;

/// Create a copy of PokemonTypeInfoDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PokemonTypeInfoDtoCopyWith<_PokemonTypeInfoDto> get copyWith => __$PokemonTypeInfoDtoCopyWithImpl<_PokemonTypeInfoDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PokemonTypeInfoDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PokemonTypeInfoDto&&(identical(other.name, name) || other.name == name)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,url);

@override
String toString() {
  return 'PokemonTypeInfoDto(name: $name, url: $url)';
}


}

/// @nodoc
abstract mixin class _$PokemonTypeInfoDtoCopyWith<$Res> implements $PokemonTypeInfoDtoCopyWith<$Res> {
  factory _$PokemonTypeInfoDtoCopyWith(_PokemonTypeInfoDto value, $Res Function(_PokemonTypeInfoDto) _then) = __$PokemonTypeInfoDtoCopyWithImpl;
@override @useResult
$Res call({
 String name, String url
});




}
/// @nodoc
class __$PokemonTypeInfoDtoCopyWithImpl<$Res>
    implements _$PokemonTypeInfoDtoCopyWith<$Res> {
  __$PokemonTypeInfoDtoCopyWithImpl(this._self, this._then);

  final _PokemonTypeInfoDto _self;
  final $Res Function(_PokemonTypeInfoDto) _then;

/// Create a copy of PokemonTypeInfoDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? url = null,}) {
  return _then(_PokemonTypeInfoDto(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$PokemonStatDto {

@JsonKey(name: 'base_stat') int get baseStat; int get effort; PokemonStatInfoDto get stat;
/// Create a copy of PokemonStatDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PokemonStatDtoCopyWith<PokemonStatDto> get copyWith => _$PokemonStatDtoCopyWithImpl<PokemonStatDto>(this as PokemonStatDto, _$identity);

  /// Serializes this PokemonStatDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PokemonStatDto&&(identical(other.baseStat, baseStat) || other.baseStat == baseStat)&&(identical(other.effort, effort) || other.effort == effort)&&(identical(other.stat, stat) || other.stat == stat));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,baseStat,effort,stat);

@override
String toString() {
  return 'PokemonStatDto(baseStat: $baseStat, effort: $effort, stat: $stat)';
}


}

/// @nodoc
abstract mixin class $PokemonStatDtoCopyWith<$Res>  {
  factory $PokemonStatDtoCopyWith(PokemonStatDto value, $Res Function(PokemonStatDto) _then) = _$PokemonStatDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'base_stat') int baseStat, int effort, PokemonStatInfoDto stat
});


$PokemonStatInfoDtoCopyWith<$Res> get stat;

}
/// @nodoc
class _$PokemonStatDtoCopyWithImpl<$Res>
    implements $PokemonStatDtoCopyWith<$Res> {
  _$PokemonStatDtoCopyWithImpl(this._self, this._then);

  final PokemonStatDto _self;
  final $Res Function(PokemonStatDto) _then;

/// Create a copy of PokemonStatDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? baseStat = null,Object? effort = null,Object? stat = null,}) {
  return _then(_self.copyWith(
baseStat: null == baseStat ? _self.baseStat : baseStat // ignore: cast_nullable_to_non_nullable
as int,effort: null == effort ? _self.effort : effort // ignore: cast_nullable_to_non_nullable
as int,stat: null == stat ? _self.stat : stat // ignore: cast_nullable_to_non_nullable
as PokemonStatInfoDto,
  ));
}
/// Create a copy of PokemonStatDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PokemonStatInfoDtoCopyWith<$Res> get stat {
  
  return $PokemonStatInfoDtoCopyWith<$Res>(_self.stat, (value) {
    return _then(_self.copyWith(stat: value));
  });
}
}


/// Adds pattern-matching-related methods to [PokemonStatDto].
extension PokemonStatDtoPatterns on PokemonStatDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PokemonStatDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PokemonStatDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PokemonStatDto value)  $default,){
final _that = this;
switch (_that) {
case _PokemonStatDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PokemonStatDto value)?  $default,){
final _that = this;
switch (_that) {
case _PokemonStatDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'base_stat')  int baseStat,  int effort,  PokemonStatInfoDto stat)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PokemonStatDto() when $default != null:
return $default(_that.baseStat,_that.effort,_that.stat);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'base_stat')  int baseStat,  int effort,  PokemonStatInfoDto stat)  $default,) {final _that = this;
switch (_that) {
case _PokemonStatDto():
return $default(_that.baseStat,_that.effort,_that.stat);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'base_stat')  int baseStat,  int effort,  PokemonStatInfoDto stat)?  $default,) {final _that = this;
switch (_that) {
case _PokemonStatDto() when $default != null:
return $default(_that.baseStat,_that.effort,_that.stat);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PokemonStatDto implements PokemonStatDto {
  const _PokemonStatDto({@JsonKey(name: 'base_stat') required this.baseStat, required this.effort, required this.stat});
  factory _PokemonStatDto.fromJson(Map<String, dynamic> json) => _$PokemonStatDtoFromJson(json);

@override@JsonKey(name: 'base_stat') final  int baseStat;
@override final  int effort;
@override final  PokemonStatInfoDto stat;

/// Create a copy of PokemonStatDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PokemonStatDtoCopyWith<_PokemonStatDto> get copyWith => __$PokemonStatDtoCopyWithImpl<_PokemonStatDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PokemonStatDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PokemonStatDto&&(identical(other.baseStat, baseStat) || other.baseStat == baseStat)&&(identical(other.effort, effort) || other.effort == effort)&&(identical(other.stat, stat) || other.stat == stat));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,baseStat,effort,stat);

@override
String toString() {
  return 'PokemonStatDto(baseStat: $baseStat, effort: $effort, stat: $stat)';
}


}

/// @nodoc
abstract mixin class _$PokemonStatDtoCopyWith<$Res> implements $PokemonStatDtoCopyWith<$Res> {
  factory _$PokemonStatDtoCopyWith(_PokemonStatDto value, $Res Function(_PokemonStatDto) _then) = __$PokemonStatDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'base_stat') int baseStat, int effort, PokemonStatInfoDto stat
});


@override $PokemonStatInfoDtoCopyWith<$Res> get stat;

}
/// @nodoc
class __$PokemonStatDtoCopyWithImpl<$Res>
    implements _$PokemonStatDtoCopyWith<$Res> {
  __$PokemonStatDtoCopyWithImpl(this._self, this._then);

  final _PokemonStatDto _self;
  final $Res Function(_PokemonStatDto) _then;

/// Create a copy of PokemonStatDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? baseStat = null,Object? effort = null,Object? stat = null,}) {
  return _then(_PokemonStatDto(
baseStat: null == baseStat ? _self.baseStat : baseStat // ignore: cast_nullable_to_non_nullable
as int,effort: null == effort ? _self.effort : effort // ignore: cast_nullable_to_non_nullable
as int,stat: null == stat ? _self.stat : stat // ignore: cast_nullable_to_non_nullable
as PokemonStatInfoDto,
  ));
}

/// Create a copy of PokemonStatDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PokemonStatInfoDtoCopyWith<$Res> get stat {
  
  return $PokemonStatInfoDtoCopyWith<$Res>(_self.stat, (value) {
    return _then(_self.copyWith(stat: value));
  });
}
}


/// @nodoc
mixin _$PokemonStatInfoDto {

 String get name; String get url;
/// Create a copy of PokemonStatInfoDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PokemonStatInfoDtoCopyWith<PokemonStatInfoDto> get copyWith => _$PokemonStatInfoDtoCopyWithImpl<PokemonStatInfoDto>(this as PokemonStatInfoDto, _$identity);

  /// Serializes this PokemonStatInfoDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PokemonStatInfoDto&&(identical(other.name, name) || other.name == name)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,url);

@override
String toString() {
  return 'PokemonStatInfoDto(name: $name, url: $url)';
}


}

/// @nodoc
abstract mixin class $PokemonStatInfoDtoCopyWith<$Res>  {
  factory $PokemonStatInfoDtoCopyWith(PokemonStatInfoDto value, $Res Function(PokemonStatInfoDto) _then) = _$PokemonStatInfoDtoCopyWithImpl;
@useResult
$Res call({
 String name, String url
});




}
/// @nodoc
class _$PokemonStatInfoDtoCopyWithImpl<$Res>
    implements $PokemonStatInfoDtoCopyWith<$Res> {
  _$PokemonStatInfoDtoCopyWithImpl(this._self, this._then);

  final PokemonStatInfoDto _self;
  final $Res Function(PokemonStatInfoDto) _then;

/// Create a copy of PokemonStatInfoDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? url = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PokemonStatInfoDto].
extension PokemonStatInfoDtoPatterns on PokemonStatInfoDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PokemonStatInfoDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PokemonStatInfoDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PokemonStatInfoDto value)  $default,){
final _that = this;
switch (_that) {
case _PokemonStatInfoDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PokemonStatInfoDto value)?  $default,){
final _that = this;
switch (_that) {
case _PokemonStatInfoDto() when $default != null:
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
case _PokemonStatInfoDto() when $default != null:
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
case _PokemonStatInfoDto():
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
case _PokemonStatInfoDto() when $default != null:
return $default(_that.name,_that.url);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PokemonStatInfoDto implements PokemonStatInfoDto {
  const _PokemonStatInfoDto({required this.name, required this.url});
  factory _PokemonStatInfoDto.fromJson(Map<String, dynamic> json) => _$PokemonStatInfoDtoFromJson(json);

@override final  String name;
@override final  String url;

/// Create a copy of PokemonStatInfoDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PokemonStatInfoDtoCopyWith<_PokemonStatInfoDto> get copyWith => __$PokemonStatInfoDtoCopyWithImpl<_PokemonStatInfoDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PokemonStatInfoDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PokemonStatInfoDto&&(identical(other.name, name) || other.name == name)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,url);

@override
String toString() {
  return 'PokemonStatInfoDto(name: $name, url: $url)';
}


}

/// @nodoc
abstract mixin class _$PokemonStatInfoDtoCopyWith<$Res> implements $PokemonStatInfoDtoCopyWith<$Res> {
  factory _$PokemonStatInfoDtoCopyWith(_PokemonStatInfoDto value, $Res Function(_PokemonStatInfoDto) _then) = __$PokemonStatInfoDtoCopyWithImpl;
@override @useResult
$Res call({
 String name, String url
});




}
/// @nodoc
class __$PokemonStatInfoDtoCopyWithImpl<$Res>
    implements _$PokemonStatInfoDtoCopyWith<$Res> {
  __$PokemonStatInfoDtoCopyWithImpl(this._self, this._then);

  final _PokemonStatInfoDto _self;
  final $Res Function(_PokemonStatInfoDto) _then;

/// Create a copy of PokemonStatInfoDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? url = null,}) {
  return _then(_PokemonStatInfoDto(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$PokemonSpritesDto {

@JsonKey(name: 'front_default') String? get frontDefault; PokemonOtherSpritesDto? get other;
/// Create a copy of PokemonSpritesDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PokemonSpritesDtoCopyWith<PokemonSpritesDto> get copyWith => _$PokemonSpritesDtoCopyWithImpl<PokemonSpritesDto>(this as PokemonSpritesDto, _$identity);

  /// Serializes this PokemonSpritesDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PokemonSpritesDto&&(identical(other.frontDefault, frontDefault) || other.frontDefault == frontDefault)&&(identical(other.other, this.other) || other.other == this.other));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,frontDefault,other);

@override
String toString() {
  return 'PokemonSpritesDto(frontDefault: $frontDefault, other: $other)';
}


}

/// @nodoc
abstract mixin class $PokemonSpritesDtoCopyWith<$Res>  {
  factory $PokemonSpritesDtoCopyWith(PokemonSpritesDto value, $Res Function(PokemonSpritesDto) _then) = _$PokemonSpritesDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'front_default') String? frontDefault, PokemonOtherSpritesDto? other
});


$PokemonOtherSpritesDtoCopyWith<$Res>? get other;

}
/// @nodoc
class _$PokemonSpritesDtoCopyWithImpl<$Res>
    implements $PokemonSpritesDtoCopyWith<$Res> {
  _$PokemonSpritesDtoCopyWithImpl(this._self, this._then);

  final PokemonSpritesDto _self;
  final $Res Function(PokemonSpritesDto) _then;

/// Create a copy of PokemonSpritesDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? frontDefault = freezed,Object? other = freezed,}) {
  return _then(_self.copyWith(
frontDefault: freezed == frontDefault ? _self.frontDefault : frontDefault // ignore: cast_nullable_to_non_nullable
as String?,other: freezed == other ? _self.other : other // ignore: cast_nullable_to_non_nullable
as PokemonOtherSpritesDto?,
  ));
}
/// Create a copy of PokemonSpritesDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PokemonOtherSpritesDtoCopyWith<$Res>? get other {
    if (_self.other == null) {
    return null;
  }

  return $PokemonOtherSpritesDtoCopyWith<$Res>(_self.other!, (value) {
    return _then(_self.copyWith(other: value));
  });
}
}


/// Adds pattern-matching-related methods to [PokemonSpritesDto].
extension PokemonSpritesDtoPatterns on PokemonSpritesDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PokemonSpritesDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PokemonSpritesDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PokemonSpritesDto value)  $default,){
final _that = this;
switch (_that) {
case _PokemonSpritesDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PokemonSpritesDto value)?  $default,){
final _that = this;
switch (_that) {
case _PokemonSpritesDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'front_default')  String? frontDefault,  PokemonOtherSpritesDto? other)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PokemonSpritesDto() when $default != null:
return $default(_that.frontDefault,_that.other);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'front_default')  String? frontDefault,  PokemonOtherSpritesDto? other)  $default,) {final _that = this;
switch (_that) {
case _PokemonSpritesDto():
return $default(_that.frontDefault,_that.other);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'front_default')  String? frontDefault,  PokemonOtherSpritesDto? other)?  $default,) {final _that = this;
switch (_that) {
case _PokemonSpritesDto() when $default != null:
return $default(_that.frontDefault,_that.other);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PokemonSpritesDto implements PokemonSpritesDto {
  const _PokemonSpritesDto({@JsonKey(name: 'front_default') this.frontDefault, this.other});
  factory _PokemonSpritesDto.fromJson(Map<String, dynamic> json) => _$PokemonSpritesDtoFromJson(json);

@override@JsonKey(name: 'front_default') final  String? frontDefault;
@override final  PokemonOtherSpritesDto? other;

/// Create a copy of PokemonSpritesDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PokemonSpritesDtoCopyWith<_PokemonSpritesDto> get copyWith => __$PokemonSpritesDtoCopyWithImpl<_PokemonSpritesDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PokemonSpritesDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PokemonSpritesDto&&(identical(other.frontDefault, frontDefault) || other.frontDefault == frontDefault)&&(identical(other.other, this.other) || other.other == this.other));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,frontDefault,other);

@override
String toString() {
  return 'PokemonSpritesDto(frontDefault: $frontDefault, other: $other)';
}


}

/// @nodoc
abstract mixin class _$PokemonSpritesDtoCopyWith<$Res> implements $PokemonSpritesDtoCopyWith<$Res> {
  factory _$PokemonSpritesDtoCopyWith(_PokemonSpritesDto value, $Res Function(_PokemonSpritesDto) _then) = __$PokemonSpritesDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'front_default') String? frontDefault, PokemonOtherSpritesDto? other
});


@override $PokemonOtherSpritesDtoCopyWith<$Res>? get other;

}
/// @nodoc
class __$PokemonSpritesDtoCopyWithImpl<$Res>
    implements _$PokemonSpritesDtoCopyWith<$Res> {
  __$PokemonSpritesDtoCopyWithImpl(this._self, this._then);

  final _PokemonSpritesDto _self;
  final $Res Function(_PokemonSpritesDto) _then;

/// Create a copy of PokemonSpritesDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? frontDefault = freezed,Object? other = freezed,}) {
  return _then(_PokemonSpritesDto(
frontDefault: freezed == frontDefault ? _self.frontDefault : frontDefault // ignore: cast_nullable_to_non_nullable
as String?,other: freezed == other ? _self.other : other // ignore: cast_nullable_to_non_nullable
as PokemonOtherSpritesDto?,
  ));
}

/// Create a copy of PokemonSpritesDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PokemonOtherSpritesDtoCopyWith<$Res>? get other {
    if (_self.other == null) {
    return null;
  }

  return $PokemonOtherSpritesDtoCopyWith<$Res>(_self.other!, (value) {
    return _then(_self.copyWith(other: value));
  });
}
}


/// @nodoc
mixin _$PokemonOtherSpritesDto {

@JsonKey(name: 'official-artwork') PokemonArtworkDto? get officialArtwork;
/// Create a copy of PokemonOtherSpritesDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PokemonOtherSpritesDtoCopyWith<PokemonOtherSpritesDto> get copyWith => _$PokemonOtherSpritesDtoCopyWithImpl<PokemonOtherSpritesDto>(this as PokemonOtherSpritesDto, _$identity);

  /// Serializes this PokemonOtherSpritesDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PokemonOtherSpritesDto&&(identical(other.officialArtwork, officialArtwork) || other.officialArtwork == officialArtwork));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,officialArtwork);

@override
String toString() {
  return 'PokemonOtherSpritesDto(officialArtwork: $officialArtwork)';
}


}

/// @nodoc
abstract mixin class $PokemonOtherSpritesDtoCopyWith<$Res>  {
  factory $PokemonOtherSpritesDtoCopyWith(PokemonOtherSpritesDto value, $Res Function(PokemonOtherSpritesDto) _then) = _$PokemonOtherSpritesDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'official-artwork') PokemonArtworkDto? officialArtwork
});


$PokemonArtworkDtoCopyWith<$Res>? get officialArtwork;

}
/// @nodoc
class _$PokemonOtherSpritesDtoCopyWithImpl<$Res>
    implements $PokemonOtherSpritesDtoCopyWith<$Res> {
  _$PokemonOtherSpritesDtoCopyWithImpl(this._self, this._then);

  final PokemonOtherSpritesDto _self;
  final $Res Function(PokemonOtherSpritesDto) _then;

/// Create a copy of PokemonOtherSpritesDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? officialArtwork = freezed,}) {
  return _then(_self.copyWith(
officialArtwork: freezed == officialArtwork ? _self.officialArtwork : officialArtwork // ignore: cast_nullable_to_non_nullable
as PokemonArtworkDto?,
  ));
}
/// Create a copy of PokemonOtherSpritesDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PokemonArtworkDtoCopyWith<$Res>? get officialArtwork {
    if (_self.officialArtwork == null) {
    return null;
  }

  return $PokemonArtworkDtoCopyWith<$Res>(_self.officialArtwork!, (value) {
    return _then(_self.copyWith(officialArtwork: value));
  });
}
}


/// Adds pattern-matching-related methods to [PokemonOtherSpritesDto].
extension PokemonOtherSpritesDtoPatterns on PokemonOtherSpritesDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PokemonOtherSpritesDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PokemonOtherSpritesDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PokemonOtherSpritesDto value)  $default,){
final _that = this;
switch (_that) {
case _PokemonOtherSpritesDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PokemonOtherSpritesDto value)?  $default,){
final _that = this;
switch (_that) {
case _PokemonOtherSpritesDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'official-artwork')  PokemonArtworkDto? officialArtwork)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PokemonOtherSpritesDto() when $default != null:
return $default(_that.officialArtwork);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'official-artwork')  PokemonArtworkDto? officialArtwork)  $default,) {final _that = this;
switch (_that) {
case _PokemonOtherSpritesDto():
return $default(_that.officialArtwork);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'official-artwork')  PokemonArtworkDto? officialArtwork)?  $default,) {final _that = this;
switch (_that) {
case _PokemonOtherSpritesDto() when $default != null:
return $default(_that.officialArtwork);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PokemonOtherSpritesDto implements PokemonOtherSpritesDto {
  const _PokemonOtherSpritesDto({@JsonKey(name: 'official-artwork') this.officialArtwork});
  factory _PokemonOtherSpritesDto.fromJson(Map<String, dynamic> json) => _$PokemonOtherSpritesDtoFromJson(json);

@override@JsonKey(name: 'official-artwork') final  PokemonArtworkDto? officialArtwork;

/// Create a copy of PokemonOtherSpritesDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PokemonOtherSpritesDtoCopyWith<_PokemonOtherSpritesDto> get copyWith => __$PokemonOtherSpritesDtoCopyWithImpl<_PokemonOtherSpritesDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PokemonOtherSpritesDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PokemonOtherSpritesDto&&(identical(other.officialArtwork, officialArtwork) || other.officialArtwork == officialArtwork));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,officialArtwork);

@override
String toString() {
  return 'PokemonOtherSpritesDto(officialArtwork: $officialArtwork)';
}


}

/// @nodoc
abstract mixin class _$PokemonOtherSpritesDtoCopyWith<$Res> implements $PokemonOtherSpritesDtoCopyWith<$Res> {
  factory _$PokemonOtherSpritesDtoCopyWith(_PokemonOtherSpritesDto value, $Res Function(_PokemonOtherSpritesDto) _then) = __$PokemonOtherSpritesDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'official-artwork') PokemonArtworkDto? officialArtwork
});


@override $PokemonArtworkDtoCopyWith<$Res>? get officialArtwork;

}
/// @nodoc
class __$PokemonOtherSpritesDtoCopyWithImpl<$Res>
    implements _$PokemonOtherSpritesDtoCopyWith<$Res> {
  __$PokemonOtherSpritesDtoCopyWithImpl(this._self, this._then);

  final _PokemonOtherSpritesDto _self;
  final $Res Function(_PokemonOtherSpritesDto) _then;

/// Create a copy of PokemonOtherSpritesDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? officialArtwork = freezed,}) {
  return _then(_PokemonOtherSpritesDto(
officialArtwork: freezed == officialArtwork ? _self.officialArtwork : officialArtwork // ignore: cast_nullable_to_non_nullable
as PokemonArtworkDto?,
  ));
}

/// Create a copy of PokemonOtherSpritesDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PokemonArtworkDtoCopyWith<$Res>? get officialArtwork {
    if (_self.officialArtwork == null) {
    return null;
  }

  return $PokemonArtworkDtoCopyWith<$Res>(_self.officialArtwork!, (value) {
    return _then(_self.copyWith(officialArtwork: value));
  });
}
}


/// @nodoc
mixin _$PokemonArtworkDto {

@JsonKey(name: 'front_default') String? get frontDefault;
/// Create a copy of PokemonArtworkDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PokemonArtworkDtoCopyWith<PokemonArtworkDto> get copyWith => _$PokemonArtworkDtoCopyWithImpl<PokemonArtworkDto>(this as PokemonArtworkDto, _$identity);

  /// Serializes this PokemonArtworkDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PokemonArtworkDto&&(identical(other.frontDefault, frontDefault) || other.frontDefault == frontDefault));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,frontDefault);

@override
String toString() {
  return 'PokemonArtworkDto(frontDefault: $frontDefault)';
}


}

/// @nodoc
abstract mixin class $PokemonArtworkDtoCopyWith<$Res>  {
  factory $PokemonArtworkDtoCopyWith(PokemonArtworkDto value, $Res Function(PokemonArtworkDto) _then) = _$PokemonArtworkDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'front_default') String? frontDefault
});




}
/// @nodoc
class _$PokemonArtworkDtoCopyWithImpl<$Res>
    implements $PokemonArtworkDtoCopyWith<$Res> {
  _$PokemonArtworkDtoCopyWithImpl(this._self, this._then);

  final PokemonArtworkDto _self;
  final $Res Function(PokemonArtworkDto) _then;

/// Create a copy of PokemonArtworkDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? frontDefault = freezed,}) {
  return _then(_self.copyWith(
frontDefault: freezed == frontDefault ? _self.frontDefault : frontDefault // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PokemonArtworkDto].
extension PokemonArtworkDtoPatterns on PokemonArtworkDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PokemonArtworkDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PokemonArtworkDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PokemonArtworkDto value)  $default,){
final _that = this;
switch (_that) {
case _PokemonArtworkDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PokemonArtworkDto value)?  $default,){
final _that = this;
switch (_that) {
case _PokemonArtworkDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'front_default')  String? frontDefault)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PokemonArtworkDto() when $default != null:
return $default(_that.frontDefault);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'front_default')  String? frontDefault)  $default,) {final _that = this;
switch (_that) {
case _PokemonArtworkDto():
return $default(_that.frontDefault);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'front_default')  String? frontDefault)?  $default,) {final _that = this;
switch (_that) {
case _PokemonArtworkDto() when $default != null:
return $default(_that.frontDefault);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PokemonArtworkDto implements PokemonArtworkDto {
  const _PokemonArtworkDto({@JsonKey(name: 'front_default') this.frontDefault});
  factory _PokemonArtworkDto.fromJson(Map<String, dynamic> json) => _$PokemonArtworkDtoFromJson(json);

@override@JsonKey(name: 'front_default') final  String? frontDefault;

/// Create a copy of PokemonArtworkDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PokemonArtworkDtoCopyWith<_PokemonArtworkDto> get copyWith => __$PokemonArtworkDtoCopyWithImpl<_PokemonArtworkDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PokemonArtworkDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PokemonArtworkDto&&(identical(other.frontDefault, frontDefault) || other.frontDefault == frontDefault));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,frontDefault);

@override
String toString() {
  return 'PokemonArtworkDto(frontDefault: $frontDefault)';
}


}

/// @nodoc
abstract mixin class _$PokemonArtworkDtoCopyWith<$Res> implements $PokemonArtworkDtoCopyWith<$Res> {
  factory _$PokemonArtworkDtoCopyWith(_PokemonArtworkDto value, $Res Function(_PokemonArtworkDto) _then) = __$PokemonArtworkDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'front_default') String? frontDefault
});




}
/// @nodoc
class __$PokemonArtworkDtoCopyWithImpl<$Res>
    implements _$PokemonArtworkDtoCopyWith<$Res> {
  __$PokemonArtworkDtoCopyWithImpl(this._self, this._then);

  final _PokemonArtworkDto _self;
  final $Res Function(_PokemonArtworkDto) _then;

/// Create a copy of PokemonArtworkDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? frontDefault = freezed,}) {
  return _then(_PokemonArtworkDto(
frontDefault: freezed == frontDefault ? _self.frontDefault : frontDefault // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
