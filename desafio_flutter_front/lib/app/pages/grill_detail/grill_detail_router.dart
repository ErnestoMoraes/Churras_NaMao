import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reserva_churas/app/pages/grill_detail/grill_detail_controller.dart';
import 'package:reserva_churas/app/pages/grill_detail/grill_detail_page.dart';
import 'package:reserva_churas/app/pages/home/home_controller.dart';
import 'package:reserva_churas/app/repositories/grills/grills_repository.dart';
import 'package:reserva_churas/app/repositories/grills/grills_repository_impl.dart';

class GrillDetailRouter {
  GrillDetailRouter._();
  static Widget get page => MultiProvider(
        providers: [
          Provider<GrillsRepository>(
            create: (context) => GrillsRepositoryImpl(dio: context.read()),
          ),
          Provider(
            create: (context) => GrillDetailController(
              context.read(),
            ),
          ),
          Provider(
            create: (context) => HomeController(
              context.read(),
            ),
          )
        ],
        builder: (context, child) {
          final args = ModalRoute.of(context)!.settings.arguments
              as Map<String, dynamic>;
          return GrillDetailPage(
            grillModel: args['grill'],
            indexModel: args['index'],
          );
        },
      );
}
