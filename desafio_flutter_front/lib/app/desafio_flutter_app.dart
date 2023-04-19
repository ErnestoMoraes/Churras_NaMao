import 'package:flutter/material.dart';
import 'package:reserva_churas/app/core/provider/application_binding.dart';
import 'package:reserva_churas/app/core/ui/theme/theme_config.dart';
import 'package:reserva_churas/app/pages/auth/login/login_router.dart';
import 'package:reserva_churas/app/pages/grill_detail/grill_detail_router.dart';
import 'package:reserva_churas/app/pages/home/home_router.dart';
import 'package:reserva_churas/app/pages/reservations/reservations_router.dart';
import 'package:reserva_churas/app/pages/splash/splash_page.dart';

class DesafioFlutterApp extends StatelessWidget {
  const DesafioFlutterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ApplicationBinding(
      child: MaterialApp(
        title: 'Desafio - Ernesto',
        theme: ThemeConfig.theme,
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashPage(),
          '/home': (context) => HomeRouter.page,
          '/grill_detail': (context) => GrillDetailRouter.page,
          '/auth/login': (context) => LoginRouter.page,
          '/auth/reservations': (context) => ReservationsRouter.page,
        },
      ),
    );
  }
}
