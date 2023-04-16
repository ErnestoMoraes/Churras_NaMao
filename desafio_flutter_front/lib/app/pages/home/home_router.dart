import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reserva_churas/app/pages/home/home_controller.dart';
import 'package:reserva_churas/app/pages/home/home_page.dart';
import 'package:reserva_churas/app/repositories/grills/grills_repository.dart';
import 'package:reserva_churas/app/repositories/grills/grills_repository_impl.dart';

class HomeRouter {
  HomeRouter._();
  static Widget get page => MultiProvider(
        providers: [
          Provider<GrillsRepository>(
            create: (context) => GrillsRepositoryImpl(dio: context.read()),
          ),
          Provider(
            create: (context) => HomeController(context.read()),
          ),
        ],
        child: const HomePage(),
      );
}
