// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class RentModel {
  int id;
  int userId;
  int productId;
  String dateRent;

  RentModel({
    required this.id,
    required this.userId,
    required this.productId,
    required this.dateRent,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userId': userId,
      'productId': productId,
      'dateRent': dateRent,
    };
  }

  factory RentModel.fromMap(Map<String, dynamic> map) {
    return RentModel(
      id: map['id'] ?? 0,
      userId: map['userId'] ?? 0,
      productId: map['productId'] ?? 0,
      dateRent: map['dateRent'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory RentModel.fromJson(String source) =>
      RentModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

// {
//   "id": 0,
//   "user_id": 0,
//   "product_id": 0,
//   "dateRent": "2021-01-01"    
// }