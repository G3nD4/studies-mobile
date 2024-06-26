part of '../theme.dart';

class ThemeColors extends ThemeExtension<ThemeColors> {
  final Color appContainerBackground;
  final Color appContainerShadow;
  final Color selectedLabel;
  final Color unselectedLabel;
  final Color coursorColor;
  final Color micIcon;
  final Color settingsDialogLanguage;

  const ThemeColors({
    required this.appContainerBackground,
    required this.appContainerShadow,
    required this.selectedLabel,
    required this.unselectedLabel,
    required this.coursorColor,
    required this.micIcon,
    required this.settingsDialogLanguage,
  });

  @override
  ThemeExtension<ThemeColors> copyWith({
    Color? appContainerBackground,
    Color? appContainerShadow,
    Color? selectedLabel,
    Color? unselectedLabel,
    Color? coursorColor,
    Color? micIcon,
    Color? settingsDialogLanguage,
  }) {
    return ThemeColors(
      appContainerBackground:
          appContainerBackground ?? this.appContainerBackground,
      appContainerShadow: appContainerShadow ?? this.appContainerShadow,
      selectedLabel: selectedLabel ?? this.selectedLabel,
      unselectedLabel: unselectedLabel ?? this.unselectedLabel,
      coursorColor: coursorColor ?? this.coursorColor,
      micIcon: micIcon ?? this.micIcon,
      settingsDialogLanguage:
          settingsDialogLanguage ?? this.settingsDialogLanguage,
    );
  }

  @override
  ThemeExtension<ThemeColors> lerp(
    ThemeExtension<ThemeColors>? other,
    double t,
  ) {
    if (other is! ThemeColors) {
      return this;
    }

    return ThemeColors(
      appContainerBackground: Color.lerp(
        appContainerBackground,
        other.appContainerBackground,
        t,
      )!,
      appContainerShadow: Color.lerp(
        appContainerShadow,
        other.appContainerShadow,
        t,
      )!,
      selectedLabel: Color.lerp(
        selectedLabel,
        other.selectedLabel,
        t,
      )!,
      unselectedLabel: Color.lerp(
        unselectedLabel,
        other.unselectedLabel,
        t,
      )!,
      coursorColor: Color.lerp(
        coursorColor,
        other.coursorColor,
        t,
      )!,
      micIcon: Color.lerp(
        micIcon,
        other.micIcon,
        t,
      )!,
      settingsDialogLanguage: Color.lerp(
        settingsDialogLanguage,
        other.settingsDialogLanguage,
        t,
      )!,
    );
  }

  static get light => const ThemeColors(
        appContainerBackground: AppColors.white,
        appContainerShadow: Colors.transparent,
        selectedLabel: AppColors.purple,
        unselectedLabel: AppColors.grey,
        coursorColor: Colors.transparent,
        micIcon: AppColors.lightGrey,
        settingsDialogLanguage: AppColors.white,
      );
  // add dark theme here if needed
}
