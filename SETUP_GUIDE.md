# HighesWash Flutter App - Live Preview Setup Guide

## Quick Start

### Prerequisites
- Flutter SDK (v3.0.0 or higher)
- Dart SDK (included with Flutter)
- Chrome or Edge browser (for web preview)
- VS Code with Flutter extension (optional but recommended)

### Installation Steps

1. **Navigate to project directory:**
   ```bash
   cd /workspaces/higheswashios
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Get Flutter packages:**
   ```bash
   flutter pub upgrade
   ```

## Running the App

### Option 1: Web Preview (Recommended for Development)
```bash
flutter run -d web
```
This will open the app in your default browser at `http://localhost:8080`

### Option 2: Chrome Specifically
```bash
flutter run -d chrome
```

### Option 3: Android Emulator
```bash
flutter run -d emulator-5554  # or your emulator name
```

### Option 4: Connected Device
```bash
flutter run
```

## Development Server Details

Once running:
- **Hot Reload**: Press `r` in terminal to reload changes
- **Hot Restart**: Press `R` in terminal for full restart
- **Quit**: Press `q` to stop the development server
- **DevTools**: Press `d` for Dart DevTools

## Project Structure

```
lib/
├── main.dart              # App entry point
├── theme/                 # App theming
├── routes/               # Navigation routing
├── screens/              # UI screens
│   ├── auth/            # Login/Register
│   ├── home/            # Home screen
│   ├── orders/          # Orders management
│   ├── profile/         # User profile
│   └── common/          # Shared screens
├── models/              # Data models
├── services/            # API & business logic
├── widgets/             # Reusable widgets
└── utils/              # Utilities & constants
```

## Features Implemented

✅ Onboarding flow (4-page carousel)
✅ Authentication screens (Login/Register)
✅ Home screen with hero section
✅ Service listing with cards
✅ Bottom navigation
✅ Theme system (Material 3)
✅ Routing with GoRouter
✅ Local storage service
✅ API service with error handling
✅ Custom widgets & components

## Next: Supabase Integration

Once you provide Supabase credentials, we'll:
1. Connect backend database
2. Implement real authentication
3. Add order management
4. Enable real-time features
5. Integrate location services
6. Set up messaging system

## Troubleshooting

**Chrome not found:**
```bash
flutter run -d web --web-renderer html
```

**Port already in use:**
```bash
flutter run -d web --web-port 8081
```

**Clear cache and rebuild:**
```bash
flutter clean
flutter pub get
flutter run -d web
```

## Building for Production

```bash
# Build web app
flutter build web

# Build APK (Android)
flutter build apk

# Build AAB (Android App Bundle)
flutter build appbundle

# Build IPA (iOS)
flutter build ios
```

The app is fully structured and ready for live preview! 🚀
