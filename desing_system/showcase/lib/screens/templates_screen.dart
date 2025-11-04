import 'package:desing_system/desing_system.dart';
import 'package:desing_system/templates/empty_state_template/models/empty_state_template_ui_model.dart';
import 'package:desing_system/templates/loading_template/loading_template.dart';
import 'package:desing_system/templates/loading_template/models/loading_template_ui_model.dart';
import 'package:flutter/material.dart';
import '../routes.dart';

class TemplatesScreen extends StatelessWidget {
  const TemplatesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = ShowcaseRoutes.getComponentCategories();
    final templatesCategory = categories.firstWhere((cat) => cat.name == 'Templates');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Templates'),
        backgroundColor: AppColors.primary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildSectionHeader(context, templatesCategory),
          const SizedBox(height: 24),
          ...templatesCategory.components.map((component) => 
            _buildComponentTile(context, component)
          ),
          const SizedBox(height: 24),
          const Divider(),
          const SizedBox(height: 16),

          // Loading Template Section
          const Text(
            'Loading Template (Utility)',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),

          // List Layout
          const Text(
            'List Layout',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
          Container(
            height: 300,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.gray200),
              borderRadius: BorderRadius.circular(8),
            ),
            child: LoadingTemplate(
              uiModel: LoadingTemplateUiModel(
                title: 'Loading Pokémon...',
                subtitle: 'Please wait while we fetch the data',
                layoutType: LoadingLayoutType.list,
                itemCount: 4,
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Cards Layout
          const Text(
            'Cards Layout',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
          Container(
            height: 400,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.gray200),
              borderRadius: BorderRadius.circular(8),
            ),
            child: LoadingTemplate(
              uiModel: LoadingTemplateUiModel(
                title: 'Loading Pokémon Cards',
                layoutType: LoadingLayoutType.cards,
                itemCount: 3,
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Grid Layout
          const Text(
            'Grid Layout',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
          Container(
            height: 350,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.gray200),
              borderRadius: BorderRadius.circular(8),
            ),
            child: LoadingTemplate(
              uiModel: LoadingTemplateUiModel(
                title: 'Loading Grid Items',
                layoutType: LoadingLayoutType.grid,
                itemCount: 6,
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Empty State Template Section
          const Text(
            'Empty State Template (Utility)',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Container(
            height: 300,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.gray200),
              borderRadius: BorderRadius.circular(8),
            ),
            child: EmptyStateTemplate(
              uiModel: EmptyStateTemplateUiModel(
                imagePath: 'assets/error_icon.png',
                title: 'No data available',
                description: 'There are no items to display at the moment.',
                actionLabel: 'Refresh',
                onAction: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, ComponentCategory category) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.orange.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.orange.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(category.icon, color: Colors.orange.shade700, size: 32),
              const SizedBox(width: 12),
              Text(
                category.name,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange.shade700,
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
              color: Colors.orange.shade700,
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