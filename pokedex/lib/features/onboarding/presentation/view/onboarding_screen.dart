import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:desing_system/templates/onboarding_template/models/onboarding_template_ui_model.dart';
import 'package:desing_system/templates/onboarding_template/onboarding_page_model.dart';
import 'package:desing_system/templates/onboarding_template/onboarding_template.dart';

import '../../../../core/common/result.dart';
import '../../../../core/common/preferences.dart';
import '../../domain/entities/onboarding_data.dart';
import '../../domain/repositories/onboarding_repository.dart';
import '../presenter/onboarding_presenter.dart';

/// Screen for displaying the onboarding flow
class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  Result<OnboardingData, OnboardingFailure>? _result;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final presenter = ref.read(onboardingPresenterProvider);
    final result = await presenter.loadData();
    setState(() {
      _result = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_result == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return _result!.match(
      onSuccess: (data) => _buildOnboardingContent(data),
      onFailure: (error) => _buildErrorContent(error),
    );
  }

  Widget _buildOnboardingContent(OnboardingData data) {
    // Convert domain data to UI model for the template
    final uiModel = OnboardingTemplateUiModel(
      pages: data.pages.map((page) => OnboardingPageModel(
        imagePath: page.imagePath,
        title: page.title,
        description: page.description,
        backgroundColor: page.backgroundColor,
        textColor: page.textColor,
      )).toList(),
      continueButtonText: data.continueButtonText,
      skipButtonText: data.skipButtonText,
      finishButtonText: data.finishButtonText,
    );

    return OnboardingTemplate(
      uiModel: uiModel,
      onFinish: () async {
        // Mark onboarding as completed and navigate to main app
        final prefs = await ref.read(preferencesServiceProvider.future);
        await prefs.setOnboardingCompleted(true);
        if (context.mounted) {
          Navigator.of(context).pushReplacementNamed('/home-navigation');
        }
      },
      onSkip: () async {
        // Mark onboarding as completed and navigate to main app
        final prefs = await ref.read(preferencesServiceProvider.future);
        await prefs.setOnboardingCompleted(true);
        if (context.mounted) {
          Navigator.of(context).pushReplacementNamed('/home-navigation');
        }
      },
    );
  }

  Widget _buildErrorContent(OnboardingFailure error) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Error: ${error.toString()}'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _loadData,
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}