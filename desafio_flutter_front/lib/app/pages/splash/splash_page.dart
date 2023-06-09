import 'package:flutter/material.dart';
import 'package:reserva_churas/app/core/ui/helpers/loader.dart';
import 'package:reserva_churas/app/core/ui/helpers/messages.dart';
import 'package:reserva_churas/app/core/ui/helpers/size_extensions.dart';
import 'package:reserva_churas/app/core/ui/styles/colors_app.dart';
import 'package:reserva_churas/app/core/ui/widgets/my_button.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with Messages, Loader {
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
                    onPressed: () async {
                      var navigator = Navigator.of(context);
                      showLoader();
                      await Future.delayed(const Duration(milliseconds: 500));
                      hideLoader();
                      navigator.popAndPushNamed('/home');
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
