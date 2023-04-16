// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:reserva_churas/app/core/exceptions/repository_exception.dart';
import 'package:reserva_churas/app/core/rest_client/custom_dio.dart';
import 'package:reserva_churas/app/models/grill_model.dart';

import './grills_repository.dart';

class GrillsRepositoryImpl implements GrillsRepository {
  final CustomDio dio;

  GrillsRepositoryImpl({
    required this.dio,
  });

  @override
  Future<List<GrillModel>> findAllGrills() async {
    try {
      final result = await dio.unauth().get('/products');
      return result.data
          .map<GrillModel>((grill) => GrillModel.fromMap(grill))
          .toList();
    } on DioError catch (e, s) {
      log('Erro ao buscar churrasqueiras', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao buscar churrasqueiras');
    }
  }
}
