import 'package:flutter/material.dart';
import '../../atoms/app_button/app_button.dart';
import '../../atoms/app_button/utils/enum.dart';
import '../../atoms/app_image/app_image.dart';
import '../../atoms/dot_indicator/dot_indicator.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_dimensions.dart';
import 'onboarding_page_model.dart';
import 'models/onboarding_template_ui_model.dart';

/// Template para pantallas de onboarding con scroll horizontal
///
/// Características:
/// - PageView para navegación horizontal
/// - DotIndicator para mostrar progreso
/// - AppImage para las ilustraciones
/// - AppButton para navegación
/// - TextTheme nativo de Flutter para textos
///
/// Ejemplo de uso:
/// ```dart
/// OnboardingTemplate(
///   uiModel: OnboardingTemplateUiModel(
///     pages: [
///       OnboardingPageModel(
///         imagePath: 'assets/onboarding1.png',
///         title: 'Bienvenido',
///         description: 'Descripción...',
///       ),
///     ],
///   ),
///   onFinish: () => Navigator.pushReplacement(...),
/// )
/// ```
class OnboardingTemplate extends StatefulWidget {
  /// UI Model configuration
  final OnboardingTemplateUiModel uiModel;

  /// Callback cuando se completa el onboarding
  final VoidCallback onFinish;

  /// Callback opcional cuando se salta el onboarding
  final VoidCallback? onSkip;

  const OnboardingTemplate({
    super.key,
    required this.uiModel,
    required this.onFinish,
    this.onSkip,
  });

  /// Factory constructor for backward compatibility
  factory OnboardingTemplate.fromProperties({
    required List<OnboardingPageModel> pages,
    required VoidCallback onFinish,
    VoidCallback? onSkip,
    String continueButtonText = 'Continuar',
    String skipButtonText = 'Saltar',
    String finishButtonText = 'Empezamos',
    DotIndicatorSize indicatorSize = DotIndicatorSize.medium,
    DotIndicatorVariant indicatorVariant = DotIndicatorVariant.dots,
    bool showSkipButton = true,
    double horizontalPadding = 24.0,
    Key? key,
  }) {
    return OnboardingTemplate(
      uiModel: OnboardingTemplateUiModel(
        pages: pages,
        continueButtonText: continueButtonText,
        skipButtonText: skipButtonText,
        finishButtonText: finishButtonText,
        indicatorSize: indicatorSize.name,
        indicatorVariant: indicatorVariant.name,
        showSkipButton: showSkipButton,
        horizontalPadding: horizontalPadding,
      ),
      onFinish: onFinish,
      onSkip: onSkip,
      key: key,
    );
  }

  @override
  State<OnboardingTemplate> createState() => _OnboardingTemplateState();
}

class _OnboardingTemplateState extends State<OnboardingTemplate> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  void _nextPage() {
    if (_currentPage < widget.uiModel.pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      widget.onFinish();
    }
  }

  void _skipOnboarding() {
    if (widget.onSkip != null) {
      widget.onSkip!();
    } else {
      widget.onFinish();
    }
  }

  bool get _isLastPage => _currentPage == widget.uiModel.pages.length - 1;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: AppColors.gray100,
      body: SafeArea(
        child: Column(
          children: [
            // Header con botón de saltar
            if (widget.uiModel.showSkipButton && !_isLastPage)
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: widget.uiModel.horizontalPadding,
                  vertical: AppDimensions.md,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: _skipOnboarding,
                      child: Text(
                        widget.uiModel.skipButtonText,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: AppColors.gray500,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            else
              SizedBox(height: AppDimensions.md * 2 + 40),

            // PageView con las páginas
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: _onPageChanged,
                itemCount: widget.uiModel.pages.length,
                itemBuilder: (context, index) {
                  return _OnboardingPage(
                    page: widget.uiModel.pages[index],
                    horizontalPadding: widget.uiModel.horizontalPadding,
                  );
                },
              ),
            ),

            // DotIndicator
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: AppDimensions.lg,
              ),
              child: DotIndicator.fromProperties(
                count: widget.uiModel.pages.length,
                currentIndex: _currentPage,
                size: _getIndicatorSize(),
                variant: _getIndicatorVariant(),
                onTap: (index) {
                  _pageController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
              ),
            ),

            // Botón de navegación
            Padding(
              padding: EdgeInsets.fromLTRB(
                widget.uiModel.horizontalPadding,
                0,
                widget.uiModel.horizontalPadding,
                AppDimensions.lg,
              ),
              child: AppButton.fromProperties(
                label: _isLastPage
                    ? widget.uiModel.finishButtonText
                    : widget.uiModel.continueButtonText,
                onPressed: _nextPage,
                size: ButtonSize.large,
                type: ButtonType.primary,
                width: double.infinity,
              ),
            ),
          ],
        ),
      ),
    );
  }

  DotIndicatorSize _getIndicatorSize() {
    switch (widget.uiModel.indicatorSize) {
      case 'small':
        return DotIndicatorSize.small;
      case 'large':
        return DotIndicatorSize.large;
      case 'medium':
      default:
        return DotIndicatorSize.medium;
    }
  }

  DotIndicatorVariant _getIndicatorVariant() {
    switch (widget.uiModel.indicatorVariant) {
      case 'bars':
        return DotIndicatorVariant.bars;
      case 'dots':
      default:
        return DotIndicatorVariant.dots;
    }
  }
}

/// Widget interno para mostrar una página individual del onboarding
class _OnboardingPage extends StatelessWidget {
  final OnboardingPageModel page;
  final double horizontalPadding;

  const _OnboardingPage({
    required this.page,
    required this.horizontalPadding,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textColor = page.textColor ?? AppColors.gray900;

    return Container(
      color: page.backgroundColor,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Imagen
            AppImage.fromProperties(
              page.imagePath,
              size: AppImageSize.extraLarge,
              showErrorIcon: false,
            ),

            SizedBox(height: AppDimensions.xxxl),

            // Título
            Text(
              page.title,
              style: theme.textTheme.headlineMedium?.copyWith(
                color: textColor,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: AppDimensions.md),

            // Descripción
            Text(
              page.description,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: textColor.withOpacity(0.7),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
