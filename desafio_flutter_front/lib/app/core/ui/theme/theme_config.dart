import 'package:flutter/material.dart';
import 'package:reserva_churas/app/core/ui/styles/app_styles.dart';
import 'package:reserva_churas/app/core/ui/styles/colors_app.dart';
import 'package:reserva_churas/app/core/ui/styles/text_styles.dart';

class ThemeConfig {
  ThemeConfig._();

  static final _defaultBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: BorderSide(color: Colors.grey[400]!),
  );

  static final theme = ThemeData(
    scaffoldBackgroundColor: ColorsApp.instance.background,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorsApp.instance.background,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: ColorsApp.instance.white,
      ),
    ),
    primaryColor: ColorsApp.instance.primary,
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorsApp.instance.primary,
      primary: ColorsApp.instance.primary,
      secondary: ColorsApp.instance.secondary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: AppStyles.instance.buttonStyle,
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: ColorsApp.instance.white,
      filled: true,
      isDense: true,
      contentPadding: const EdgeInsets.all(13),
      border: _defaultBorder,
      enabledBorder: _defaultBorder,
      focusedBorder: _defaultBorder,
      labelStyle:
          TextStyles.instance.textInputLabel.copyWith(color: Colors.white),
      errorStyle:
          TextStyles.instance.textInputLabel.copyWith(color: Colors.redAccent),
    ),
  );
}
