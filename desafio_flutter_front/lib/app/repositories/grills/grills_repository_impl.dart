// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:reserva_churas/app/core/exceptions/repository_exception.dart';
import 'package:reserva_churas/app/core/rest_client/custom_dio.dart';
import 'package:reserva_churas/app/models/grill_model.dart';
import 'package:reserva_churas/app/models/rent_model.dart';

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

  @override
  Future<List<GrillModel>> updateRent(RentModel rent) async {
    try {
      final result = await dio.unauth().get('/products');
      final body = result.data
          .map<GrillModel>((grill) => GrillModel.fromMap(grill))
          .toList();
      final grill = body.firstWhere((grill) => grill.id == rent.productId);
      int number = rent.productId;
      print('number: $number');
      grill.rents.add(rent);
      await dio.unauth().put('/products/${grill.id}', data: grill.toMap());
      return body;
    } on DioError catch (e, s) {
      log('Erro ao buscar churrasqueiras', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao buscar churrasqueiras');
    }
  }
}
