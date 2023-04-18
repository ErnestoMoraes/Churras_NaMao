// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:equatable/equatable.dart';
import 'package:match/match.dart';

import 'package:reserva_churas/app/models/rent_model.dart';

part 'grill_detail_state.g.dart';

@match
enum GrillDetailStatus {
  initial,
  loading,
  loaded,
  error,
}

class GrillDetailState extends Equatable {
  final GrillDetailStatus status;
  final List<RentModel> rents;
  final String? errorMessage;
  int grillId;
  String selectedDay;

  GrillDetailState({
    required this.selectedDay,
    required this.status,
    required this.rents,
    required this.grillId,
    this.errorMessage,
  });

  GrillDetailState.initial()
      : status = GrillDetailStatus.initial,
        rents = const [],
        selectedDay = DateTime.now().toString(),
        grillId = 0,
        errorMessage = null;

  @override
  List<Object?> get props =>
      [status, rents, selectedDay, errorMessage, grillId];

  GrillDetailState copyWith({
    GrillDetailStatus? status,
    List<RentModel>? rents,
    String? errorMessage,
    int? grillId,
    String? selectedDay,
  }) {
    return GrillDetailState(
      status: status ?? this.status,
      rents: rents ?? this.rents,
      errorMessage: errorMessage ?? this.errorMessage,
      grillId: grillId ?? this.grillId,
      selectedDay: selectedDay ?? this.selectedDay,
    );
  }
}
