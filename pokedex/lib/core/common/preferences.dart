import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Service for managing app preferences using SharedPreferences
class PreferencesService {
  static const String _onboardingCompletedKey = 'onboarding_completed';

  final SharedPreferences _prefs;

  PreferencesService(this._prefs);

  /// Check if onboarding has been completed
  bool get isOnboardingCompleted => _prefs.getBool(_onboardingCompletedKey) ?? false;

  /// Mark onboarding as completed
  Future<void> setOnboardingCompleted(bool completed) async {
    await _prefs.setBool(_onboardingCompletedKey, completed);
  }

  /// Clear all preferences (useful for testing or reset)
  Future<void> clear() async {
    await _prefs.clear();
  }
}

/// Provider for PreferencesService
final preferencesServiceProvider = FutureProvider<PreferencesService>((ref) async {
  final prefs = await SharedPreferences.getInstance();
  return PreferencesService(prefs);
}, name: 'preferencesServiceProvider');