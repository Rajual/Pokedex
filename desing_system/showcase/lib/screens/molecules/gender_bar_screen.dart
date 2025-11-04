import 'package:desing_system/desing_system.dart';
import 'package:flutter/material.dart';

class GenderBarScreen extends StatelessWidget {
  const GenderBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gender Bar Examples'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppDimensions.lg),
        children: [
          _buildSectionTitle('Three Variants'),
          _buildVariantsSection(),
          const SizedBox(height: AppDimensions.xxl),
          _buildSectionTitle('Size Variations'),
          _buildSizesSection(),
          const SizedBox(height: AppDimensions.xxl),
          _buildSectionTitle('Real Pokémon Examples'),
          _buildPokemonExamplesSection(),
          const SizedBox(height: AppDimensions.xxl),
          _buildSectionTitle('Special Cases'),
          _buildSpecialCasesSection(),
          const SizedBox(height: AppDimensions.xxl),
          _buildSectionTitle('Custom Colors'),
          _buildCustomColorsSection(),
          const SizedBox(height: AppDimensions.xxl),
          _buildSectionTitle('Error States'),
          _buildErrorStatesSection(),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppDimensions.md),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildVariantsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Detailed Variant (with icons + percentages)',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: AppDimensions.sm),
        GenderBar(
          uiModel: GenderBarUiModel(
            malePercentage: 87.5,
            femalePercentage: 12.5,
            variant: GenderBarVariant.detailed,
            title: 'GÉNERO',
          ),
        ),
        const SizedBox(height: AppDimensions.xl),
        const Text(
          'Simple Variant (percentages only)',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: AppDimensions.sm),
        GenderBar(
          uiModel: GenderBarUiModel(
            malePercentage: 87.5,
            femalePercentage: 12.5,
            variant: GenderBarVariant.simple,
            showIcons: false,
            title: 'GÉNERO',
          ),
        ),
        const SizedBox(height: AppDimensions.xl),
        const Text(
          'Compact Variant (bar only)',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: AppDimensions.sm),
        GenderBar(
          uiModel: GenderBarUiModel(
            malePercentage: 87.5,
            femalePercentage: 12.5,
            variant: GenderBarVariant.compact,
            title: 'GÉNERO',
          ),
        ),
      ],
    );
  }

  Widget _buildSizesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Small',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: AppDimensions.sm),
        GenderBar(
          uiModel: GenderBarUiModel(
            malePercentage: 50.0,
            femalePercentage: 50.0,
            size: GenderBarSize.small,
            title: 'Small Size',
          ),
        ),
        const SizedBox(height: AppDimensions.xl),
        const Text(
          'Medium (default)',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: AppDimensions.sm),
        GenderBar(
          uiModel: GenderBarUiModel(
            malePercentage: 50.0,
            femalePercentage: 50.0,
            size: GenderBarSize.medium,
            title: 'Medium Size',
          ),
        ),
        const SizedBox(height: AppDimensions.xl),
        const Text(
          'Large',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: AppDimensions.sm),
        GenderBar(
          uiModel: GenderBarUiModel(
            malePercentage: 50.0,
            femalePercentage: 50.0,
            size: GenderBarSize.large,
            title: 'Large Size',
          ),
        ),
      ],
    );
  }

  Widget _buildPokemonExamplesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Bulbasaur (87.5% ♂ / 12.5% ♀)',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: AppDimensions.sm),
        GenderBar(
          uiModel: GenderBarUiModel(
            malePercentage: 87.5,
            femalePercentage: 12.5,
            title: 'Bulbasaur',
          ),
        ),
        const SizedBox(height: AppDimensions.xl),
        const Text(
          'Pikachu (50% ♂ / 50% ♀)',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: AppDimensions.sm),
        GenderBar(
          uiModel: GenderBarUiModel(
            malePercentage: 50.0,
            femalePercentage: 50.0,
            title: 'Pikachu',
          ),
        ),
        const SizedBox(height: AppDimensions.xl),
        const Text(
          'Eevee (87.5% ♂ / 12.5% ♀)',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: AppDimensions.sm),
        GenderBar(
          uiModel: GenderBarUiModel(
            malePercentage: 87.5,
            femalePercentage: 12.5,
            title: 'Eevee',
          ),
        ),
        const SizedBox(height: AppDimensions.xl),
        const Text(
          'Nidoran (100% ♀)',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: AppDimensions.sm),
        GenderBar(
          uiModel: GenderBarUiModel(
            malePercentage: 0.0,
            femalePercentage: 100.0,
            title: 'Nidoran♀',
          ),
        ),
      ],
    );
  }

  Widget _buildSpecialCasesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '100% Male (some legendaries)',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: AppDimensions.sm),
        GenderBar(
          uiModel: GenderBarUiModel(
            malePercentage: 100.0,
            femalePercentage: 0.0,
            title: 'Tauros',
          ),
        ),
        const SizedBox(height: AppDimensions.xl),
        const Text(
          '100% Female (Chansey)',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: AppDimensions.sm),
        GenderBar(
          uiModel: GenderBarUiModel(
            malePercentage: 0.0,
            femalePercentage: 100.0,
            title: 'Chansey',
          ),
        ),
        const SizedBox(height: AppDimensions.xl),
        const Text(
          '25% Male / 75% Female',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: AppDimensions.sm),
        GenderBar(
          uiModel: GenderBarUiModel(
            malePercentage: 25.0,
            femalePercentage: 75.0,
            title: 'Rare Distribution',
          ),
        ),
      ],
    );
  }

  Widget _buildCustomColorsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Custom Green/Purple',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: AppDimensions.sm),
        GenderBar(
          uiModel: GenderBarUiModel(
            malePercentage: 60.0,
            femalePercentage: 40.0,
            maleColor: Colors.green,
            femaleColor: Colors.purple,
            title: 'Custom Colors',
          ),
        ),
        const SizedBox(height: AppDimensions.xl),
        const Text(
          'Custom Orange/Cyan',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: AppDimensions.sm),
        GenderBar(
          uiModel: GenderBarUiModel(
            malePercentage: 70.0,
            femalePercentage: 30.0,
            maleColor: Colors.orange,
            femaleColor: Colors.cyan,
            title: 'Custom Theme',
          ),
        ),
        const SizedBox(height: AppDimensions.xl),
        const Text(
          'Custom Red/Yellow',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: AppDimensions.sm),
        GenderBar(
          uiModel: GenderBarUiModel(
            malePercentage: 45.0,
            femalePercentage: 55.0,
            maleColor: Colors.red,
            femaleColor: Colors.amber,
            title: 'Fire Theme',
          ),
        ),
      ],
    );
  }

  Widget _buildErrorStatesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Invalid Percentages (sum ≠ 100)',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: AppDimensions.sm),
        GenderBar(
          uiModel: GenderBarUiModel(
            malePercentage: 60.0,
            femalePercentage: 30.0, // Sum = 90
            title: 'Error Example',
          ),
        ),
        const SizedBox(height: AppDimensions.xl),
        const Text(
          'Invalid Percentages (sum > 100)',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: AppDimensions.sm),
        GenderBar(
          uiModel: GenderBarUiModel(
            malePercentage: 70.0,
            femalePercentage: 50.0, // Sum = 120
            title: 'Error Example 2',
          ),
        ),
      ],
    );
  }
}
