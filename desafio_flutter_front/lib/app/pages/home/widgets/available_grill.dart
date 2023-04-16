import 'package:flutter/material.dart';
import 'package:reserva_churas/app/core/ui/helpers/size_extensions.dart';
import 'package:reserva_churas/app/core/ui/styles/colors_app.dart';
import 'package:reserva_churas/app/core/ui/styles/text_styles.dart';

class AvailableGrill extends StatelessWidget {
  const AvailableGrill({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth * 0.5,
      padding: EdgeInsets.all(context.percentHeight(.005)),
      margin: EdgeInsets.only(
          left: context.screenHeight * 0.015,
          bottom: context.screenHeight * 0.007),
      decoration: BoxDecoration(
        color: context.colorsApp.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.info_outline,
            color: context.colorsApp.primary,
            size: 20,
          ),
          SizedBox(
            width: context.screenWidth * 0.01,
          ),
          Text(
            'Já está reservada para hoje',
            style: context.textStyles.h3,
          ),
        ],
      ),
    );
  }
}
