part of 'order_bloc.dart';

abstract class OrderState {}

class OrderInitialState extends OrderState {}

class OrderCreating extends OrderState {
  String subject;
  String type;
  OrderCreating({required this.subject, required this.type});
}

class ActiveOrdersListReady extends OrderState {
  List<Order> activeOrders;
  ActiveOrdersListReady({required this.activeOrders});
}

class ClosedOrdersListReady extends OrderState {
  List<Order> closedOrders;
  ClosedOrdersListReady({required this.closedOrders});
}

class FindOrdersAllOrdersReady extends OrderState {
  List<Order> orders;
  FindOrdersAllOrdersReady({required this.orders});
}

class DetailedOrderForCustomer extends OrderState {
  List<Tutor> tutors;
  DetailedOrderForCustomer({required this.tutors});
}

class OrderCreated extends OrderState {}

class OrderError extends OrderState {}

class OrderLoading extends OrderState {}
