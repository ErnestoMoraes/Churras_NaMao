import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reserva_churas/app/pages/grill_detail/grill_detail_page.dart';

class GrillDetailRouter {
  GrillDetailRouter._();
  static Widget get page => MultiProvider(
        providers: [
          Provider(
            create: (context) => Object(),
          ),
        ],
        child: const GrillDetailPage(),
      );
}
