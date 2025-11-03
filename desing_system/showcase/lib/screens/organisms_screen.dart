import 'package:flutter/material.dart';
import 'package:desing_system/desing_system.dart';
import 'components/pokemon_list_detail_screen.dart';

class OrganismsScreen extends StatelessWidget {
  const OrganismsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildSectionTitle(context, 'Organisms'),
          const Text(
            'Organisms are complex components that combine multiple molecules and atoms. Click on any component to see detailed examples and usage.',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 24),

          _buildComponentTile(
            context,
            'Pokemon List View',
            'Complete list view combining search bar and pokemon cards with filtering',
            Icons.view_list,
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PokemonListDetailScreen()),
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