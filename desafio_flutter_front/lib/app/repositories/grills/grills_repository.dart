import 'package:reserva_churas/app/models/grill_model.dart';
import 'package:reserva_churas/app/models/rent_model.dart';

abstract class GrillsRepository {
  Future<List<GrillModel>> findAllGrills();
  Future<List<GrillModel>> updateRent(RentModel body);
}
