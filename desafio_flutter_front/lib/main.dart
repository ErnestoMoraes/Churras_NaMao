import 'package:flutter/material.dart';
import 'package:reserva_churas/app/core/config/env/env.dart';
import 'package:reserva_churas/app/desafio_flutter_app.dart';

Future<void> main() async {
  await Env.instance.load();
  runApp(const DesafioFlutterApp());
}
