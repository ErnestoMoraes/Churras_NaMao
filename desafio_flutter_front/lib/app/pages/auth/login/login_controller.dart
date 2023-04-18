import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:reserva_churas/app/core/exceptions/unauthorized_exceptions.dart';
import 'package:reserva_churas/app/pages/auth/login/login_state.dart';
import 'package:reserva_churas/app/repositories/auth/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends Cubit<LoginState> {
  final AuthRepository _authRepository;
  LoginController(this._authRepository) : super(const LoginState.initial());

  Future<void> login(String email, String password) async {
    emit(state.copyWith(status: LoginStatus.login));
    try {
      await Future.delayed(const Duration(seconds: 2));
      final authModel = await _authRepository.login(email, password);
      final sp = await SharedPreferences.getInstance();
      print(authModel);
      sp.setString('accessToken', authModel.accessToken);
      sp.setString('refreshToken', authModel.accessToken);
      emit(state.copyWith(status: LoginStatus.success));
    } on UnauthorizedExceptions catch (e, s) {
      log('Login ou Sennha inválidos', error: e, stackTrace: s);
      emit(state.copyWith(
        status: LoginStatus.loginError,
        errorMessage: 'Login ou Sennha inválidos',
      ));
    } catch (e, s) {
      log('Erro ao fazer login', error: e, stackTrace: s);
      emit(state.copyWith(
        status: LoginStatus.error,
        errorMessage: 'Erro ao fazer login',
      ));
    }
  }
}
