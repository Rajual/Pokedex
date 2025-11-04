import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Enhanced localization service that supports loading JSON data for all features
class MyAppLocalizations {
  final Locale locale;

  MyAppLocalizations(this.locale);

  // Helper method to keep the code in the widgets concise
  // Localizations are accessed using an InheritedWidget "of" syntax
  static MyAppLocalizations? of(BuildContext context) {
    return Localizations.of<MyAppLocalizations>(context, MyAppLocalizations);
  }

  // Static member to have a simple access to the delegate from the MaterialApp
  static const LocalizationsDelegate<MyAppLocalizations> delegate =
      MyAppLocalizationsDelegate();

  // Cache for loaded JSON data
  final Map<String, Map<String, dynamic>> _loadedData = {};

  Future<bool> load() async {
    try {
      // Load all feature-specific JSON files
      await _loadFeatureData('onboarding');
      // Add more features here as they are implemented
      // await _loadFeatureData('home');
      // await _loadFeatureData('settings');

      return true;
    } catch (e) {
      debugPrint('Error loading localizations: $e');
      return false;
    }
  }

  /// Load JSON data for a specific feature
  Future<void> _loadFeatureData(String featureName) async {
    try {
      final jsonString = await rootBundle.loadString(
        'assets/locals/${locale.languageCode}/$featureName.json',
      );
      final Map<String, dynamic> jsonMap = json.decode(jsonString);
      _loadedData[featureName] = jsonMap;
    } catch (e) {
      debugPrint('Error loading $featureName data: $e');
      // Provide fallback empty data
      _loadedData[featureName] = {};
    }
  }

  /// Get data for a specific feature
  Map<String, dynamic>? getFeatureData(String featureName) {
    return _loadedData[featureName];
  }

  /// Get specific value from feature data using dot notation
  /// Example: getFeatureValue('onboarding', 'pages.0.title')
  dynamic getFeatureValue(String featureName, String key) {
    final featureData = _loadedData[featureName];
    if (featureData == null) return null;

    // Support dot notation for nested access
    final keys = key.split('.');
    dynamic current = featureData;

    for (final k in keys) {
      if (current is Map<String, dynamic>) {
        current = current[k];
      } else if (current is List && int.tryParse(k) != null) {
        final index = int.parse(k);
        current = (current as List)[index];
      } else {
        return null;
      }
    }

    return current;
  }

  /// Legacy method for backward compatibility
  String? translate(String key) {
    // Try to find the key in any loaded feature data
    for (final featureData in _loadedData.values) {
      if (featureData.containsKey(key)) {
        final value = featureData[key];
        return value?.toString();
      }
    }
    return null;
  }

  /// Get onboarding data specifically
  Map<String, dynamic>? getOnboardingData() {
    return getFeatureData('onboarding');
  }

  /// Get onboarding pages
  List<Map<String, dynamic>>? getOnboardingPages() {
    final onboardingData = getOnboardingData();
    if (onboardingData == null) return null;

    final pages = onboardingData['pages'];
    if (pages is List) {
      return pages.cast<Map<String, dynamic>>();
    }
    return null;
  }

  /// Get onboarding button texts
  String getOnboardingContinueText() {
    return getFeatureValue('onboarding', 'continueButtonText') ?? 'Continue';
  }

  String getOnboardingSkipText() {
    return getFeatureValue('onboarding', 'skipButtonText') ?? 'Skip';
  }

  String getOnboardingFinishText() {
    return getFeatureValue('onboarding', 'finishButtonText') ?? 'Get Started';
  }
}

class MyAppLocalizationsDelegate
    extends LocalizationsDelegate<MyAppLocalizations> {
  // This delegate instance will never change (it doesn't even have fields!)
  // It can provide a constant constructor.
  const MyAppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    // Include all of your supported language codes here
    return ['en', 'es'].contains(locale.languageCode);
  }

  @override
  Future<MyAppLocalizations> load(Locale locale) async {
    // AppLocalizations class is where the JSON loading actually runs
    MyAppLocalizations localizations = MyAppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(MyAppLocalizationsDelegate old) => false;
}