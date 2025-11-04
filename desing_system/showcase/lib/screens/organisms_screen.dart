import 'package:flutter/material.dart';
import 'package:desing_system/desing_system.dart';
import '../routes.dart';

class OrganismsScreen extends StatelessWidget {
  const OrganismsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = ShowcaseRoutes.getComponentCategories();
    final organismsCategory = categories.firstWhere((cat) => cat.name == 'Organisms');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Organisms'),
        backgroundColor: AppColors.primary,
      ),
      backgroundColor: AppColors.backgroundColor,
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildSectionHeader(context, organismsCategory),
          const SizedBox(height: 24),
          ...organismsCategory.components.map((component) => 
            _buildComponentTile(context, component)
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, ComponentCategory category) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.green.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.green.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(category.icon, color: Colors.green.shade700, size: 32),
              const SizedBox(width: 12),
              Text(
                category.name,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green.shade700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            category.description,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 8),
          Text(
            '${category.components.length} components available',
            style: TextStyle(
              fontSize: 14,
              color: Colors.green.shade700,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildComponentTile(BuildContext context, ComponentItem component) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12.0),
      child: ListTile(
        leading: Icon(component.icon, color: AppColors.primary, size: 32),
        title: Text(
          component.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(component.description),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () => Navigator.pushNamed(context, component.route),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}