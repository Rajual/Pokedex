import 'package:flutter/material.dart';
import '../../../molecules/app_type_tag/app_type_tag.dart';

/// Tamaños disponibles para AppCard
enum CardSize {
  small,    // 120x160
  medium,   // 140x200
  large,    // 160x240
}

extension CardSizeExtension on CardSize {
  double get width {
    return switch (this) {
      CardSize.small => 120,
      CardSize.medium => 140,
      CardSize.large => 160,
    };
  }

  double get height {
    return switch (this) {
      CardSize.small => 160,
      CardSize.medium => 200,
      CardSize.large => 240,
    };
  }

  double get padding {
    return switch (this) {
      CardSize.small => 8,
      CardSize.medium => 12,
      CardSize.large => 16,
    };
  }

  double get borderRadius {
    return switch (this) {
      CardSize.small => 12,
      CardSize.medium => 16,
      CardSize.large => 20,
    };
  }

  double get imageSize {
    return switch (this) {
      CardSize.small => 60,
      CardSize.medium => 80,
      CardSize.large => 100,
    };
  }
}


/// Estilos disponibles para AppCard
enum CardStyle {
  elevated,  // Con sombra
  outlined,  // Con borde
  filled,    // Relleno sólido
}

/// Elevación disponible para AppCard
enum CardElevation {
  none,    // Sin elevación
  low,     // Baja elevación
  medium,  // Elevación media
  high,    // Alta elevación
}

extension CardElevationExtension on CardElevation {
  double get value {
    return switch (this) {
      CardElevation.none => 0,
      CardElevation.low => 2,
      CardElevation.medium => 4,
      CardElevation.high => 8,
    };
  }
}

/// UI Model for AppCard component
/// Contains all the serializable configuration needed to render an AppCard
/// Note: Callbacks like onFavoriteChanged and onTap should be provided separately when creating the widget
class AppCardUiModel {
  final String pokemonName;
  final int pokemonNumber;
  final PokemonType primaryType;
  final PokemonType? secondaryType;
  final String imagePath;
  final Color backgroundColor;
  final bool isFavorite;
  final CardSize size;
  final CardStyle style;
  final CardElevation elevation;
  final bool isEnabled;
  final bool showPokemonNumber;

  const AppCardUiModel({
    required this.pokemonName,
    required this.pokemonNumber,
    required this.primaryType,
    required this.imagePath,
    required this.backgroundColor,
    required this.isFavorite,
    this.secondaryType,
    this.size = CardSize.medium,
    this.style = CardStyle.elevated,
    this.elevation = CardElevation.medium,
    this.isEnabled = true,
    this.showPokemonNumber = true,
  });

  /// Factory constructor to create from JSON
  factory AppCardUiModel.fromJson(Map<String, dynamic> json) {
    return AppCardUiModel(
      pokemonName: json['pokemonName'] as String,
      pokemonNumber: json['pokemonNumber'] as int,
      primaryType: PokemonType.values.firstWhere(
        (e) => e.name == json['primaryType'],
        orElse: () => PokemonType.normal,
      ),
      secondaryType: json['secondaryType'] != null
          ? PokemonType.values.firstWhere(
              (e) => e.name == json['secondaryType'],
              orElse: () => PokemonType.normal,
            )
          : null,
      imagePath: json['imagePath'] as String,
      backgroundColor: Color(json['backgroundColor'] as int),
      isFavorite: json['isFavorite'] as bool? ?? false,
      size: CardSize.values.firstWhere(
        (e) => e.name == json['size'],
        orElse: () => CardSize.medium,
      ),
      style: CardStyle.values.firstWhere(
        (e) => e.name == json['style'],
        orElse: () => CardStyle.elevated,
      ),
      elevation: CardElevation.values.firstWhere(
        (e) => e.name == json['elevation'],
        orElse: () => CardElevation.medium,
      ),
      isEnabled: json['isEnabled'] as bool? ?? true,
      showPokemonNumber: json['showPokemonNumber'] as bool? ?? true,
    );
  }

  /// Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'pokemonName': pokemonName,
      'pokemonNumber': pokemonNumber,
      'primaryType': primaryType.name,
      'secondaryType': secondaryType?.name,
      'imagePath': imagePath,
      'backgroundColor': backgroundColor.value,
      'isFavorite': isFavorite,
      'size': size.name,
      'style': style.name,
      'elevation': elevation.name,
      'isEnabled': isEnabled,
      'showPokemonNumber': showPokemonNumber,
    };
  }

  /// Create a copy with modified properties
  AppCardUiModel copyWith({
    String? pokemonName,
    int? pokemonNumber,
    PokemonType? primaryType,
    PokemonType? secondaryType,
    String? imagePath,
    Color? backgroundColor,
    bool? isFavorite,
    CardSize? size,
    CardStyle? style,
    CardElevation? elevation,
    bool? isEnabled,
    bool? showPokemonNumber,
  }) {
    return AppCardUiModel(
      pokemonName: pokemonName ?? this.pokemonName,
      pokemonNumber: pokemonNumber ?? this.pokemonNumber,
      primaryType: primaryType ?? this.primaryType,
      secondaryType: secondaryType ?? this.secondaryType,
      imagePath: imagePath ?? this.imagePath,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      isFavorite: isFavorite ?? this.isFavorite,
      size: size ?? this.size,
      style: style ?? this.style,
      elevation: elevation ?? this.elevation,
      isEnabled: isEnabled ?? this.isEnabled,
      showPokemonNumber: showPokemonNumber ?? this.showPokemonNumber,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AppCardUiModel &&
        other.pokemonName == pokemonName &&
        other.pokemonNumber == pokemonNumber &&
        other.primaryType == primaryType &&
        other.secondaryType == secondaryType &&
        other.imagePath == imagePath &&
        other.backgroundColor == backgroundColor &&
        other.isFavorite == isFavorite &&
        other.size == size &&
        other.style == style &&
        other.elevation == elevation &&
        other.isEnabled == isEnabled &&
        other.showPokemonNumber == showPokemonNumber;
  }

  @override
  int get hashCode {
    return Object.hash(
      pokemonName,
      pokemonNumber,
      primaryType,
      secondaryType,
      imagePath,
      backgroundColor,
      isFavorite,
      size,
      style,
      elevation,
      isEnabled,
      showPokemonNumber,
    );
  }

  @override
  String toString() {
    return 'AppCardUiModel(pokemonName: $pokemonName, pokemonNumber: $pokemonNumber, primaryType: $primaryType, secondaryType: $secondaryType, imagePath: $imagePath, backgroundColor: $backgroundColor, isFavorite: $isFavorite, size: $size, style: $style, elevation: $elevation, isEnabled: $isEnabled, showPokemonNumber: $showPokemonNumber)';
  }
}