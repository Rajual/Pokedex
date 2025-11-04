import 'package:flutter/material.dart';
import 'package:desing_system/desing_system.dart';

class HeroImageHeaderScreen extends StatelessWidget {
  const HeroImageHeaderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hero Image Header'),
        backgroundColor: AppColors.primary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Description
          _buildDescription(),
          const SizedBox(height: 24),

          // Example 1: Basic
          _buildSectionTitle('Basic Hero Header'),
          const SizedBox(height: 12),
          _buildExample1(),
          const SizedBox(height: 32),

          // Example 2: With Decorations
          _buildSectionTitle('With Circle Decorations'),
          const SizedBox(height: 12),
          _buildExample2(),
          const SizedBox(height: 32),

          // Example 3: Custom Actions
          _buildSectionTitle('With Custom Actions'),
          const SizedBox(height: 12),
          _buildExample3(),
          const SizedBox(height: 32),

          // Example 4: Different Sizes
          _buildSectionTitle('Different Decoration Sizes'),
          const SizedBox(height: 12),
          _buildExample4(),
        ],
      ),
    );
  }

  Widget _buildDescription() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.wallpaper, color: Colors.blue.shade700),
              const SizedBox(width: 8),
              Text(
                'Hero Image Header',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            'A reusable organism that displays a hero image with gradient background, '
            'optional circle decorations, and customizable actions. Perfect for detail '
            'screens and headers.',
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildExample1() {
    return Container(
      height: 400,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: HeroImageHeader(
          uiModel: HeroImageHeaderUiModel(
            imageUrl: 'assets/ilustration/PokemonBulbasaur.png',
            heroTag: 'bulbasaur',
            backgroundColor: const Color(0xFF78C850),
            expandedHeightFraction: 0.5,
            imageWidthFraction: 0.5,
          ),
        ),
      ),
    );
  }

  Widget _buildExample2() {
    return Container(
      height: 400,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: HeroImageHeader(
          uiModel: HeroImageHeaderUiModel(
            imageUrl: 'assets/ilustration/PokemonCharmander.png',
            heroTag: 'charmander',
            backgroundColor: const Color(0xFFF08030),
            expandedHeightFraction: 0.5,
            imageWidthFraction: 0.5,
            showDecoration: true,
            decorationOpacity: 0.1,
            decorationSize: DecorationSize.large,
            decorationPosition: CircleDecorationPosition.topRight,
          ),
        ),
      ),
    );
  }

  Widget _buildExample3() {
    return Container(
      height: 400,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: HeroImageHeader(
          uiModel: HeroImageHeaderUiModel(
            imageUrl: 'assets/ilustration/PokemonSquirtle.png',
            heroTag: 'squirtle',
            backgroundColor: const Color(0xFF6890F0),
            expandedHeightFraction: 0.5,
            imageWidthFraction: 0.5,
            showBackButton: true,
            backButtonIcon: Icons.arrow_back_ios,
            actions: [
              IconButton(
                icon: const Icon(Icons.share, color: Colors.white),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.star_border, color: Colors.white),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExample4() {
    return Column(
      children: [
        // Small decoration
        Container(
          height: 350,
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(12),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: HeroImageHeader(
              uiModel: HeroImageHeaderUiModel(
                imageUrl: 'assets/ilustration/PokemonPikachu.png',
                heroTag: 'pikachu',
                backgroundColor: const Color(0xFFF8D030),
                expandedHeightFraction: 0.45,
                imageWidthFraction: 0.45,
                showDecoration: true,
                decorationOpacity: 0.15,
                decorationSize: DecorationSize.small,
                decorationPosition: CircleDecorationPosition.bottomLeft,
              ),
            ),
          ),
        ),

        // Medium decoration
        Container(
          height: 350,
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(12),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: HeroImageHeader(
              uiModel: HeroImageHeaderUiModel(
                imageUrl: 'assets/ilustration/PokemonEevee.png',
                heroTag: 'eevee',
                backgroundColor: const Color(0xFFA8A878),
                expandedHeightFraction: 0.45,
                imageWidthFraction: 0.45,
                showDecoration: true,
                decorationOpacity: 0.15,
                decorationSize: DecorationSize.medium,
                decorationPosition: CircleDecorationPosition.bottomRight,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
