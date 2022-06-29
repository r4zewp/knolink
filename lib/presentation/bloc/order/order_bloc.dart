import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:knolink/datasources/repos/order_repository.dart';
import '../../../datasources/models/Order.dart';
import '../../../datasources/models/Tutor.dart';
import '../../../datasources/repos/storage_repository.dart';
part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final OrderRepository _repo = OrderRepository();
  final SecureStorage _storage = SecureStorage();
  OrderBloc() : super(OrderInitialState()) {
    on<ActiveOrdersInitialized>(
      (event, emit) async {
        final token = await _storage.readToken();
        if (event.type == "customer") {
          final activeOrders = await _repo.getOpenOrdersByCustomerId(token!);
          emit(ActiveOrdersListReady(activeOrders: activeOrders));
        } else if (event.type == "tutor") {
          final activeOrders = await _repo.getOpenOrdersByTutorId(token!);
          emit(ActiveOrdersListReady(activeOrders: activeOrders));
        }
      },
    );
    on<OrderMainInfoSaved>(
      (event, emit) {
        emit(OrderCreating(subject: event.subject, type: event.type));
      },
    );
    on<OrderCommentAdded>(
      (event, emit) async {
        final token = await _storage.readToken();
        final userPrefs = await _storage.readUserPrefs();

        _repo.createOrder(
            token!, userPrefs["uid"], event.subject, event.comment, event.type);
        emit(OrderCreated());
      },
    );
    on<HistoryOrdersInitialized>(
      (event, emit) async {
        final token = await _storage.readToken();
        if (event.type == "customer") {
          final closedOrders = await _repo.getClosedOrdersByCustomerId(token!);
          emit(ClosedOrdersListReady(closedOrders: closedOrders));
        } else if (event.type == "tutor") {
          final closedOrders = await _repo.getClosedOrdersByTutorId(token!);
          emit(ClosedOrdersListReady(closedOrders: closedOrders));
        }
      },
    );
    on<FindOrdersInitialized>(
      (event, emit) async {
        try {
          final token = await _storage.readToken();
          final allOrders = await _repo.getAllOrdersForTutor(token!);
          emit(FindOrdersAllOrdersReady(orders: allOrders));
        } catch (e) {
          throw Exception(e);
        }
      },
    );
    on<FollowOrderByTutor>(
      (event, emit) async {
        final token = await _storage.readToken();
        final response = await _repo.followOrder(
          event.oid,
          event.price,
          token!,
        );
      },
    );
    on<FindBySubjectInitialized>(
      (event, emit) async {
        try {
          final token = await _storage.readToken();
          final ordersBySubject =
              await _repo.getAllOrdersBySubject(token!, event.subject);
          emit(FindOrdersAllOrdersReady(orders: ordersBySubject));
        } catch (e) {
          emit(OrderError());
        }
      },
    );
    on<DetailedOrderForCustomerInitialized>(
      (event, emit) async {
        final token = await _storage.readToken();
        final tutorsForOrder = await _repo.getTutorsForOrder(token!, event.oid);
        emit(DetailedOrderForCustomer(tutors: tutorsForOrder));
      },
    );
  }
}
