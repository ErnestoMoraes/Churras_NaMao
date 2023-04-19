import 'package:flutter/material.dart';
import 'package:reserva_churas/app/core/ui/helpers/size_extensions.dart';
import 'package:reserva_churas/app/core/ui/styles/colors_app.dart';
import 'package:reserva_churas/app/core/ui/widgets/my_button.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColoredBox(
        color: context.colorsApp.background,
        child: Stack(
          children: [
            Center(
              child: Column(
                children: [
                  SizedBox(height: context.percentHeight(.3)),
                  Image.asset('assets/images/logo.png'),
                  SizedBox(height: context.percentHeight(.1)),
                  MyButton(
                    width: context.percentWidth(.6),
                    color: context.colorsApp.primary,
                    label: 'Entrar',
                    onPressed: () {
                      Future.delayed(const Duration(seconds: 2));
                      Navigator.popAndPushNamed(context, '/home');
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
