# 📋 Propuesta de Modelos para PokeAPI

## 🎯 Resumen de APIs

### 1. Lista de Pokémons
```
GET https://pokeapi.co/api/v2/pokemon?offset=0&limit=20
```

**Respuesta:**
```json
{
  "count": 1328,
  "next": "https://pokeapi.co/api/v2/pokemon?offset=20&limit=20",
  "previous": null,
  "results": [
    {
      "name": "bulbasaur",
      "url": "https://pokeapi.co/api/v2/pokemon/1/"
    }
  ]
}
```

### 2. Detalle de Pokémon
```
GET https://pokeapi.co/api/v2/pokemon/bulbasaur
```

**Campos Clave:**
```json
{
  "id": 1,
  "name": "bulbasaur",
  "height": 7,
  "weight": 69,
  "types": [
    {
      "slot": 1,
      "type": {
        "name": "grass",
        "url": "https://pokeapi.co/api/v2/type/12/"
      }
    }
  ],
  "stats": [
    {
      "base_stat": 45,
      "stat": {
        "name": "hp"
      }
    }
  ],
  "sprites": {
    "front_default": "https://...",
    "other": {
      "official-artwork": {
        "front_default": "https://..."
      }
    }
  }
}
```

---

## 🏗️ Opciones de Arquitectura de Modelos

### **Opción 1: Modelos Separados DTOs + Domain (Clean Architecture Completo)**

#### ✅ Ventajas
- Separación total entre capa de datos y dominio
- Máxima testabilidad
- Facilita cambios en la API sin afectar la lógica de negocio
- Alineado con Clean Architecture

#### ⚠️ Desventajas
- Más archivos y código boilerplate
- Mappers adicionales
- Puede ser over-engineering para app pequeña

#### 📦 Estructura
```
lib/
├── core/
│   └── design_system/
│       └── organisms/
│           └── pokemon_list_view/
│               └── pokemon.dart (Domain Model - Ya existe)
├── features/
│   └── pokemon/
│       ├── data/
│       │   ├── models/
│       │   │   ├── pokemon_list_response_dto.dart
│       │   │   ├── pokemon_list_item_dto.dart
│       │   │   ├── pokemon_detail_dto.dart
│       │   │   └── pokemon_stat_dto.dart
│       │   ├── datasources/
│       │   │   └── pokemon_remote_datasource.dart
│       │   └── repositories/
│       │       └── pokemon_repository_impl.dart
│       ├── domain/
│       │   ├── entities/
│       │   │   ├── pokemon_entity.dart (Dominio completo)
│       │   │   └── pokemon_stats.dart
│       │   ├── repositories/
│       │   │   └── pokemon_repository.dart
│       │   └── usecases/
│       │       ├── get_pokemon_list.dart
│       │       └── get_pokemon_detail.dart
│       └── presentation/
│           ├── providers/
│           └── screens/
```

#### 📝 Modelos

**1. Data Layer - DTOs (API Response Models)**

```dart
// pokemon_list_response_dto.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_list_response_dto.freezed.dart';
part 'pokemon_list_response_dto.g.dart';

@freezed
class PokemonListResponseDto with _$PokemonListResponseDto {
  const factory PokemonListResponseDto({
    required int count,
    String? next,
    String? previous,
    required List<PokemonListItemDto> results,
  }) = _PokemonListResponseDto;

  factory PokemonListResponseDto.fromJson(Map<String, dynamic> json) =>
      _$PokemonListResponseDtoFromJson(json);
}

@freezed
class PokemonListItemDto with _$PokemonListItemDto {
  const factory PokemonListItemDto({
    required String name,
    required String url,
  }) = _PokemonListItemDto;

  factory PokemonListItemDto.fromJson(Map<String, dynamic> json) =>
      _$PokemonListItemDtoFromJson(json);
}
```

```dart
// pokemon_detail_dto.dart
@freezed
class PokemonDetailDto with _$PokemonDetailDto {
  const factory PokemonDetailDto({
    required int id,
    required String name,
    required int height,
    required int weight,
    required List<PokemonTypeSlotDto> types,
    required List<PokemonStatDto> stats,
    required PokemonSpritesDto sprites,
  }) = _PokemonDetailDto;

  factory PokemonDetailDto.fromJson(Map<String, dynamic> json) =>
      _$PokemonDetailDtoFromJson(json);
}

@freezed
class PokemonTypeSlotDto with _$PokemonTypeSlotDto {
  const factory PokemonTypeSlotDto({
    required int slot,
    required PokemonTypeInfoDto type,
  }) = _PokemonTypeSlotDto;

  factory PokemonTypeSlotDto.fromJson(Map<String, dynamic> json) =>
      _$PokemonTypeSlotDtoFromJson(json);
}

@freezed
class PokemonTypeInfoDto with _$PokemonTypeInfoDto {
  const factory PokemonTypeInfoDto({
    required String name,
    required String url,
  }) = _PokemonTypeInfoDto;

  factory PokemonTypeInfoDto.fromJson(Map<String, dynamic> json) =>
      _$PokemonTypeInfoDtoFromJson(json);
}

@freezed
class PokemonStatDto with _$PokemonStatDto {
  const factory PokemonStatDto({
    @JsonKey(name: 'base_stat') required int baseStat,
    required PokemonStatInfoDto stat,
  }) = _PokemonStatDto;

  factory PokemonStatDto.fromJson(Map<String, dynamic> json) =>
      _$PokemonStatDtoFromJson(json);
}

@freezed
class PokemonStatInfoDto with _$PokemonStatInfoDto {
  const factory PokemonStatInfoDto({
    required String name,
  }) = _PokemonStatInfoDto;

  factory PokemonStatInfoDto.fromJson(Map<String, dynamic> json) =>
      _$PokemonStatInfoDtoFromJson(json);
}

@freezed
class PokemonSpritesDto with _$PokemonSpritesDto {
  const factory PokemonSpritesDto({
    @JsonKey(name: 'front_default') String? frontDefault,
    PokemonOtherSpritesDto? other,
  }) = _PokemonSpritesDto;

  factory PokemonSpritesDto.fromJson(Map<String, dynamic> json) =>
      _$PokemonSpritesDtoFromJson(json);
}

@freezed
class PokemonOtherSpritesDto with _$PokemonOtherSpritesDto {
  const factory PokemonOtherSpritesDto({
    @JsonKey(name: 'official-artwork') PokemonArtworkDto? officialArtwork,
  }) = _PokemonOtherSpritesDto;

  factory PokemonOtherSpritesDto.fromJson(Map<String, dynamic> json) =>
      _$PokemonOtherSpritesDtoFromJson(json);
}

@freezed
class PokemonArtworkDto with _$PokemonArtworkDto {
  const factory PokemonArtworkDto({
    @JsonKey(name: 'front_default') String? frontDefault,
  }) = _PokemonArtworkDto;

  factory PokemonArtworkDto.fromJson(Map<String, dynamic> json) =>
      _$PokemonArtworkDtoFromJson(json);
}
```

**2. Domain Layer - Entities**

```dart
// pokemon_entity.dart
@freezed
class PokemonEntity with _$PokemonEntity {
  const factory PokemonEntity({
    required int id,
    required String name,
    required int height, // En decímetros
    required int weight, // En hectogramos
    required List<PokemonType> types,
    required PokemonStats stats,
    required String imageUrl,
  }) = _PokemonEntity;
}

@freezed
class PokemonStats with _$PokemonStats {
  const factory PokemonStats({
    required int hp,
    required int attack,
    required int defense,
    required int specialAttack,
    required int specialDefense,
    required int speed,
  }) = _PokemonStats;

  const PokemonStats._();

  /// Total base stat
  int get total => hp + attack + defense + specialAttack + specialDefense + speed;
}
```

**3. Mapper (Data → Domain)**

```dart
// pokemon_mapper.dart
extension PokemonDetailDtoX on PokemonDetailDto {
  PokemonEntity toEntity() {
    return PokemonEntity(
      id: id,
      name: name,
      height: height,
      weight: weight,
      types: types.map((typeSlot) {
        return PokemonTypeMapper.fromString(typeSlot.type.name);
      }).toList(),
      stats: _mapStats(),
      imageUrl: sprites.other?.officialArtwork?.frontDefault ??
          sprites.frontDefault ??
          '',
    );
  }

  PokemonStats _mapStats() {
    final statsMap = {for (var stat in stats) stat.stat.name: stat.baseStat};
    return PokemonStats(
      hp: statsMap['hp'] ?? 0,
      attack: statsMap['attack'] ?? 0,
      defense: statsMap['defense'] ?? 0,
      specialAttack: statsMap['special-attack'] ?? 0,
      specialDefense: statsMap['special-defense'] ?? 0,
      speed: statsMap['speed'] ?? 0,
    );
  }
}

// Mapper para convertir PokemonEntity → Pokemon (Design System)
extension PokemonEntityX on PokemonEntity {
  Pokemon toDesignSystemModel({
    required Color backgroundColor,
    bool isFavorite = false,
  }) {
    return Pokemon(
      name: name,
      number: id,
      primaryType: types.first,
      types: types,
      imagePath: imageUrl,
      backgroundColor: backgroundColor,
      isFavorite: isFavorite,
    );
  }
}
```

---

### **Opción 2: DTOs + Reutilizar Pokemon Existente (Pragmático)**

#### ✅ Ventajas
- Menos código
- Reutiliza el modelo `Pokemon` ya creado en design system
- Más rápido de implementar
- Suficiente para app pequeña/mediana

#### ⚠️ Desventajas
- Mezcla concerns (API con UI)
- Modelo `Pokemon` necesitaría todos los campos de detalle
- Menos flexible para cambios futuros

#### 📦 Estructura
```
lib/
├── core/
│   └── design_system/
│       └── organisms/
│           └── pokemon_list_view/
│               └── pokemon.dart (Único modelo de dominio)
├── features/
│   └── pokemon/
│       ├── data/
│       │   ├── models/
│       │   │   ├── pokemon_list_response_dto.dart
│       │   │   └── pokemon_detail_dto.dart (DTOs completos)
│       │   ├── mappers/
│       │   │   └── pokemon_mapper.dart (DTO → Pokemon)
│       │   ├── datasources/
│       │   └── repositories/
│       ├── domain/
│       │   ├── repositories/
│       │   └── usecases/
│       └── presentation/
```

#### 📝 Modelos

**1. Extender Pokemon Existente**

```dart
// pokemon.dart (ACTUALIZADO)
class Pokemon {
  // Campos existentes
  final String name;
  final int number;
  final PokemonType primaryType;
  final List<PokemonType> types;
  final String imagePath;
  final Color backgroundColor;
  bool isFavorite;

  // Nuevos campos para detalle
  final int? height;
  final int? weight;
  final PokemonStats? stats;

  Pokemon({
    required this.name,
    required this.number,
    required this.primaryType,
    required this.types,
    required this.imagePath,
    required this.backgroundColor,
    this.isFavorite = false,
    this.height,
    this.weight,
    this.stats,
  })  : assert(types.isNotEmpty, 'Pokemon debe tener al menos un tipo'),
        assert(types.contains(primaryType), 'primaryType debe estar en types');

  PokemonType? get secondaryType => types.length > 1 ? types[1] : null;
}

class PokemonStats {
  final int hp;
  final int attack;
  final int defense;
  final int specialAttack;
  final int specialDefense;
  final int speed;

  PokemonStats({
    required this.hp,
    required this.attack,
    required this.defense,
    required this.specialAttack,
    required this.specialDefense,
    required this.speed,
  });

  int get total => hp + attack + defense + specialAttack + specialDefense + speed;
}
```

**2. DTOs (igual que Opción 1)**

```dart
// Los mismos DTOs de la Opción 1
```

**3. Mapper Simplificado**

```dart
// pokemon_mapper.dart
extension PokemonDetailDtoX on PokemonDetailDto {
  Pokemon toPokemon({required Color backgroundColor}) {
    return Pokemon(
      name: name,
      number: id,
      primaryType: _mapPrimaryType(),
      types: _mapTypes(),
      imagePath: _getImageUrl(),
      backgroundColor: backgroundColor,
      height: height,
      weight: weight,
      stats: _mapStats(),
    );
  }

  PokemonType _mapPrimaryType() {
    return PokemonTypeMapper.fromString(types.first.type.name);
  }

  List<PokemonType> _mapTypes() {
    return types.map((t) => PokemonTypeMapper.fromString(t.type.name)).toList();
  }

  String _getImageUrl() {
    return sprites.other?.officialArtwork?.frontDefault ??
        sprites.frontDefault ??
        '';
  }

  PokemonStats _mapStats() {
    final statsMap = {for (var stat in stats) stat.stat.name: stat.baseStat};
    return PokemonStats(
      hp: statsMap['hp'] ?? 0,
      attack: statsMap['attack'] ?? 0,
      defense: statsMap['defense'] ?? 0,
      specialAttack: statsMap['special-attack'] ?? 0,
      specialDefense: statsMap['special-defense'] ?? 0,
      speed: statsMap['speed'] ?? 0,
    );
  }
}
```

---

### **Opción 3: Modelo Único con Freezed (Mínimo Viable)**

#### ✅ Ventajas
- Menos archivos
- Rápido de implementar
- Ideal para MVP o prototipo

#### ⚠️ Desventajas
- Viola Clean Architecture
- Difícil de testear
- Acopla API con UI
- No recomendado para producción

#### 📦 Estructura
```
lib/
├── models/
│   ├── pokemon_list_response.dart
│   └── pokemon_detail.dart
└── services/
    └── pokemon_service.dart
```

**No recomiendo esta opción para este proyecto.**

---

## 🎯 Recomendación Final

### **Para tu Pokédex: Opción 2 (Pragmático)**

**Razones:**
1. ✅ Ya tienes el modelo `Pokemon` funcionando perfectamente
2. ✅ Balancea Clean Architecture sin over-engineering
3. ✅ Suficiente separación: DTOs (API) + Pokemon (Domain/UI)
4. ✅ Más rápido de implementar que Opción 1
5. ✅ Fácil de extender si necesitas más complejidad después

### Siguiente Paso
1. Crear DTOs con Freezed
2. Extender modelo `Pokemon` con campos opcionales (height, weight, stats)
3. Crear mappers
4. Implementar repository + datasource
5. Conectar con Riverpod providers

---

## 📊 Comparación Visual

| Aspecto | Opción 1 (Full Clean) | Opción 2 (Pragmático) | Opción 3 (MVP) |
|---------|----------------------|----------------------|----------------|
| Archivos | 🔴 Muchos | 🟡 Moderados | 🟢 Pocos |
| Testabilidad | 🟢 Excelente | 🟢 Buena | 🔴 Difícil |
| Clean Architecture | 🟢 100% | 🟡 80% | 🔴 20% |
| Velocidad desarrollo | 🔴 Lenta | 🟢 Rápida | 🟢 Muy rápida |
| Mantenibilidad | 🟢 Excelente | 🟢 Buena | 🔴 Difícil |
| Recomendado para | Apps grandes | Apps medianas | Prototipos |

---

## 🚀 Plan de Implementación (Opción 2)

### Fase 1: DTOs
```bash
lib/features/pokemon/data/models/
├── pokemon_list_response_dto.dart
├── pokemon_list_response_dto.freezed.dart
├── pokemon_list_response_dto.g.dart
├── pokemon_detail_dto.dart
├── pokemon_detail_dto.freezed.dart
└── pokemon_detail_dto.g.dart
```

### Fase 2: Extender Pokemon
```bash
lib/core/design_system/organisms/pokemon_list_view/
├── pokemon.dart (actualizar)
└── pokemon_stats.dart (nuevo)
```

### Fase 3: Mappers
```bash
lib/features/pokemon/data/mappers/
└── pokemon_mapper.dart
```

### Fase 4: Data Layer
```bash
lib/features/pokemon/data/
├── datasources/
│   └── pokemon_remote_datasource.dart
└── repositories/
    └── pokemon_repository_impl.dart
```

### Fase 5: Domain Layer
```bash
lib/features/pokemon/domain/
├── repositories/
│   └── pokemon_repository.dart
└── usecases/
    ├── get_pokemon_list.dart
    └── get_pokemon_detail.dart
```

### Fase 6: Presentation
```bash
lib/features/pokemon/presentation/
├── providers/
│   ├── pokemon_list_provider.dart
│   └── pokemon_detail_provider.dart
└── screens/
    ├── pokemon_list_screen.dart
    └── pokemon_detail_screen.dart
```

---

¿Quieres que implemente la **Opción 2** o prefieres otra?
