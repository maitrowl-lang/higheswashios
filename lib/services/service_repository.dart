import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:higheswashios/models/index.dart';

// Service Repository
class ServiceRepository {
  static final ServiceRepository _instance = ServiceRepository._internal();

  ServiceRepository._internal();

  factory ServiceRepository() {
    return _instance;
  }

  Future<List<Service>> getAllServices() async {
    // TODO: Implement with API call
    return [];
  }

  Future<List<Service>> getTrendingServices() async {
    // TODO: Implement with API call
    return [];
  }

  Future<Service> getServiceById(String serviceId) async {
    // TODO: Implement with API call
    throw UnimplementedError();
  }

  Future<List<Service>> searchServices(String query) async {
    // TODO: Implement with API call
    return [];
  }
}

// Providers
final serviceRepositoryProvider = Provider((ref) => ServiceRepository());

final allServicesProvider = FutureProvider((ref) {
  final repository = ref.watch(serviceRepositoryProvider);
  return repository.getAllServices();
});

final trendingServicesProvider = FutureProvider((ref) {
  final repository = ref.watch(serviceRepositoryProvider);
  return repository.getTrendingServices();
});

final serviceByIdProvider = FutureProvider.family<Service, String>((ref, serviceId) {
  final repository = ref.watch(serviceRepositoryProvider);
  return repository.getServiceById(serviceId);
});

final searchServicesProvider = FutureProvider.family<List<Service>, String>((ref, query) {
  final repository = ref.watch(serviceRepositoryProvider);
  return repository.searchServices(query);
});
