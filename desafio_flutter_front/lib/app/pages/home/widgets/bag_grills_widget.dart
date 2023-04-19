import 'package:flutter/material.dart';
import 'package:reserva_churas/app/core/ui/helpers/size_extensions.dart';
import 'package:reserva_churas/app/models/grill_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BagGrillsWidget extends StatefulWidget {
  final List<GrillModel> grills;
  const BagGrillsWidget({super.key, required this.grills});

  @override
  State<BagGrillsWidget> createState() => _BagGrillsWidgetState();
}

class _BagGrillsWidgetState extends State<BagGrillsWidget> {
  Future<void> _goDetail(BuildContext context) async {
    final navigator = Navigator.of(context);
    final sp = await SharedPreferences.getInstance();
    if (!sp.containsKey('accessToken')) {
      await navigator.pushNamed('/auth/login');
    }
    await navigator.pushNamed('/auth/reservations');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth,
      height: context.screenHeight * .10,
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
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
        onPressed: () => _goDetail(context),
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
