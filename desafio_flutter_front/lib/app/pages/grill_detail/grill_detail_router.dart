import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reserva_churas/app/pages/grill_detail/grill_detail_controller.dart';
import 'package:reserva_churas/app/pages/grill_detail/grill_detail_page.dart';

class GrillDetailRouter {
  GrillDetailRouter._();
  static Widget get page => MultiProvider(
        providers: [
          Provider(
            create: (context) => GrillDetailController(),
          ),
        ],
        builder: (context, child) {
          final args = ModalRoute.of(context)!.settings.arguments
              as Map<String, dynamic>;
          return GrillDetailPage(
            grillModel: args['grill'],
          );
        },
      );
}
