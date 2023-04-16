import 'package:flutter/material.dart';
import 'package:reserva_churas/app/core/ui/styles/colors_app.dart';

class TextStyles {
  static TextStyles? _instance;

  TextStyles._();

  static TextStyles get instance {
    _instance ??= TextStyles._();
    return _instance!;
  }

  TextStyle get h1 => const TextStyle(fontSize: 20);
  TextStyle get h2 => const TextStyle(fontSize: 20);
  TextStyle get h3 => TextStyle(
        color: ColorsApp.instance.primary,
        fontSize: 12,
        fontWeight: FontWeight.bold,
      );
  TextStyle get textButtonLabel => const TextStyle(fontSize: 20);
  TextStyle get textInputLabel => const TextStyle(fontSize: 16);
}

extension TextStylesExtension on BuildContext {
  TextStyles get textStyles => TextStyles.instance;
}
