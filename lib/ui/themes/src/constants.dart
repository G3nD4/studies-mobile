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

// paddings
const paddingTiny = EdgeInsets.all(4.0);
const paddingSmall = EdgeInsets.all(8.0);
const paddingMedium = EdgeInsets.all(16.0);
const paddingLarge = EdgeInsets.all(32.0);

// padding values
const double paddingValueTiny = 4.0;
const double paddingValueSmall = 8.0;
const double paddingValueMedium = 16.0;
const double paddingValueLarge = 32.0;

// vertical padding widgets
const paddingVerticalTiny = SizedBox(height: 4.0);
const paddingVerticalSmall = SizedBox(height: 8.0);
const paddingVerticalMedium = SizedBox(height: 16.0);
const paddingVerticalLarge = SizedBox(height: 32.0);

// horizontal padding widgets
const paddingHorizontalTiny = SizedBox(width: 4.0);
const paddingHorizontalSmall = SizedBox(width: 8.0);
const paddingHorizontalMedium = SizedBox(width: 16.0);
const paddingHorizontalLarge = SizedBox(width: 32.0);