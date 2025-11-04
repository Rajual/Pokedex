import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../atoms/app_svg/app_svg.dart';
import '../../atoms/app_svg/models/app_svg_ui_model.dart';
import 'models/app_type_tag_ui_model.dart';

enum PokemonType {
  water,
  dragon,
  electric,
  fairy,
  ghost,
  fire,
  ice,
  grass,
  bug,
  fighting,
  normal,
  dark,
  steel,
  poison,
  psychic,
  rock,
  ground,
  flying,
}

extension PokemonTypeExtension on PokemonType {
  String get label {
    return switch (this) {
      PokemonType.water => 'Agua',
      PokemonType.dragon => 'Dragón',
      PokemonType.electric => 'Eléctrico',
      PokemonType.fairy => 'Hada',
      PokemonType.ghost => 'Fantasma',
      PokemonType.fire => 'Fuego',
      PokemonType.ice => 'Hielo',
      PokemonType.grass => 'Planta',
      PokemonType.bug => 'Bicho',
      PokemonType.fighting => 'Lucha',
      PokemonType.normal => 'Normal',
      PokemonType.dark => 'Siniestro',
      PokemonType.steel => 'Acero',
      PokemonType.poison => 'Veneno',
      PokemonType.psychic => 'Psíquico',
      PokemonType.rock => 'Roca',
      PokemonType.ground => 'Tierra',
      PokemonType.flying => 'Volador',
    };
  }

  String get svgAsset {
    return 'assets/elements/Type${_typeNameEnglish}.svg';
  }

  String get _typeNameEnglish {
    return switch (this) {
      PokemonType.water => 'water',
      PokemonType.dragon => 'dragon',
      PokemonType.electric => 'electric',
      PokemonType.fairy => 'fairy',
      PokemonType.ghost => 'ghost',
      PokemonType.fire => 'fire',
      PokemonType.ice => 'ice',
      PokemonType.grass => 'grass',
      PokemonType.bug => 'bug',
      PokemonType.fighting => 'fighting',
      PokemonType.normal => 'normal',
      PokemonType.dark => 'dark',
      PokemonType.steel => 'steel',
      PokemonType.poison => 'poison',
      PokemonType.psychic => 'psychic',
      PokemonType.rock => 'rock',
      PokemonType.ground => 'ground',
      PokemonType.flying => 'flying',
    };
  }

  Color get backgroundColor {
    return switch (this) {
      PokemonType.water => PokemonTypeColors.water,
      PokemonType.dragon => PokemonTypeColors.dragon,
      PokemonType.electric => PokemonTypeColors.electric,
      PokemonType.fairy => PokemonTypeColors.fairy,
      PokemonType.ghost => PokemonTypeColors.ghost,
      PokemonType.fire => PokemonTypeColors.fire,
      PokemonType.ice => PokemonTypeColors.ice,
      PokemonType.grass => PokemonTypeColors.grass,
      PokemonType.bug => PokemonTypeColors.bug,
      PokemonType.fighting => PokemonTypeColors.fighting,
      PokemonType.normal => PokemonTypeColors.normal,
      PokemonType.dark => PokemonTypeColors.dark,
      PokemonType.steel => PokemonTypeColors.steel,
      PokemonType.poison => PokemonTypeColors.poison,
      PokemonType.psychic => PokemonTypeColors.psychic,
      PokemonType.rock => PokemonTypeColors.rock,
      PokemonType.ground => PokemonTypeColors.ground,
      PokemonType.flying => PokemonTypeColors.flying,
    };
  }

  Color get backgroundLightColor {
    return switch (this) {
      PokemonType.water => PokemonTypeColors.waterLight,
      PokemonType.dragon => PokemonTypeColors.dragonLight,
      PokemonType.electric => PokemonTypeColors.electricLight,
      PokemonType.fairy => PokemonTypeColors.fairyLight,
      PokemonType.ghost => PokemonTypeColors.ghostLight,
      PokemonType.fire => PokemonTypeColors.fireLight,
      PokemonType.ice => PokemonTypeColors.iceLight,
      PokemonType.grass => PokemonTypeColors.grassLight,
      PokemonType.bug => PokemonTypeColors.bugLight,
      PokemonType.fighting => PokemonTypeColors.fightingLight,
      PokemonType.normal => PokemonTypeColors.normalLight,
      PokemonType.dark => PokemonTypeColors.darkLight,
      PokemonType.steel => PokemonTypeColors.steelLight,
      PokemonType.poison => PokemonTypeColors.poisonLight,
      PokemonType.psychic => PokemonTypeColors.psychicLight,
      PokemonType.rock => PokemonTypeColors.rockLight,
      PokemonType.ground => PokemonTypeColors.groundLight,
      PokemonType.flying => PokemonTypeColors.flyingLight,
    };
  }
}

/// Tamaño del tag
enum TypeTagSize {
  small,
  medium,
  large,
}

extension TypeTagSizeExtension on TypeTagSize {
  double get height {
    return switch (this) {
      TypeTagSize.small => 28,
      TypeTagSize.medium => 36,
      TypeTagSize.large => 44,
    };
  }

  double get horizontalPadding {
    return switch (this) {
      TypeTagSize.small => 8,
      TypeTagSize.medium => 12,
      TypeTagSize.large => 16,
    };
  }

  double get fontSize {
    return switch (this) {
      TypeTagSize.small => 12,
      TypeTagSize.medium => 14,
      TypeTagSize.large => 16,
    };
  }

  SvgSize get iconSize {
    return switch (this) {
      TypeTagSize.small => SvgSize.small,
      TypeTagSize.medium => SvgSize.medium,
      TypeTagSize.large => SvgSize.large,
    };
  }
}

/// Tag atom para mostrar tipos de Pokémon con icono SVG
class AppTypeTag extends StatelessWidget {
  final PokemonType type;
  final TypeTagSize size;
  final bool fullWidth;

  const AppTypeTag({
    Key? key,
    required this.type,
    this.size = TypeTagSize.medium,
    this.fullWidth = false,
  }) : super(key: key);

  /// Default constructor using uiModel (recommended)
  factory AppTypeTag.fromUiModel(AppTypeTagUiModel uiModel, {Key? key}) {
    return AppTypeTag(
      type: uiModel.type,
      size: uiModel.size,
      fullWidth: uiModel.fullWidth,
      key: key,
    );
  }



  /// Factory constructor for backward compatibility
  factory AppTypeTag.fromProperties({
    required PokemonType type,
    TypeTagSize size = TypeTagSize.medium,
    bool fullWidth = false,
    Key? key,
  }) {
    return AppTypeTag(
      type: type,
      size: size,
      fullWidth: fullWidth,
      key: key,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height,
      constraints: fullWidth ? BoxConstraints(minWidth: double.infinity) : null,
      decoration: BoxDecoration(
        color: type.backgroundColor,
        borderRadius: BorderRadius.circular(size.height / 2),
      ),
      child: Row(
        mainAxisSize: fullWidth ? MainAxisSize.max : MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.horizontalPadding),
            child: AppSvg(
              uiModel: AppSvgUiModel(
                assetPath: type.svgAsset,
                size: size.iconSize,
                color: Colors.white,
              ),
            ),
          ),
          Text(
            type.label,
            style: TextStyle(
              color: Colors.white,
              fontSize: size.fontSize,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
            ),
          ),
          if (fullWidth) SizedBox(width: size.horizontalPadding),
        ],
      ),
    );
  }
}
