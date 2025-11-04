import 'package:flutter/material.dart';
import 'package:desing_system/desing_system.dart';

class DotIndicatorScreen extends StatefulWidget {
  const DotIndicatorScreen({super.key});

  @override
  State<DotIndicatorScreen> createState() => _DotIndicatorScreenState();
}

class _DotIndicatorScreenState extends State<DotIndicatorScreen> {
  int _dotsCurrentIndex = 0;
  int _barsCurrentIndex = 1;
  int _customCurrentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gray100,
      appBar: AppBar(
        title: const Text('DotIndicator Showcase'),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
              title: 'Variant: Dots',
              child: Column(
                children: [
                  _buildShowcaseCard(
                    label: 'Small Dots',
                    child: DotIndicator(
                      count: 5,
                      currentIndex: _dotsCurrentIndex,
                      size: DotIndicatorSize.small,
                      variant: DotIndicatorVariant.dots,
                      onTap: (index) {
                        setState(() {
                          _dotsCurrentIndex = index;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildShowcaseCard(
                    label: 'Medium Dots (Default)',
                    child: DotIndicator(
                      count: 5,
                      currentIndex: _dotsCurrentIndex,
                      size: DotIndicatorSize.medium,
                      variant: DotIndicatorVariant.dots,
                      onTap: (index) {
                        setState(() {
                          _dotsCurrentIndex = index;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildShowcaseCard(
                    label: 'Large Dots',
                    child: DotIndicator(
                      count: 5,
                      currentIndex: _dotsCurrentIndex,
                      size: DotIndicatorSize.large,
                      variant: DotIndicatorVariant.dots,
                      onTap: (index) {
                        setState(() {
                          _dotsCurrentIndex = index;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            _buildSection(
              title: 'Variant: Bars',
              child: Column(
                children: [
                  _buildShowcaseCard(
                    label: 'Small Bars',
                    child: DotIndicator(
                      count: 4,
                      currentIndex: _barsCurrentIndex,
                      size: DotIndicatorSize.small,
                      variant: DotIndicatorVariant.bars,
                      onTap: (index) {
                        setState(() {
                          _barsCurrentIndex = index;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildShowcaseCard(
                    label: 'Medium Bars',
                    child: DotIndicator(
                      count: 4,
                      currentIndex: _barsCurrentIndex,
                      size: DotIndicatorSize.medium,
                      variant: DotIndicatorVariant.bars,
                      onTap: (index) {
                        setState(() {
                          _barsCurrentIndex = index;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildShowcaseCard(
                    label: 'Large Bars',
                    child: DotIndicator(
                      count: 4,
                      currentIndex: _barsCurrentIndex,
                      size: DotIndicatorSize.large,
                      variant: DotIndicatorVariant.bars,
                      onTap: (index) {
                        setState(() {
                          _barsCurrentIndex = index;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            _buildSection(
              title: 'Custom Colors',
              child: Column(
                children: [
                  _buildShowcaseCard(
                    label: 'Custom Active Color (Success)',
                    child: DotIndicator(
                      count: 3,
                      currentIndex: _customCurrentIndex,
                      activeColor: AppColors.success,
                      onTap: (index) {
                        setState(() {
                          _customCurrentIndex = index;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildShowcaseCard(
                    label: 'Custom Colors (Warning)',
                    child: DotIndicator(
                      count: 3,
                      currentIndex: _customCurrentIndex,
                      activeColor: AppColors.warning,
                      inactiveColor: AppColors.gray400,
                      onTap: (index) {
                        setState(() {
                          _customCurrentIndex = index;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildShowcaseCard(
                    label: 'Custom Colors (Error)',
                    child: DotIndicator(
                      count: 3,
                      currentIndex: _customCurrentIndex,
                      variant: DotIndicatorVariant.bars,
                      activeColor: AppColors.error,
                      inactiveColor: AppColors.gray200,
                      onTap: (index) {
                        setState(() {
                          _customCurrentIndex = index;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            _buildSection(
              title: 'Custom Spacing',
              child: Column(
                children: [
                  _buildShowcaseCard(
                    label: 'Tight Spacing (4px)',
                    child: DotIndicator(
                      count: 6,
                      currentIndex: 2,
                      spacing: 4.0,
                      onTap: (index) {},
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildShowcaseCard(
                    label: 'Wide Spacing (24px)',
                    child: DotIndicator(
                      count: 4,
                      currentIndex: 1,
                      spacing: 24.0,
                      onTap: (index) {},
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            _buildSection(
              title: 'Interactive Demo',
              child: _buildInteractiveDemo(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required Widget child,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.gray900,
              ),
        ),
        const SizedBox(height: 16),
        child,
      ],
    );
  }

  Widget _buildShowcaseCard({
    required String label,
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.gray600,
                  fontWeight: FontWeight.w500,
                ),
          ),
          const SizedBox(height: 16),
          child,
        ],
      ),
    );
  }

  Widget _buildInteractiveDemo() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            'Simulación de Carrusel',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.gray900,
                ),
          ),
          const SizedBox(height: 24),
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.image_outlined,
                    size: 64,
                    color: AppColors.primary.withOpacity(0.5),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Slide ${_dotsCurrentIndex + 1}',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          DotIndicator(
            count: 5,
            currentIndex: _dotsCurrentIndex,
            size: DotIndicatorSize.large,
            onTap: (index) {
              setState(() {
                _dotsCurrentIndex = index;
              });
            },
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: _dotsCurrentIndex > 0
                    ? () {
                        setState(() {
                          _dotsCurrentIndex--;
                        });
                      }
                    : null,
                icon: const Icon(Icons.arrow_back),
                label: const Text('Anterior'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: AppColors.white,
                ),
              ),
              const SizedBox(width: 16),
              ElevatedButton.icon(
                onPressed: _dotsCurrentIndex < 4
                    ? () {
                        setState(() {
                          _dotsCurrentIndex++;
                        });
                      }
                    : null,
                icon: const Icon(Icons.arrow_forward),
                label: const Text('Siguiente'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: AppColors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
