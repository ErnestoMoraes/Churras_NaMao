// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:reserva_churas/app/models/rent_model.dart';
import 'package:reserva_churas/app/pages/grill_detail/grill_detail_state.dart';

class GrillDetailController extends Cubit<GrillDetailState> {
  GrillDetailController() : super(GrillDetailState.initial());

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
        id: 3,
        userId: 1,
        productId: 1,
        dateRent: state.selectedDay,
      );
      final listRents = [...state.rents];
      listRents.add(rent);
      await Future.delayed(const Duration(seconds: 2));
      listRents.sort((a, b) => a.dateRent.compareTo(b.dateRent));
      emit(state.copyWith(status: GrillDetailStatus.loaded, rents: listRents));
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
