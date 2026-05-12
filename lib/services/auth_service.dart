import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:higheswashios/models/index.dart';

// Auth Service
class AuthService {
  static final AuthService _instance = AuthService._internal();

  AuthService._internal();

  factory AuthService() {
    return _instance;
  }

  // TODO: Implement with Firebase or Supabase
  
  Future<User> login(String email, String password) async {
    // Implement login logic
    throw UnimplementedError();
  }

  Future<User> register(String name, String email, String phone, String password, String userType) async {
    // Implement registration logic
    throw UnimplementedError();
  }

  Future<void> logout() async {
    // Implement logout logic
    throw UnimplementedError();
  }

  Future<User?> getCurrentUser() async {
    // Get current user from local storage or API
    throw UnimplementedError();
  }

  Future<void> resetPassword(String email) async {
    // Implement password reset logic
    throw UnimplementedError();
  }
}

// Providers
final authServiceProvider = Provider((ref) => AuthService());

final currentUserProvider = FutureProvider<User?>((ref) {
  final authService = ref.watch(authServiceProvider);
  return authService.getCurrentUser();
});

final authStateProvider = StateNotifierProvider<AuthStateNotifier, AsyncValue<User?>>((ref) {
  return AuthStateNotifier(ref);
});

class AuthStateNotifier extends StateNotifier<AsyncValue<User?>> {
  final Ref ref;

  AuthStateNotifier(this.ref) : super(const AsyncValue.loading()) {
    _initAuth();
  }

  Future<void> _initAuth() async {
    final authService = ref.read(authServiceProvider);
    state = await AsyncValue.guard(() => authService.getCurrentUser());
  }

  Future<void> login(String email, String password) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() {
      final authService = ref.read(authServiceProvider);
      return authService.login(email, password);
    });
  }

  Future<void> register(
    String name,
    String email,
    String phone,
    String password,
    String userType,
  ) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() {
      final authService = ref.read(authServiceProvider);
      return authService.register(name, email, phone, password, userType);
    });
  }

  Future<void> logout() async {
    final authService = ref.read(authServiceProvider);
    await authService.logout();
    state = const AsyncValue.data(null);
  }
}
