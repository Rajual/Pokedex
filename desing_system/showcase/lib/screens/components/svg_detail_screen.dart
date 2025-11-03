import 'package:flutter/material.dart';
import 'package:desing_system/desing_system.dart';

class SvgDetailScreen extends StatelessWidget {
  const SvgDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App SVG'),
        backgroundColor: AppColors.primary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildSectionTitle(context, 'Network SVGs'),
          _buildComponentCard(
            child: Column(
              children: [
                AppSvg(
                  'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream-world/25.svg',
                  size: SvgSize.small,
                ),
                const SizedBox(height: 8),
                const Text('Small Size'),
              ],
            ),
            codeSnippet: '''
AppSvg(
  'https://example.com/image.svg',
  size: SvgSize.small,
)''',
          ),

          _buildComponentCard(
            child: Column(
              children: [
                AppSvg(
                  'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream-world/1.svg',
                  size: SvgSize.medium,
                ),
                const SizedBox(height: 8),
                const Text('Medium Size'),
              ],
            ),
            codeSnippet: '''
AppSvg(
  'https://example.com/image.svg',
  size: SvgSize.medium,
)''',
          ),

          _buildComponentCard(
            child: Column(
              children: [
                AppSvg(
                  'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream-world/6.svg',
                  size: SvgSize.large,
                ),
                const SizedBox(height: 8),
                const Text('Large Size'),
              ],
            ),
            codeSnippet: '''
AppSvg(
  'https://example.com/image.svg',
  size: SvgSize.large,
)''',
          ),

          _buildSectionTitle(context, 'Different Sizes Comparison'),
          _buildComponentCard(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    AppSvg(
                      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream-world/4.svg',
                      size: SvgSize.small,
                    ),
                    const SizedBox(height: 4),
                    const Text('Small', style: TextStyle(fontSize: 12)),
                  ],
                ),
                Column(
                  children: [
                    AppSvg(
                      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream-world/4.svg',
                      size: SvgSize.medium,
                    ),
                    const SizedBox(height: 4),
                    const Text('Medium', style: TextStyle(fontSize: 12)),
                  ],
                ),
                Column(
                  children: [
                    AppSvg(
                      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream-world/4.svg',
                      size: SvgSize.large,
                    ),
                    const SizedBox(height: 4),
                    const Text('Large', style: TextStyle(fontSize: 12)),
                  ],
                ),
              ],
            ),
            codeSnippet: '''
// Small size
AppSvg('image.svg', size: SvgSize.small)

// Medium size
AppSvg('image.svg', size: SvgSize.medium)

// Large size
AppSvg('image.svg', size: SvgSize.large)''',
          ),

          _buildSectionTitle(context, 'Error Handling'),
          _buildComponentCard(
            child: Column(
              children: [
                AppSvg(
                  'https://invalid-url-that-does-not-exist.com/image.svg',
                  size: SvgSize.medium,
                ),
                const SizedBox(height: 8),
                const Text('Invalid URL - shows error placeholder'),
              ],
            ),
            codeSnippet: '''
AppSvg(
  'https://invalid-url.com/image.svg',
  size: SvgSize.medium,
)
// Shows error placeholder when SVG fails to load''',
          ),

          _buildSectionTitle(context, 'Usage Notes'),
          Card(
            margin: const EdgeInsets.only(bottom: 16.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'AppSvg Component Notes:',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '• Supports network SVG URLs\n'
                    '• Automatically handles loading and error states\n'
                    '• Three predefined sizes: small, medium, large\n'
                    '• Uses flutter_svg package for rendering\n'
                    '• Shows placeholder on error',
                    style: TextStyle(height: 1.5),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
      ),
    );
  }

  Widget _buildComponentCard({required Widget child, required String codeSnippet}) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            child,
            const SizedBox(height: 16),
            ExpansionTile(
              title: const Text('View Code'),
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    codeSnippet,
                    style: const TextStyle(
                      fontFamily: 'monospace',
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}