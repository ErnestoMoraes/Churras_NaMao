import 'package:flutter/material.dart';

class ColorsApp {
  static ColorsApp? _instance;

  ColorsApp._();

  static ColorsApp get instance {
    _instance ??= ColorsApp._();
    return _instance!;
  }

  Color get primary => const Color(0xFF0E21CB);
  Color get secondary => const Color(0xFF312F2F);
  Color get background => const Color(0xFF1E1E1E);
  Color get blue => const Color(0xFF39B7FE);
  Color get white => Colors.white;
}

extension ColorsAppExtension on BuildContext {
  ColorsApp get colorsApp => ColorsApp.instance;
}
