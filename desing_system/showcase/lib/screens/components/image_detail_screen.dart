import 'package:flutter/material.dart';
import 'package:desing_system/desing_system.dart';

class ImageDetailScreen extends StatelessWidget {
  const ImageDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Image'),
        backgroundColor: AppColors.primary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildSectionTitle(context, 'Network Images'),
          _buildComponentCard(
            child: Column(
              children: [
                AppImage.fromProperties(
                  'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/25.png',
                  size: AppImageSize.small,
                  fit: AppImageFit.contain,
                ),
                const SizedBox(height: 8),
                const Text('Small Size - Contain Fit'),
              ],
            ),
            codeSnippet: '''
AppImage.fromProperties(
 assetPath: 'https://example.com/image.png',
 size: AppImageSize.small,
 fit: AppImageFit.contain,
)''',
          ),

          _buildComponentCard(
            child: Column(
              children: [
                AppImage.fromProperties(
                  'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png',
                  size: AppImageSize.medium,
                  fit: AppImageFit.cover,
                ),
                const SizedBox(height: 8),
                const Text('Medium Size - Cover Fit'),
              ],
            ),
            codeSnippet: '''
AppImage.fromProperties(
 assetPath: 'https://example.com/image.png',
 size: AppImageSize.medium,
 fit: AppImageFit.cover,
)''',
          ),

          _buildComponentCard(
            child: Column(
              children: [
                AppImage.fromProperties(
                  'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/6.png',
                  size: AppImageSize.large,
                  fit: AppImageFit.contain,
                  showShadow: true,
                ),
                const SizedBox(height: 8),
                const Text('Large Size - Contain Fit with Shadow'),
              ],
            ),
            codeSnippet: '''
AppImage.fromProperties(
 assetPath: 'https://example.com/image.png',
 size: AppImageSize.large,
 fit: AppImageFit.contain,
 showShadow: true,
)''',
          ),

          _buildSectionTitle(context, 'Different Fit Options'),
          _buildComponentCard(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      AppImage.fromProperties(
                        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/4.png',
                        size: AppImageSize.medium,
                        fit: AppImageFit.contain,
                      ),
                      const SizedBox(height: 4),
                      const Text('Contain', textAlign: TextAlign.center),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    children: [
                      AppImage.fromProperties(
                        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/4.png',
                        size: AppImageSize.medium,
                        fit: AppImageFit.cover,
                      ),
                      const SizedBox(height: 4),
                      const Text('Cover', textAlign: TextAlign.center),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    children: [
                      AppImage.fromProperties(
                        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/4.png',
                        size: AppImageSize.medium,
                        fit: AppImageFit.fill,
                      ),
                      const SizedBox(height: 4),
                      const Text('Fill', textAlign: TextAlign.center),
                    ],
                  ),
                ),
              ],
            ),
            codeSnippet: '''
// Contain - maintains aspect ratio, fits within bounds
AppImage(
  'image.png',
  fit: AppImageFit.contain,
)

// Cover - maintains aspect ratio, fills bounds
AppImage(
  'image.png',
  fit: AppImageFit.cover,
)

// Fill - stretches to fill bounds
AppImage(
  'image.png',
  fit: AppImageFit.fill,
)''',
          ),

          _buildSectionTitle(context, 'With Custom Background'),
          _buildComponentCard(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(8),
              ),
              child: AppImage.fromProperties(
                'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/150.png',
                size: AppImageSize.medium,
                fit: AppImageFit.contain,
                backgroundColor: Colors.blue[100],
              ),
            ),
            codeSnippet: '''
AppImage(
  'image.png',
  size: AppImageSize.medium,
  fit: AppImageFit.contain,
  backgroundColor: Colors.blue[100],
)''',
          ),

          _buildSectionTitle(context, 'Error Handling'),
          _buildComponentCard(
            child: Column(
              children: [
                AppImage.fromProperties(
                  'https://invalid-url-that-does-not-exist.com/image.png',
                  size: AppImageSize.medium,
                  fit: AppImageFit.contain,
                ),
                const SizedBox(height: 8),
                const Text('Invalid URL - shows error placeholder'),
              ],
            ),
            codeSnippet: '''
AppImage(
  'https://invalid-url.com/image.png',
  size: AppImageSize.medium,
  fit: AppImageFit.contain,
)
// Shows error placeholder when image fails to load''',
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