part of '../theme.dart';

const headlineLarge = TextStyle(
  fontWeight: FontWeight.w400,
  fontSize: 25,
  color: AppColors.grey,
);

const headlineMedium = TextStyle(
  fontWeight: FontWeight.w400,
  fontSize: 20,
  color: AppColors.grey,
);

const headlineSmall = TextStyle(
  fontWeight: FontWeight.w400,
  fontSize: 15,
  color: AppColors.grey,
);

abstract class AppColors {
  // from [Colors]
  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF000000);

  static const grey = Color(0xFF545864);
  static const lightGrey = Color(0xFFD9D9D9);
  static const mostLightwhite = Color(0xFFB3B5BB);
  static const purple = Color(0xFF8E2CC7);
  static const pink = Color(0xFFD96CF8);
}

abstract class AppGradients {
  static const containerBackgroundGradient = LinearGradient(
    colors: [
      AppColors.purple,
      AppColors.pink,
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
