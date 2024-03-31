part of '../theme.dart';

ThemeData createLightTheme() {
  return ThemeData(
    fontFamily: 'Comfortaa',
    textTheme: createTextTheme(),
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.white,
    extensions: <ThemeExtension<dynamic>>[
      ThemeColors.light,
      ThemeTextStyles.light,
      ThemeGradients.light,
    ],
    dialogTheme: DialogTheme(
      backgroundColor: AppColors.white,
      titleTextStyle: headlineMedium,
      contentTextStyle: headlineSmall.copyWith(
        fontSize: 10.0,
      ),
    ),
    focusColor: AppColors.purple,
    appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
  );
}
