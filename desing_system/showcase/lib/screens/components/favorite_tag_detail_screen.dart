import 'package:flutter/material.dart';
import 'package:desing_system/desing_system.dart';

class FavoriteTagDetailScreen extends StatefulWidget {
  const FavoriteTagDetailScreen({super.key});

  @override
  State<FavoriteTagDetailScreen> createState() => _FavoriteTagDetailScreenState();
}

class _FavoriteTagDetailScreenState extends State<FavoriteTagDetailScreen> {
  bool _isFavoriteFilled = false;
  bool _isFavoriteOutlined = false;
  bool _isFavoriteAnimated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Favorite Tag'),
        backgroundColor: AppColors.primary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildSectionTitle(context, 'Styles'),
          _buildComponentCard(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    AppFavoriteTag(
                      isFavorite: _isFavoriteFilled,
                      onFavoriteChanged: (value) => setState(() => _isFavoriteFilled = value),
                      size: FavoriteTagSize.medium,
                      style: FavoriteTagStyle.filled,
                    ),
                    const SizedBox(height: 4),
                    const Text('Filled', style: TextStyle(fontSize: 12)),
                  ],
                ),
                Column(
                  children: [
                    AppFavoriteTag(
                      isFavorite: _isFavoriteOutlined,
                      onFavoriteChanged: (value) => setState(() => _isFavoriteOutlined = value),
                      size: FavoriteTagSize.medium,
                      style: FavoriteTagStyle.outlined,
                    ),
                    const SizedBox(height: 4),
                    const Text('Outlined', style: TextStyle(fontSize: 12)),
                  ],
                ),
              ],
            ),
            codeSnippet: '''
// Filled style
AppFavoriteTag(
  isFavorite: isFavorite,
  onFavoriteChanged: (value) => setState(() => isFavorite = value),
  style: FavoriteTagStyle.filled,
)

// Outlined style
AppFavoriteTag(
  isFavorite: isFavorite,
  onFavoriteChanged: (value) => setState(() => isFavorite = value),
  style: FavoriteTagStyle.outlined,
)''',
          ),

          _buildSectionTitle(context, 'Sizes'),
          _buildComponentCard(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    AppFavoriteTag(
                      isFavorite: true,
                      onFavoriteChanged: (value) {},
                      size: FavoriteTagSize.small,
                      style: FavoriteTagStyle.filled,
                    ),
                    const SizedBox(height: 4),
                    const Text('Small', style: TextStyle(fontSize: 12)),
                  ],
                ),
                Column(
                  children: [
                    AppFavoriteTag(
                      isFavorite: true,
                      onFavoriteChanged: (value) {},
                      size: FavoriteTagSize.medium,
                      style: FavoriteTagStyle.filled,
                    ),
                    const SizedBox(height: 4),
                    const Text('Medium', style: TextStyle(fontSize: 12)),
                  ],
                ),
                Column(
                  children: [
                    AppFavoriteTag(
                      isFavorite: true,
                      onFavoriteChanged: (value) {},
                      size: FavoriteTagSize.large,
                      style: FavoriteTagStyle.filled,
                    ),
                    const SizedBox(height: 4),
                    const Text('Large', style: TextStyle(fontSize: 12)),
                  ],
                ),
              ],
            ),
            codeSnippet: '''
// Small size
AppFavoriteTag(
  isFavorite: isFavorite,
  onFavoriteChanged: (value) => setState(() => isFavorite = value),
  size: FavoriteTagSize.small,
)

// Medium size
AppFavoriteTag(
  isFavorite: isFavorite,
  onFavoriteChanged: (value) => setState(() => isFavorite = value),
  size: FavoriteTagSize.medium,
)

// Large size
AppFavoriteTag(
  isFavorite: isFavorite,
  onFavoriteChanged: (value) => setState(() => isFavorite = value),
  size: FavoriteTagSize.large,
)''',
          ),

          _buildSectionTitle(context, 'Animation'),
          _buildComponentCard(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppFavoriteTag(
                      isFavorite: _isFavoriteAnimated,
                      onFavoriteChanged: (value) => setState(() => _isFavoriteAnimated = value),
                      size: FavoriteTagSize.large,
                      style: FavoriteTagStyle.filled,
                      enableAnimation: true,
                    ),
                    const SizedBox(width: 16),
                    AppFavoriteTag(
                      isFavorite: !_isFavoriteAnimated,
                      onFavoriteChanged: (value) => setState(() => _isFavoriteAnimated = !value),
                      size: FavoriteTagSize.large,
                      style: FavoriteTagStyle.outlined,
                      enableAnimation: true,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Text('Animated transitions'),
              ],
            ),
            codeSnippet: '''
AppFavoriteTag(
  isFavorite: isFavorite,
  onFavoriteChanged: (value) => setState(() => isFavorite = value),
  enableAnimation: true, // Enables smooth transitions
)''',
          ),

          _buildSectionTitle(context, 'Custom Colors'),
          _buildComponentCard(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    AppFavoriteTag(
                      isFavorite: true,
                      onFavoriteChanged: (value) {},
                      size: FavoriteTagSize.medium,
                      style: FavoriteTagStyle.filled,
                      activeColor: Colors.red,
                      inactiveColor: Colors.red.withOpacity(0.4),
                    ),
                    const SizedBox(height: 4),
                    const Text('Red', style: TextStyle(fontSize: 12)),
                  ],
                ),
                Column(
                  children: [
                    AppFavoriteTag(
                      isFavorite: true,
                      onFavoriteChanged: (value) {},
                      size: FavoriteTagSize.medium,
                      style: FavoriteTagStyle.filled,
                      activeColor: Colors.blue,
                      inactiveColor: Colors.blue.withOpacity(0.4),
                    ),
                    const SizedBox(height: 4),
                    const Text('Blue', style: TextStyle(fontSize: 12)),
                  ],
                ),
                Column(
                  children: [
                    AppFavoriteTag(
                      isFavorite: true,
                      onFavoriteChanged: (value) {},
                      size: FavoriteTagSize.medium,
                      style: FavoriteTagStyle.filled,
                      activeColor: Colors.purple,
                      inactiveColor: Colors.purple.withOpacity(0.4),
                    ),
                    const SizedBox(height: 4),
                    const Text('Purple', style: TextStyle(fontSize: 12)),
                  ],
                ),
              ],
            ),
            codeSnippet: '''
AppFavoriteTag(
  isFavorite: isFavorite,
  onFavoriteChanged: (value) => setState(() => isFavorite = value),
  activeColor: Colors.red,      // Color when favorite is true
  inactiveColor: Colors.red[100], // Color when favorite is false
)''',
          ),

          _buildSectionTitle(context, 'Disabled State'),
          _buildComponentCard(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppFavoriteTag(
                  isFavorite: true,
                  onFavoriteChanged: (value) {},
                  size: FavoriteTagSize.medium,
                  style: FavoriteTagStyle.filled,
                  isEnabled: false,
                ),
                const SizedBox(width: 16),
                AppFavoriteTag(
                  isFavorite: false,
                  onFavoriteChanged: (value) {},
                  size: FavoriteTagSize.medium,
                  style: FavoriteTagStyle.outlined,
                  isEnabled: false,
                ),
              ],
            ),
            codeSnippet: '''
AppFavoriteTag(
  isFavorite: isFavorite,
  onFavoriteChanged: (value) => setState(() => isFavorite = value),
  isEnabled: false, // Disables interaction
)''',
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
                    'AppFavoriteTag Component Notes:',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '• Supports filled and outlined styles\n'
                    '• Three sizes: small, medium, large\n'
                    '• Optional smooth animations\n'
                    '• Customizable active/inactive colors\n'
                    '• Can be disabled\n'
                    '• Automatic state management',
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