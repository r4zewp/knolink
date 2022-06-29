import 'package:dio/dio.dart';

class Order {
  String customerId;
  String? tutorId;
  String subject;
  String comment;
  String? price;
  String status;
  String type;
  String created;
  String? closed;
  String id;

  Order({
    required this.customerId,
    required this.tutorId,
    required this.subject,
    required this.comment,
    required this.price,
    required this.status,
    required this.type,
    required this.created,
    required this.closed,
    required this.id,
  });

  factory Order.fromResponse(dynamic response) {
    return Order(
      customerId: response["customerId"],
      tutorId: response["tutorId"] ?? "null",
      subject: response["subject"],
      comment: response["description"] ?? "null",
      price: response["price"] ?? "null",
      status: response["status"],
      type: response["type"],
      created: response["created"],
      closed: response["closed"] ?? "null",
      id: response["id"],
    );
  }
}
