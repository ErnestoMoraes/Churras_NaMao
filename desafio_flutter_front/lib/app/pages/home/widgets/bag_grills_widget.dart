import 'package:flutter/material.dart';
import 'package:reserva_churas/app/core/ui/helpers/size_extensions.dart';
import 'package:reserva_churas/app/core/ui/styles/colors_app.dart';
import 'package:reserva_churas/app/models/grill_model.dart';

class BagGrillsWidget extends StatelessWidget {
  final List<GrillModel> grills;
  const BagGrillsWidget({super.key, required this.grills});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth,
      height: 90,
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: context.colorsApp.secondary,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.4),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () {},
        child: Stack(
          children: const [
            Align(
              alignment: Alignment.centerLeft,
              child: Icon(
                Icons.shopping_cart_outlined,
                size: 30,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Minhas Reservas',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
