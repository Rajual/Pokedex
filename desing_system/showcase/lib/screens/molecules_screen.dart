import 'package:desing_system/desing_system.dart';
import 'package:desing_system/molecules/skeleton/skeleton.dart';
import 'package:flutter/material.dart';

class MoleculesScreen extends StatelessWidget {
  const MoleculesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Molecules'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Skeleton Section
          const Text(
            'Skeleton Molecule',
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
                label: 'View Templates',
                onPressed: () {
                  Navigator.pushNamed(context, '/templates');
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