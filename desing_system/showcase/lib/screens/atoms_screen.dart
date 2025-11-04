import 'package:flutter/material.dart';
import 'package:desing_system/desing_system.dart';
import 'components/button_detail_screen.dart';
import 'components/image_detail_screen.dart';
import 'components/svg_detail_screen.dart';
import 'components/favorite_tag_detail_screen.dart';

class AtomsScreen extends StatelessWidget {
  const AtomsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildSectionTitle(context, 'Atoms'),
          const Text(
            'Atoms are the basic building blocks of our design system. Click on any component to see detailed examples and usage.',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 24),

          _buildComponentTile(
            context,
            'App Button',
            'Interactive buttons with multiple styles, sizes, and states',
            Icons.smart_button,
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ButtonDetailScreen()),
            ),
          ),

          _buildComponentTile(
            context,
            'App Image',
            'Network image component with different sizes and fit options',
            Icons.image,
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ImageDetailScreen()),
            ),
          ),

          _buildComponentTile(
            context,
            'App SVG',
            'SVG image component for scalable vector graphics',
            Icons.image_search,
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SvgDetailScreen()),
            ),
          ),

          _buildComponentTile(
            context,
            'App Favorite Tag',
            'Interactive favorite/star component with animations',
            Icons.star_border,
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const FavoriteTagDetailScreen()),
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
        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
      ),
    );
  }

  Widget _buildComponentTile(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon,
    VoidCallback onTap,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12.0),
      child: ListTile(
        leading: Icon(icon, color: AppColors.primary, size: 32),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}