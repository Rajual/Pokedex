import 'package:desing_system/desing_system.dart';
import 'package:desing_system/molecules/skeleton/skeleton.dart';
import 'package:flutter/material.dart';
import '../routes.dart';

class MoleculesScreen extends StatelessWidget {
  const MoleculesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = ShowcaseRoutes.getComponentCategories();
    final moleculesCategory = categories.firstWhere((cat) => cat.name == 'Molecules');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Molecules'),
        backgroundColor: AppColors.primary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildSectionHeader(context, moleculesCategory),
          const SizedBox(height: 24),

          // Components list
          ...moleculesCategory.components.map((component) => 
            _buildComponentTile(context, component)
          ),

          const SizedBox(height: 24),
          const Divider(),
          const SizedBox(height: 16),

          // Skeleton Section
          const Text(
            'Skeleton Components (Utility)',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),

          // Basic Skeletons
          const Text(
            'Basic Skeletons',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.gray200),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    const Text('Rectangle', style: TextStyle(fontSize: 12)),
                    const SizedBox(height: 4),
                    Skeleton(width: 80, height: 20),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.gray200),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    const Text('Circle', style: TextStyle(fontSize: 12)),
                    const SizedBox(height: 4),
                    SkeletonAvatar(size: 40),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Text Skeletons
          const Text(
            'Text Skeletons',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.gray200),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Single Line', style: TextStyle(fontSize: 12)),
                const SizedBox(height: 4),
                Skeleton(width: 200, height: 16),
                const SizedBox(height: 12),
                const Text('Multiple Lines', style: TextStyle(fontSize: 12)),
                const SizedBox(height: 4),
                SkeletonText(width: 250, lines: 3),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Card Skeleton
          const Text(
            'Card Skeleton',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.gray200),
              borderRadius: BorderRadius.circular(8),
            ),
            child: SkeletonCard(),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, ComponentCategory category) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.purple.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.purple.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(category.icon, color: Colors.purple.shade700, size: 32),
              const SizedBox(width: 12),
              Text(
                category.name,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple.shade700,
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
              color: Colors.purple.shade700,
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