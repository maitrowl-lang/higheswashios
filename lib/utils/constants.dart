class AppConstants {
  // API
  static const String apiBaseUrl = 'https://your-api-domain.com/api';
  static const String wsBaseUrl = 'wss://your-ws-domain.com';
  
  // Timeouts
  static const Duration apiTimeout = Duration(seconds: 30);
  static const Duration imageUploadTimeout = Duration(minutes: 5);
  
  // Pagination
  static const int pageSize = 20;
  
  // Paths
  static const String ordersPath = '/orders';
  static const String bidsPath = '/bids';
  static const String messagesPath = '/messages';
  static const String usersPath = '/users';
  static const String servicesPath = '/services';
  static const String trackingPath = '/tracking';
  
  // Local Storage Keys
  static const String keyAuthToken = 'auth_token';
  static const String keyRefreshToken = 'refresh_token';
  static const String keyUserId = 'user_id';
  static const String keyUserRole = 'user_role';
  static const String keyUserData = 'user_data';
  static const String keyOnboardingShown = 'onboarding_shown';
  static const String keyThemeMode = 'theme_mode';
  static const String keyLanguage = 'language';
  
  // Default Values
  static const String defaultCurrency = '₹';
  static const double minOrderAmount = 50.0;
  static const double maxOrderAmount = 10000.0;
  
  // Time Limits
  static const Duration bidTimeout = Duration(minutes: 15);
  static const Duration pickupWindow = Duration(hours: 2);
  static const Duration deliveryWindow = Duration(days: 3);
  
  // UI Constants
  static const int maxPhotosPerOrder = 4;
  static const int maxMessageLength = 500;
  static const double defaultBorderRadius = 12.0;
}

class OrderStatus {
  static const String posted = 'posted';
  static const String bidding = 'bidding';
  static const String accepted = 'accepted';
  static const String pickupScheduled = 'pickup_scheduled';
  static const String pickupCompleted = 'pickup_completed';
  static const String processing = 'processing';
  static const String readyForDelivery = 'ready_for_delivery';
  static const String deliveryScheduled = 'delivery_scheduled';
  static const String completed = 'completed';
  static const String cancelled = 'cancelled';
}

class UserRole {
  static const String customer = 'customer';
  static const String merchant = 'merchant';
  static const String rider = 'rider';
  static const String admin = 'admin';
}

class ServiceType {
  static const String washing = 'washing';
  static const String ironing = 'ironing';
  static const String dryEleaning = 'dry_cleaning';
  static const String alterations = 'alterations';
  static const String delicate = 'delicate';
  static const String express = 'express';
}
