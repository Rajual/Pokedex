import 'package:flutter/material.dart';
import 'package:desing_system/desing_system.dart';
import '../main.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _navigateToScreen(BuildContext context, int index) {
    // Navigate using named routes
    String routeName;
    switch (index) {
      case 1:
        routeName = '/atoms';
        break;
      case 2:
        routeName = '/molecules';
        break;
      case 3:
        routeName = '/organisms';
        break;
      case 4:
        routeName = '/templates';
        break;
      default:
        routeName = '/';
    }
    Navigator.of(context).pushNamed(routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              'Design System Showcase',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
            ),
            const SizedBox(height: 16),
            Text(
              'Explore and interact with all the components in our design system. Use the navigation drawer to browse different categories.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 32),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildCategoryCard(
                    context,
                    'Atoms',
                    'Basic building blocks',
                    Icons.widgets,
                    1, // Atoms screen index
                  ),
                  _buildCategoryCard(
                    context,
                    'Molecules',
                    'Combinations of atoms',
                    Icons.view_module,
                    2, // Molecules screen index
                  ),
                  _buildCategoryCard(
                    context,
                    'Organisms',
                    'Complex components',
                    Icons.dashboard,
                    3, // Organisms screen index
                  ),
                  _buildCategoryCard(
                    context,
                    'Templates',
                    'Full page layouts',
                    Icons.view_carousel,
                    4, // Templates screen index
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon,
    int targetIndex,
  ) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: () {
          _navigateToScreen(context, targetIndex);
        },
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 48,
                color: AppColors.primary,
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}