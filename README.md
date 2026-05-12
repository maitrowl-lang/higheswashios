# 🧺 HighesWash - On-Demand Laundry App

A stunning Flutter application for booking laundry services with merchant bidding, real-time tracking, and messaging.

## 📱 Features

### Core Features
- **Onboarding Flow** - Beautiful 4-page carousel introduction
- **User Authentication** - Secure login/register with validation
- **Service Browsing** - Hero section, trending services, grid layout
- **Shopping Cart** - Add services to cart with pricing
- **Order Management** - Create, track, and manage orders
- **Merchant Bidding** - Multiple merchants bid on your order
- **Order Tracking** - Real-time GPS tracking with rider
- **Real-Time Messaging** - Chat with merchants and riders
- **User Profile** - Account management and order history

### Technical Features
- 🎨 Material 3 Design System
- 🧭 GoRouter Navigation with Guards
- 🔒 Secure Local Storage
- 📡 HTTP API Integration Ready
- 🎯 State Management with Provider
- ✅ Form Validation
- 🎭 Custom Widgets & Components
- 📊 Error Handling

## 🚀 Quick Start

### Prerequisites
```bash
Flutter SDK >= 3.0.0
Dart >= 3.0.0
```

### Installation

1. **Get dependencies:**
   ```bash
   flutter pub get
   ```

2. **Run web preview:**
   ```bash
   flutter run -d web
   ```

3. **Or run on Android/iOS:**
   ```bash
   flutter run
   ```

## 📁 Project Structure

```
lib/
├── main.dart                    # App entry point
├── theme/
│   └── theme.dart             # Material 3 theme
├── routes/
│   └── app_router.dart        # Navigation routes
├── screens/
│   ├── auth/
│   │   ├── login_screen.dart
│   │   └── register_screen.dart
│   ├── home/
│   │   └── home_screen.dart
│   ├── orders/
│   │   ├── orders_screen.dart
│   │   ├── bidding_screen.dart
│   │   ├── order_tracking_screen.dart
│   │   └── messaging_screen.dart
│   ├── profile/
│   │   └── profile_screen.dart
│   ├── common/
│   │   ├── main_bottom_nav_screen.dart
│   │   └── how_it_works_screen.dart
│   └── onboarding/
│       └── onboarding_screen.dart
├── models/
│   ├── user_model.dart
│   ├── service_model.dart
│   ├── order_model.dart
│   ├── bid_model.dart
│   ├── message_model.dart
│   └── rider_tracking_model.dart
├── services/
│   ├── api_service.dart       # HTTP client
│   ├── auth_service.dart      # Authentication
│   ├── storage_service.dart   # Local storage
│   ├── location_service.dart  # Location services
│   ├── messaging_service.dart # Real-time messaging
│   ├── order_repository.dart  # Order management
│   ├── service_repository.dart
│   └── exceptions.dart        # Custom exceptions
├── widgets/
│   └── app_widgets.dart       # Reusable components
├── utils/
│   ├── constants.dart         # App constants
│   ├── validators.dart        # Form validators
│   └── formatters.dart        # Data formatters
└── theme/
    └── theme.dart             # Theme configuration
```

## 🎯 Workflow

1. **Onboarding** → User sees introduction slides
2. **Authentication** → Login or Register
3. **Browse Services** → View available laundry services
4. **Create Order** → Select service, add to cart, create order
5. **Take Photos** → Upload photos of laundry
6. **Bidding** → Merchants submit bids (auto-assigned to affordable option)
7. **Pickup** → Rider assigned and picks up laundry
8. **Real-time Tracking** → Customer tracks rider in real-time
9. **Messaging** → Chat with merchant/rider during process
10. **Delivery** → Rider delivers cleaned laundry
11. **Completion** → Order marked as complete

## 🔑 Key Classes

### Models
- `UserModel` - Customer, Merchant, Rider user data
- `ServiceModel` - Service details, pricing, type
- `OrderModel` - Order info, status, timeline
- `BidModel` - Merchant bid details
- `MessageModel` - Chat messages
- `RiderTrackingModel` - Real-time location data

### Services
- `ApiService` - RESTful API client with auth
- `StorageService` - Secure local data persistence
- `AuthService` - Authentication logic
- `LocationService` - GPS and map integration
- `MessagingService` - WebSocket real-time messaging

### Widgets
- `ServiceCard` - Service display component
- `OrderCard` - Order summary component
- `BidCard` - Bid information component
- `LoadingWidget` - Loading indicator
- `EmptyStateWidget` - No data state

## 🎨 Color Scheme

```dart
Primary:     #6366F1 (Indigo)
Secondary:   #8B5CF6 (Purple)
Accent:      #EC4899 (Pink)
Success:     #10B981 (Green)
Warning:     #F59E0B (Amber)
Error:       #EF4444 (Red)
```

## 🔐 Authentication Routes

```
/onboarding       - Onboarding carousel
/auth/login       - Login screen
/auth/register    - Registration screen
/home             - Main home screen
/home/services    - Services listing
/home/service-details/:id - Service details
/home/cart        - Shopping cart
/orders           - Orders listing
/orders/bidding/:id - Bidding screen
/orders/tracking/:id - Live tracking
/orders/messaging/:id - Messaging screen
/profile          - User profile
/how-it-works     - Tutorial
```

## 📦 Dependencies

### Navigation & UI
- `go_router` - Type-safe routing
- `flutter_animate` - Animations

### State Management
- `provider` - State management

### Backend & API
- `http` - HTTP client
- `dio` - Advanced HTTP client
- `supabase_flutter` - Backend-as-a-Service

### Location & Maps
- `geolocator` - GPS location
- `google_maps_flutter` - Map display

### Storage
- `shared_preferences` - Local storage
- `sqflite` - Local database

### Media
- `image_picker` - Image selection
- `cached_network_image` - Image caching

### Real-Time
- `socket_io_client` - WebSocket messaging
- `firebase_messaging` - Push notifications

## 🛠️ Development

### Hot Reload
```bash
Press 'r' in terminal while running
```

### Hot Restart
```bash
Press 'R' in terminal while running
```

### Run with DevTools
```bash
flutter run --profile
# Then press 'd' for DevTools
```

### Build for Production
```bash
# Web
flutter build web

# Android
flutter build apk
flutter build appbundle

# iOS
flutter build ios
```

## 📝 Environment Setup

Create `.env` file in project root:
```
API_BASE_URL=https://your-api.com
SUPABASE_URL=https://your-supabase-url.com
SUPABASE_ANON_KEY=your-anon-key
GOOGLE_MAPS_API_KEY=your-maps-api-key
```

## 🐛 Troubleshooting

**Port 8080 already in use:**
```bash
flutter run -d web --web-port 8081
```

**Chrome not found:**
```bash
flutter run -d web --web-renderer html
```

**Dependencies issues:**
```bash
flutter clean
flutter pub get
flutter run -d web
```

## 📦 Next Steps

1. **Set up Supabase backend** - Database configuration
2. **Implement authentication** - Firebase/Supabase Auth
3. **Connect payment gateway** - Stripe/Razorpay
4. **Set up real-time database** - Order sync
5. **Implement push notifications** - Firebase Cloud Messaging
6. **Configure maps** - Google Maps API
7. **Set up messaging** - Socket.io server

## 📄 License

Copyright © 2024 HighesWash. All rights reserved.

## 📧 Support

For issues or questions, please contact: support@higheswash.com

## 🙏 Credits

Built with ❤️ using Flutter, Provider, and GoRouter

---

**Ready to launch?** Run `flutter run -d web` and see your app live! 🚀
