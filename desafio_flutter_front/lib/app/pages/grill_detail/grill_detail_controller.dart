// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:reserva_churas/app/models/rent_model.dart';
import 'package:reserva_churas/app/pages/grill_detail/grill_detail_state.dart';
import 'package:reserva_churas/app/repositories/grills/grills_repository.dart';

class GrillDetailController extends Cubit<GrillDetailState> {
  final GrillsRepository dio;
  GrillDetailController(this.dio) : super(GrillDetailState.initial());

  Future<void> loadRents(List<RentModel> listRents) async {
    emit(state.copyWith(status: GrillDetailStatus.loading));
    try {
      await Future.delayed(const Duration(seconds: 2));
      emit(
        state.copyWith(
          status: GrillDetailStatus.loaded,
          rents: listRents,
        ),
      );
    } catch (e, s) {
      log('Erro ao buscar produtos', error: e, stackTrace: s);
      emit(state.copyWith(
          status: GrillDetailStatus.error,
          errorMessage: 'Erro ao buscar produtos'));
    }
  }

  Future<void> addRents() async {
    emit(state.copyWith(status: GrillDetailStatus.loading));
    try {
      final rent = RentModel(
        id: 0,
        userId: 0,
        productId: state.grillId,
        dateRent: state.selectedDay,
      );
      final listRents = state.rents;
      listRents.add(rent);
      await dio.updateRent(rent);
      await Future.delayed(const Duration(seconds: 2));
      emit(
        state.copyWith(
          status: GrillDetailStatus.loaded,
          rents: listRents,
        ),
      );
    } catch (e, s) {
      log('Erro ao buscar produtos', error: e, stackTrace: s);
      emit(
        state.copyWith(
            status: GrillDetailStatus.error,
            errorMessage: 'Erro ao buscar produtos'),
      );
    }
  }
}
