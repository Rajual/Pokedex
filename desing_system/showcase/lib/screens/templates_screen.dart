import 'package:desing_system/desing_system.dart';
import 'package:desing_system/templates/empty_state_template/models/empty_state_template_ui_model.dart';
import 'package:desing_system/templates/loading_template/loading_template.dart';
import 'package:desing_system/templates/loading_template/models/loading_template_ui_model.dart';
import 'package:flutter/material.dart';

class TemplatesScreen extends StatelessWidget {
  const TemplatesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Templates'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Loading Template Section
          const Text(
            'Loading Template',
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

          const SizedBox(height: 32),

          // Empty State Template Section
          const Text(
            'Empty State Template',
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

          const SizedBox(height: 32),

          // Navigation
          const Text(
            'Navigation',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              AppButton.fromProperties(
                label: 'View Molecules',
                onPressed: () {
                  Navigator.pushNamed(context, '/molecules');
                },
              ),
              AppButton.fromProperties(
                label: 'View Organisms',
                onPressed: () {
                  Navigator.pushNamed(context, '/organisms');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
