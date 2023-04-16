import 'dart:convert';
import 'package:reserva_churas/app/models/rent_model.dart';

class GrillModel {
  final int id;
  final String title;
  final String description;
  final String photo;
  final List<RentModel> rents;

  GrillModel({
    required this.id,
    required this.title,
    required this.description,
    required this.photo,
    required this.rents,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'photo': photo,
      'rents': rents.map((rent) => rent.toMap()).toList()
    };
  }

  factory GrillModel.fromMap(Map<String, dynamic> map) {
    return GrillModel(
      id: map['id'] ?? 0,
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      photo: map['photo'] ?? '',
      rents: map['rents']
              ?.map<RentModel>((rent) => RentModel.fromMap(rent))
              ?.toList() ??
          <RentModel>[],
    );
  }

  String toJson() => json.encode(toMap());

  factory GrillModel.fromJson(String source) =>
      GrillModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

//* Modelo!!!
//* {
//*     "id": 0,
//*     "title": "Churrasqueira",
//*     "description": "Churrasqueira a gás",
//*     "photo": "https://montcalefatores.com.br/wp-content/uploads/2022/03/foto-1-calefator-3-1.jpg",
//*     "rents": [
//*         {
//*             "id": 0,
//*             "user_id": 0,
//*             "product_id": 0,
//*             "dateRent": "2021-01-01"
//*         }
//*     ]
//* }