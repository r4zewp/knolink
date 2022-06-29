part of 'order_bloc.dart';

abstract class OrderEvent {}

class ActiveOrdersInitialized extends OrderEvent {
  String type;
  ActiveOrdersInitialized({required this.type});
}

class OrderMainInfoSaved extends OrderEvent {
  String subject;
  String type;
  OrderMainInfoSaved({required this.subject, required this.type});
}

class OrderCommentAdded extends OrderEvent {
  String subject;
  String type;
  String comment;
  OrderCommentAdded(
      {required this.subject, required this.type, required this.comment});
}

class HistoryOrdersInitialized extends OrderEvent {
  String type;
  HistoryOrdersInitialized({required this.type});
}

class FindOrdersInitialized extends OrderEvent {}

class FollowOrderByTutor extends OrderEvent {
  String oid;
  String price;
  FollowOrderByTutor({required this.oid, required this.price});
}

class FindBySubjectInitialized extends OrderEvent {
  String subject;
  FindBySubjectInitialized({required this.subject});
}

class DetailedOrderForCustomerInitialized extends OrderEvent {
  String oid;
  DetailedOrderForCustomerInitialized({required this.oid});
}
