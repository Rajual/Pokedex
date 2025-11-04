import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:desing_system/templates/pokemon_detail_template/pokemon_detail_template.dart';
import 'package:desing_system/templates/pokemon_detail_template/models/pokemon_detail_template_ui_model.dart';
import 'package:desing_system/atoms/stat_card/models/stat_card_ui_model.dart';
import 'package:desing_system/molecules/app_type_tag/app_type_tag.dart' as design_system;
import '../../../../core/common/result.dart';
import '../../domain/entities/pokemon_detail_entity.dart' as domain;
import '../../domain/repositories/pokemon_detail_repository.dart';
import '../presenter/pokemon_detail_presenter.dart';

/// Screen for displaying Pokemon detail using PokemonDetailTemplate
class PokemonDetailScreen extends ConsumerStatefulWidget {
  /// The Pokemon ID to display
  final String pokemonId;

  const PokemonDetailScreen({
    super.key,
    required this.pokemonId,
  });

  @override
  ConsumerState<PokemonDetailScreen> createState() => _PokemonDetailScreenState();
}

class _PokemonDetailScreenState extends ConsumerState<PokemonDetailScreen> {
  Result<domain.PokemonDetailEntity, PokemonDetailFailure>? _result;
  Map<String, dynamic>? _localeData;

  @override
  void initState() {
    super.initState();
    _loadLocaleData();
    _loadPokemonDetail();
  }

  Future<void> _loadLocaleData() async {
    try {
      // Get current locale (simplified - in real app you'd use localization service)
      // For now, we'll assume English as default
      const locale = 'en';

      final assetPath = 'assets/locals/$locale/details.json';
      final jsonString = await DefaultAssetBundle.of(context).loadString(assetPath);
      final data = json.decode(jsonString) as Map<String, dynamic>;
      setState(() {
        _localeData = data;
      });
    } catch (e) {
      // Fallback to default values if localization fails
      setState(() {
        _localeData = {
          'stats': {
            'weight': {'label': 'WEIGHT', 'icon': 'monitor_weight'},
            'height': {'label': 'HEIGHT', 'icon': 'height'},
            'category': {'label': 'CATEGORY', 'icon': 'category'},
            'ability': {'label': 'ABILITY', 'icon': 'flash_on'},
          }
        };
      });
    }
  }

  Future<void> _loadPokemonDetail() async {
    final presenter = ref.read(pokemonDetailPresenterProvider);
    final result = await presenter.loadPokemonDetail(widget.pokemonId);
    setState(() {
      _result = result;
    });
  }

  Future<void> _toggleFavorite() async {
    if (_result?.isSuccess == true) {
      final presenter = ref.read(pokemonDetailPresenterProvider);
      final result = await presenter.toggleFavorite(widget.pokemonId);

      if (result.isSuccess && mounted) {
        // Reload the Pokemon data to reflect the new favorite status
        await _loadPokemonDetail();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_result == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return _result!.match(
      onSuccess: (pokemon) => _buildPokemonDetail(pokemon),
      onFailure: (error) => _buildErrorContent(error),
    );
  }

  Widget _buildPokemonDetail(domain.PokemonDetailEntity pokemon) {
    // Convert domain entity types to design system types
    final designSystemTypes = pokemon.types.map((type) {
      return _convertToDesignSystemType(type);
    }).toList();

    final designSystemWeaknesses = pokemon.weaknesses.map((weakness) {
      return _convertToDesignSystemType(weakness);
    }).toList();

    // Create stats list from the Pokemon data using localized labels and icons
    final stats = _createStatsList(pokemon);

    // Convert domain entity to UI model for the template
    final uiModel = PokemonDetailTemplateUiModel(
      number: pokemon.number,
      name: pokemon.name,
      imageUrl: pokemon.imageUrl,
      types: designSystemTypes,
      description: pokemon.description,
      stats: stats,
      malePercentage: pokemon.malePercentage,
      femalePercentage: pokemon.femalePercentage,
      weaknesses: designSystemWeaknesses,
      primaryColor: pokemon.primaryColor,
      isFavorite: pokemon.isFavorite,
      onFavoriteToggle: _toggleFavorite,
      onBack: () => Navigator.of(context).pop(),
    );

    return PokemonDetailTemplate(uiModel: uiModel);
  }

  List<StatCardUiModel> _createStatsList(domain.PokemonDetailEntity pokemon) {
    // Use loaded localization data or fallback to defaults
    final statsConfig = _localeData?['stats'] as Map<String, dynamic>? ?? {
      'weight': {'label': 'WEIGHT', 'icon': 'monitor_weight'},
      'height': {'label': 'HEIGHT', 'icon': 'height'},
      'category': {'label': 'CATEGORY', 'icon': 'category'},
      'ability': {'label': 'ABILITY', 'icon': 'flash_on'},
    };

    return [
      _createStatCard('weight', pokemon.weight, statsConfig),
      _createStatCard('height', pokemon.height, statsConfig),
      _createStatCard('category', pokemon.category, statsConfig),
      _createStatCard('ability', pokemon.ability, statsConfig),
    ];
  }

  StatCardUiModel _createStatCard(String statKey, String value, Map<String, dynamic> statsConfig) {
    final statConfig = statsConfig[statKey] as Map<String, dynamic>? ?? {'label': statKey.toUpperCase(), 'icon': 'help'};
    final label = statConfig['label'] as String? ?? statKey.toUpperCase();
    final iconName = statConfig['icon'] as String? ?? 'help';

    // Convert icon name to IconData
    final icon = _getIconFromName(iconName);

    return StatCardUiModel(
      icon: icon,
      label: label,
      value: value,
    );
  }

  IconData _getIconFromName(String iconName) {
    switch (iconName) {
      case 'monitor_weight':
        return Icons.monitor_weight;
      case 'height':
        return Icons.height;
      case 'category':
        return Icons.category;
      case 'flash_on':
        return Icons.flash_on;
      default:
        return Icons.help;
    }
  }

  // Convert our domain PokemonType to design system PokemonType
  design_system.PokemonType _convertToDesignSystemType(domain.PokemonType domainType) {
    // Since both enums have the same values in the same order, we can just cast
    // In a real app, you'd want proper mapping
    return design_system.PokemonType.values[domainType.index];
  }

  Widget _buildErrorContent(PokemonDetailFailure error) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 64,
              color: Colors.red,
            ),
            const SizedBox(height: 16),
            Text(
              'Failed to load Pokemon details',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              error.toString(),
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _loadPokemonDetail,
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}