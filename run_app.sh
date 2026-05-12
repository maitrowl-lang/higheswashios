#!/bin/bash
cd /workspaces/higheswashios
flutter pub get
echo "Running Flutter app..."
flutter run -d web
