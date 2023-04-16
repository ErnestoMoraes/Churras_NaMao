import 'package:reserva_churas/app/models/grill_model.dart';

abstract class GrillsRepository {
  Future<List<GrillModel>> findAllGrills();
}
