import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:reserva_churas/app/pages/home/home_state.dart';
import 'package:reserva_churas/app/repositories/grills/grills_repository.dart';

class HomeController extends Cubit<HomeState> {
  final GrillsRepository _grillsRepository;

  HomeController(this._grillsRepository)
      : super(
          HomeState.initial(),
        );

  Future<void> loadGrills() async {
    emit(state.copyWith(status: HomeStatus.loading));
    try {
      await Future.delayed(const Duration(seconds: 2));
      final grills = await _grillsRepository.findAllGrills();
      emit(state.copyWith(status: HomeStatus.loaded, grills: grills));
    } catch (e, s) {
      log('Erro ao buscar produtos', error: e, stackTrace: s);
      emit(state.copyWith(
          status: HomeStatus.error, errorMessage: 'Erro ao buscar produtos'));
    }
  }
}
