import 'package:flutter/material.dart';
import 'package:reserva_churas/app/core/ui/styles/colors_app.dart';

class MyButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final Color? color;
  final double? width;
  final double? height;

  const MyButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.width,
    this.height = 50,
    this.color = const Color(0xFF0E21CB),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: color),
        onPressed: onPressed,
        child: Text(
          label,
          style: TextStyle(
            color: context.colorsApp.white,
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
      ),
    );
  }
}
