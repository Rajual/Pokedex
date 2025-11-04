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
  return _then(PokemonDetailDto(
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({required TResult orElse(),}){
final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({required TResult orElse(),}) {final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  return null;

}
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
  return _then(PokemonTypeSlotDto(
slot: null == slot ? _self.slot : slot // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as PokemonTypeInfoDto,
  ));
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({required TResult orElse(),}){
final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({required TResult orElse(),}) {final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  return null;

}
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
  return _then(PokemonTypeInfoDto(
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({required TResult orElse(),}){
final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({required TResult orElse(),}) {final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  return null;

}
}

}


/// @nodoc
mixin _$PokemonStatDto {

 int get baseStat; int get effort; PokemonStatInfoDto get stat;
/// Create a copy of PokemonStatDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PokemonStatDtoCopyWith<PokemonStatDto> get copyWith => _$PokemonStatDtoCopyWithImpl<PokemonStatDto>(this as PokemonStatDto, _$identity);



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
  return _then(PokemonStatDto(
baseStat: null == baseStat ? _self.baseStat : baseStat // ignore: cast_nullable_to_non_nullable
as int,effort: null == effort ? _self.effort : effort // ignore: cast_nullable_to_non_nullable
as int,stat: null == stat ? _self.stat : stat // ignore: cast_nullable_to_non_nullable
as PokemonStatInfoDto,
  ));
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({required TResult orElse(),}){
final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({required TResult orElse(),}) {final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  return null;

}
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
  return _then(PokemonStatInfoDto(
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({required TResult orElse(),}){
final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({required TResult orElse(),}) {final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  return null;

}
}

}


/// @nodoc
mixin _$PokemonSpritesDto {

 String? get frontDefault; PokemonOtherSpritesDto? get other;
/// Create a copy of PokemonSpritesDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PokemonSpritesDtoCopyWith<PokemonSpritesDto> get copyWith => _$PokemonSpritesDtoCopyWithImpl<PokemonSpritesDto>(this as PokemonSpritesDto, _$identity);



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
  return _then(PokemonSpritesDto(
frontDefault: freezed == frontDefault ? _self.frontDefault : frontDefault // ignore: cast_nullable_to_non_nullable
as String?,other: freezed == other ? _self.other : other // ignore: cast_nullable_to_non_nullable
as PokemonOtherSpritesDto?,
  ));
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({required TResult orElse(),}){
final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({required TResult orElse(),}) {final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  return null;

}
}

}


/// @nodoc
mixin _$PokemonOtherSpritesDto {

 PokemonArtworkDto? get officialArtwork;
/// Create a copy of PokemonOtherSpritesDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PokemonOtherSpritesDtoCopyWith<PokemonOtherSpritesDto> get copyWith => _$PokemonOtherSpritesDtoCopyWithImpl<PokemonOtherSpritesDto>(this as PokemonOtherSpritesDto, _$identity);



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
  return _then(PokemonOtherSpritesDto(
officialArtwork: freezed == officialArtwork ? _self.officialArtwork : officialArtwork // ignore: cast_nullable_to_non_nullable
as PokemonArtworkDto?,
  ));
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({required TResult orElse(),}){
final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({required TResult orElse(),}) {final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  return null;

}
}

}


/// @nodoc
mixin _$PokemonArtworkDto {

 String? get frontDefault;
/// Create a copy of PokemonArtworkDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PokemonArtworkDtoCopyWith<PokemonArtworkDto> get copyWith => _$PokemonArtworkDtoCopyWithImpl<PokemonArtworkDto>(this as PokemonArtworkDto, _$identity);



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
  return _then(PokemonArtworkDto(
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({required TResult orElse(),}){
final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({required TResult orElse(),}) {final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  return null;

}
}

}

// dart format on
