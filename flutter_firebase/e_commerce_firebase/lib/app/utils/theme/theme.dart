import 'package:e_commerce_firebase/app/utils/theme/custom_themes/appbar_theme.dart';
import 'package:e_commerce_firebase/app/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:e_commerce_firebase/app/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:e_commerce_firebase/app/utils/theme/custom_themes/elevated_button_them.dart';
import 'package:e_commerce_firebase/app/utils/theme/custom_themes/outline_button_theme.dart';
import 'package:e_commerce_firebase/app/utils/theme/custom_themes/text_field_theme.dart';
import 'package:e_commerce_firebase/app/utils/theme/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';

class TAppThem {
  TAppThem._();

  /// Custome light theme
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TTextTheme.lightTextTheme,
    elevatedButtonTheme: TElevatedButtonThem.lightElevatedButtonThem,
    checkboxTheme: TCheckBoxTheme.lightCheckBoxTheme,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    outlinedButtonTheme: TOutlineButtonThem.lightOutlineButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
// colorScheme: ColorScheme.fromSeed(
//   seedColor: const Color(0xffbb86fc),
//   brightness: Brightness.dark,
// )
  );

  /// Custome dark theme
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    textTheme: TTextTheme.darkTextTheme,
    elevatedButtonTheme: TElevatedButtonThem.darkElevatedButtonThem,
    checkboxTheme: TCheckBoxTheme.darkCheckBoxTheme,
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
    outlinedButtonTheme: TOutlineButtonThem.darkOutlineButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
  
  );
}
