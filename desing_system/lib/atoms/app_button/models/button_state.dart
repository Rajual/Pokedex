/// Modelo que representa el estado de un botón
class ButtonState {
  final bool isEnabled;
  final bool isLoading;

  const ButtonState({
    required this.isEnabled,
    required this.isLoading,
  });

  /// Verifica si el botón puede ser presionado
  bool get canPress => isEnabled && !isLoading;

  /// Verifica si el botón está en estado deshabilitado
  bool get isDisabled => !isEnabled;

  /// Factory para un botón habilitado
  factory ButtonState.enabled() => const ButtonState(
        isEnabled: true,
        isLoading: false,
      );

  /// Factory para un botón deshabilitado
  factory ButtonState.disabled() => const ButtonState(
        isEnabled: false,
        isLoading: false,
      );

  /// Factory para un botón en estado loading
  factory ButtonState.loading() => const ButtonState(
        isEnabled: false,
        isLoading: true,
      );

  @override
  String toString() =>
      'ButtonState(isEnabled: $isEnabled, isLoading: $isLoading)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ButtonState &&
          runtimeType == other.runtimeType &&
          isEnabled == other.isEnabled &&
          isLoading == other.isLoading;

  @override
  int get hashCode => isEnabled.hashCode ^ isLoading.hashCode;
}
