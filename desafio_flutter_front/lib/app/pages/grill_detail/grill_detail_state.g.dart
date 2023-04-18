// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grill_detail_state.dart';

// **************************************************************************
// MatchExtensionGenerator
// **************************************************************************

extension GrillDetailStatusMatch on GrillDetailStatus {
  T match<T>(
      {required T Function() initial,
      required T Function() loading,
      required T Function() loaded,
      required T Function() error}) {
    final v = this;
    if (v == GrillDetailStatus.initial) {
      return initial();
    }

    if (v == GrillDetailStatus.loading) {
      return loading();
    }

    if (v == GrillDetailStatus.loaded) {
      return loaded();
    }

    if (v == GrillDetailStatus.error) {
      return error();
    }

    throw Exception(
        'GrillDetailStatus.match failed, found no match for: $this');
  }

  T matchAny<T>(
      {required T Function() any,
      T Function()? initial,
      T Function()? loading,
      T Function()? loaded,
      T Function()? error}) {
    final v = this;
    if (v == GrillDetailStatus.initial && initial != null) {
      return initial();
    }

    if (v == GrillDetailStatus.loading && loading != null) {
      return loading();
    }

    if (v == GrillDetailStatus.loaded && loaded != null) {
      return loaded();
    }

    if (v == GrillDetailStatus.error && error != null) {
      return error();
    }

    return any();
  }
}
