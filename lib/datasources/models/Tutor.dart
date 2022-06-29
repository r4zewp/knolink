import 'package:dio/dio.dart';

class Tutor {
  String id;
  String phone;
  String name;
  String balance;
  String rating;
  String university;

  Tutor({
    required this.id,
    required this.phone,
    required this.name,
    required this.balance,
    required this.rating,
    required this.university,
  });

  factory Tutor.fromResponse(dynamic response) {
    return Tutor(
      id: response["id"],
      phone: response["telNum"],
      name: response["name"],
      balance: response["balance"].toString(),
      rating: response["rating"].toString(),
      university: response["university"],
    );
  }
}
