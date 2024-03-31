part of '../theme.dart';

class ThemeGradients extends ThemeExtension<ThemeGradients> {
  final Gradient containerBackgroundGradient;

  const ThemeGradients({
    required this.containerBackgroundGradient,
  });

  @override
  ThemeExtension<ThemeGradients> copyWith({
    Gradient? containerBackgroundGradient,
  }) {
    return ThemeGradients(
      containerBackgroundGradient:
          containerBackgroundGradient ?? this.containerBackgroundGradient,
    );
  }

  @override
  ThemeExtension<ThemeGradients> lerp(
    ThemeExtension<ThemeGradients>? other,
    double t,
  ) {
    if (other is! ThemeGradients) {
      return this;
    }

    return ThemeGradients(
      containerBackgroundGradient: Gradient.lerp(
        containerBackgroundGradient,
        other.containerBackgroundGradient,
        t,
      )!,
    );
  }

  static get light => const ThemeGradients(
    containerBackgroundGradient: AppGradients.containerBackgroundGradient,
  );
  // add dark theme here if needed
}
