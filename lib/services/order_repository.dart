import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:higheswashios/models/index.dart';

// Order Repository
class OrderRepository {
  static final OrderRepository _instance = OrderRepository._internal();

  OrderRepository._internal();

  factory OrderRepository() {
    return _instance;
  }

  Future<Order> createOrder(
    String serviceId,
    OrderDetails details,
    List<String> itemPhotos,
  ) async {
    // TODO: Implement with API call
    throw UnimplementedError();
  }

  Future<Order> getOrderById(String orderId) async {
    // TODO: Implement with API call
    throw UnimplementedError();
  }

  Future<List<Order>> getUserOrders(String userId) async {
    // TODO: Implement with API call
    return [];
  }

  Future<void> updateOrderStatus(String orderId, String status) async {
    // TODO: Implement with API call
    throw UnimplementedError();
  }

  Future<List<Bid>> getOrderBids(String orderId) async {
    // TODO: Implement with API call
    return [];
  }

  Future<void> acceptBid(String orderId, String bidId) async {
    // TODO: Implement with API call
    throw UnimplementedError();
  }

  Future<RiderTracking> getRiderTracking(String orderId) async {
    // TODO: Implement with API call
    throw UnimplementedError();
  }
}

// Providers
final orderRepositoryProvider = Provider((ref) => OrderRepository());

final orderByIdProvider = FutureProvider.family<Order, String>((ref, orderId) {
  final repository = ref.watch(orderRepositoryProvider);
  return repository.getOrderById(orderId);
});

final userOrdersProvider = FutureProvider.family<List<Order>, String>((ref, userId) {
  final repository = ref.watch(orderRepositoryProvider);
  return repository.getUserOrders(userId);
});

final orderBidsProvider = FutureProvider.family<List<Bid>, String>((ref, orderId) {
  final repository = ref.watch(orderRepositoryProvider);
  return repository.getOrderBids(orderId);
});

final riderTrackingProvider = FutureProvider.family<RiderTracking, String>((ref, orderId) {
  final repository = ref.watch(orderRepositoryProvider);
  return repository.getRiderTracking(orderId);
});
