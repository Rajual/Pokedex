import 'package:flutter/material.dart';
import 'package:desing_system/desing_system.dart';
import 'components/card_detail_screen.dart';
import 'components/type_tag_detail_screen.dart';
import 'components/search_bar_detail_screen.dart';

class MoleculesScreen extends StatelessWidget {
  const MoleculesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildSectionTitle(context, 'Molecules'),
          const Text(
            'Molecules are combinations of atoms that form more complex UI components. Click on any component to see detailed examples and usage.',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 24),

          _buildComponentTile(
            context,
            'App Card',
            'Pokemon card component with image, types, and favorite functionality',
            Icons.credit_card,
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CardDetailScreen()),
            ),
          ),

          _buildComponentTile(
            context,
            'App Type Tag',
            'Pokemon type tags with automatic color coding and sizing',
            Icons.label,
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TypeTagDetailScreen()),
            ),
          ),

          _buildComponentTile(
            context,
            'Custom Search Bar',
            'Search input component with customizable icons and real-time filtering',
            Icons.search,
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SearchBarDetailScreen()),
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