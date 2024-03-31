part of '../theme.dart';


extension BuildContextExtension on BuildContext {
  ThemeTextStyles get text => Theme.of(this).extension<ThemeTextStyles>()!;
  ThemeColors get color => Theme.of(this).extension<ThemeColors>()!;
  ThemeGradients get gradient => Theme.of(this).extension<ThemeGradients>()!;

  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
}
