import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reserva_churas/app/core/ui/base_state/base_state.dart';
import 'package:reserva_churas/app/core/ui/helpers/size_extensions.dart';
import 'package:reserva_churas/app/core/ui/styles/colors_app.dart';
import 'package:reserva_churas/app/core/ui/styles/text_styles.dart';
import 'package:reserva_churas/app/core/ui/widgets/my_button.dart';
import 'package:reserva_churas/app/pages/auth/login/login_controller.dart';
import 'package:reserva_churas/app/pages/auth/login/login_state.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends BaseState<LoginPage, LoginController> {
  final formKey = GlobalKey<FormState>();
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();
  bool _obscuredText = true;

  @override
  void dispose() {
    emailEC.dispose();
    passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginController, LoginState>(
      listener: (context, state) {
        state.status.matchAny(
          any: () => hideLoader(),
          login: () => showLoader(),
          loginError: () {
            hideLoader();
            showError('Login ou senha inválidos');
          },
          error: () {
            hideLoader();
            showError('Login ou senha inválidos');
          },
          success: () {
            hideLoader();
            Navigator.pop(context, true);
          },
        );
      },
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(context.screenHeight * .02),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      SizedBox(height: context.percentWidth(.4)),
                      Image.asset(
                        'assets/images/logo.png',
                        height: context.percentWidth(.2),
                      ),
                      SizedBox(height: context.percentWidth(.1)),
                      TextFormField(
                        controller: emailEC,
                        validator: Validatorless.multiple([
                          Validatorless.required('Campo email é obrigatório'),
                          Validatorless.email('Email inválido'),
                        ]),
                        decoration: InputDecoration(
                          hintText: 'email',
                          hintStyle: TextStyle(
                            color: context.colorsApp.background,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                          labelStyle: TextStyle(
                            color: context.colorsApp.background,
                            fontSize: 16,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: context.percentWidth(.05)),
                      TextFormField(
                        controller: passwordEC,
                        validator: Validatorless.multiple([
                          Validatorless.required('Campo senha é obrigatório'),
                        ]),
                        obscureText: _obscuredText,
                        style: TextStyles.instance.textInputLabel,
                        decoration: InputDecoration(
                          hintText: 'senha',
                          hintStyle: TextStyle(
                            color: context.colorsApp.background,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _obscuredText = !_obscuredText;
                              });
                            },
                            icon: Icon(
                              _obscuredText
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: context.colorsApp.background,
                              size: 25,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: context.percentWidth(.05)),
                      Center(
                        child: MyButton(
                          width: double.infinity,
                          color: context.colorsApp.primary,
                          label: 'Login',
                          onPressed: () {
                            final valid =
                                formKey.currentState?.validate() ?? false;
                            if (valid) {
                              controller.login(
                                emailEC.text.trim(),
                                passwordEC.text.trim(),
                              );
                            }
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () => showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text("Aviso do Desenvolvedor"),
                              content: SizedBox(
                                height: context.percentHeight(.5),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                        'Este aplicativo foi desenvolvido para apresentação de um teste de seleção para Dev Flutter Jr, portanto, não é um aplicativo real.'),
                                    SizedBox(
                                        height: context.screenHeight * .02),
                                    const Text(
                                        'O aplicativo foi desenvolvido utilizando o framework Flutter, com o objetivo de simular um aplicativo de reserva de churrasqueiras.'),
                                    SizedBox(
                                        height: context.screenHeight * .02),
                                    const Text(
                                        'Para acessar o aplicativo, utilize:'),
                                    SizedBox(
                                        height: context.screenHeight * .02),
                                    const Text(
                                        'Email: \nusuario_teste@gmail.com'),
                                    SizedBox(
                                        height: context.screenHeight * .02),
                                    const Text('Senha: \nusuario_teste'),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                        child: const Text(
                          'Para mais informações, clique aqui.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
