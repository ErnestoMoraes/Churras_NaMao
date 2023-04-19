import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:reserva_churas/app/pages/reservations/reservations_page.dart';

class ReservationsRouter {
  ReservationsRouter._();

  static Widget get page => MultiRepositoryProvider(
        providers: [
          Provider(
            create: (context) => Object(),
          ),
        ],
        child: const ReservationsPage(),
      );
}
