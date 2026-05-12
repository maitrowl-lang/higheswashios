import 'package:go_router/go_router.dart';
import '../screens/screens.dart';
import '../services/storage_service.dart';

GoRouter createAppRouter() {
  return GoRouter(
    initialLocation: '/onboarding',
    redirect: (context, state) async {
      final storageService = StorageService();
      final isOnboardingShown = await storageService.isOnboardingShown();
      final hasToken = await storageService.getToken() != null;
      
      // If user hasn't seen onboarding and is not on onboarding or auth routes
      if (!isOnboardingShown && !state.location.startsWith('/onboarding') && !state.location.startsWith('/auth')) {
        return '/onboarding';
      }
      
      // If user is logged in but on auth routes, redirect to home
      if (hasToken && state.location.startsWith('/auth')) {
        return '/home';
      }
      
      // If user is not logged in but trying to access protected routes
      if (!hasToken && (state.location.startsWith('/home') || state.location == '/orders' || state.location == '/profile')) {
        return '/auth/login';
      }
      
      return null;
    },
    routes: [
      GoRoute(
        path: '/onboarding',
        name: 'onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: '/auth/login',
        name: 'login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/auth/register',
        name: 'register',
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) => const MainBottomNavScreen(),
        routes: [
          GoRoute(
            path: 'services',
            name: 'services',
            builder: (context, state) => const ServicesScreen(),
          ),
          GoRoute(
            path: 'service-details/:id',
            name: 'service-details',
            builder: (context, state) {
              final serviceId = state.pathParameters['id'] ?? '';
              return ServiceDetailsScreen(serviceId: serviceId);
            },
          ),
          GoRoute(
            path: 'cart',
            name: 'cart',
            builder: (context, state) => const CartScreen(),
          ),
        ],
      ),
      GoRoute(
        path: '/orders',
        name: 'orders',
        builder: (context, state) => const OrdersScreen(),
        routes: [
          GoRoute(
            path: 'details/:id',
            name: 'order-details',
            builder: (context, state) {
              final orderId = state.pathParameters['id'] ?? '';
              return OrdersScreen(orderId: orderId);
            },
          ),
          GoRoute(
            path: 'bidding/:id',
            name: 'bidding',
            builder: (context, state) {
              final orderId = state.pathParameters['id'] ?? '';
              return BiddingScreen(orderId: orderId);
            },
          ),
          GoRoute(
            path: 'tracking/:id',
            name: 'order-tracking',
            builder: (context, state) {
              final orderId = state.pathParameters['id'] ?? '';
              return OrderTrackingScreen(orderId: orderId);
            },
          ),
          GoRoute(
            path: 'messaging/:id',
            name: 'messaging',
            builder: (context, state) {
              final orderId = state.pathParameters['id'] ?? '';
              return MessagingScreen(orderId: orderId);
            },
          ),
        ],
      ),
      GoRoute(
        path: '/profile',
        name: 'profile',
        builder: (context, state) => const ProfileScreen(),
      ),
      GoRoute(
        path: '/how-it-works',
        name: 'how-it-works',
        builder: (context, state) => const HowItWorksScreen(),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('Route not found: ${state.location}'),
      ),
    ),
  );
}
