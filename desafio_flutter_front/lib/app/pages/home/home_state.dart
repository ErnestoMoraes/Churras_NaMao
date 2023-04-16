// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:match/match.dart';

import 'package:reserva_churas/app/models/grill_model.dart';

part 'home_state.g.dart';

@match
enum HomeStatus {
  initial,
  loading,
  loaded,
  error,
}

class HomeState extends Equatable {
  final HomeStatus status;
  final List<GrillModel> grills;
  final String? errorMessage;

  const HomeState({
    required this.status,
    required this.grills,
    this.errorMessage,
  });

  const HomeState.initial()
      : status = HomeStatus.initial,
        grills = const [],
        errorMessage = null;

  @override
  List<Object?> get props => [status, grills, errorMessage];

  HomeState copyWith({
    HomeStatus? status,
    List<GrillModel>? grills,
    String? errorMessage,
  }) {
    return HomeState(
      status: status ?? this.status,
      grills: grills ?? this.grills,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
