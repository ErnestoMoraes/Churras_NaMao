// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:reserva_churas/app/core/exceptions/repository_exception.dart';
import 'package:reserva_churas/app/core/exceptions/unauthorized_exceptions.dart';
import 'package:reserva_churas/app/core/rest_client/custom_dio.dart';
import 'package:reserva_churas/app/models/auth_model.dart';

import './auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final CustomDio dio;
  AuthRepositoryImpl({
    required this.dio,
  });
  @override
  Future<AuthModel> login(String email, String password) async {
    try {
      final result = await dio.unauth().post(
        '/auth',
        data: {
          'email': email,
          'password': password,
        },
      );
      return AuthModel.fromMap(result.data);
    } on DioError catch (e, s) {
      if (e.response?.statusCode == 403) {
        log('Permissão negada', error: e, stackTrace: s);
        throw UnauthorizedExceptions();
      }
      log('Erro ao realizar Login', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao realizar Login');
    }
  }
}
