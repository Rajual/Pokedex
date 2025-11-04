import 'package:flutter/material.dart';
import '../../atoms/app_button/app_button.dart';
import '../../atoms/app_button/utils/enum.dart';
import '../../atoms/app_image/app_image.dart';
import '../../atoms/dot_indicator/dot_indicator.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_dimensions.dart';
import 'onboarding_page_model.dart';

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
///   pages: [
///     OnboardingPageModel(
///       imagePath: 'assets/onboarding1.png',
///       title: 'Bienvenido',
///       description: 'Descripción...',
///     ),
///   ],
///   onFinish: () => Navigator.pushReplacement(...),
/// )
/// ```
class OnboardingTemplate extends StatefulWidget {
  /// Lista de páginas del onboarding
  final List<OnboardingPageModel> pages;

  /// Callback cuando se completa el onboarding
  final VoidCallback onFinish;

  /// Callback opcional cuando se salta el onboarding
  final VoidCallback? onSkip;

  /// Texto del botón de continuar (default: "Continuar")
  final String continueButtonText;

  /// Texto del botón de saltar (default: "Saltar")
  final String skipButtonText;

  /// Texto del botón final (default: "Empezar")
  final String finishButtonText;

  /// Tamaño del DotIndicator
  final DotIndicatorSize indicatorSize;

  /// Variante del DotIndicator
  final DotIndicatorVariant indicatorVariant;

  /// Si se muestra el botón de saltar
  final bool showSkipButton;

  /// Padding horizontal del contenido
  final double horizontalPadding;

  const OnboardingTemplate({
    super.key,
    required this.pages,
    required this.onFinish,
    this.onSkip,
    this.continueButtonText = 'Continuar',
    this.skipButtonText = 'Saltar',
    this.finishButtonText = 'Empezamos',
    this.indicatorSize = DotIndicatorSize.medium,
    this.indicatorVariant = DotIndicatorVariant.dots,
    this.showSkipButton = true,
    this.horizontalPadding = 24.0,
  }) : assert(pages.length > 0, 'pages debe tener al menos un elemento');

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
    if (_currentPage < widget.pages.length - 1) {
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

  bool get _isLastPage => _currentPage == widget.pages.length - 1;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: AppColors.gray100,
      body: SafeArea(
        child: Column(
          children: [
            // Header con botón de saltar
            if (widget.showSkipButton && !_isLastPage)
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: widget.horizontalPadding,
                  vertical: AppDimensions.md,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: _skipOnboarding,
                      child: Text(
                        widget.skipButtonText,
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
                itemCount: widget.pages.length,
                itemBuilder: (context, index) {
                  return _OnboardingPage(
                    page: widget.pages[index],
                    horizontalPadding: widget.horizontalPadding,
                  );
                },
              ),
            ),

            // DotIndicator
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: AppDimensions.lg,
              ),
              child: DotIndicator(
                count: widget.pages.length,
                currentIndex: _currentPage,
                size: widget.indicatorSize,
                variant: widget.indicatorVariant,
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
                widget.horizontalPadding,
                0,
                widget.horizontalPadding,
                AppDimensions.lg,
              ),
              child: AppButton(
                label: _isLastPage
                    ? widget.finishButtonText
                    : widget.continueButtonText,
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
            AppImage(
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
