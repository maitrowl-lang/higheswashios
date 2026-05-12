import 'package:geolocator/geolocator.dart';

// Location Service
class LocationService {
  static final LocationService _instance = LocationService._internal();

  LocationService._internal();

  factory LocationService() {
    return _instance;
  }

  Future<bool> requestLocationPermission() async {
    try {
      final permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        final status = await Geolocator.requestPermission();
        return status == LocationPermission.whileInUse || 
               status == LocationPermission.always;
      }
      return permission == LocationPermission.whileInUse ||
             permission == LocationPermission.always;
    } catch (e) {
      return false;
    }
  }

  Future<Position> getCurrentLocation() async {
    try {
      return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
    } catch (e) {
      rethrow;
    }
  }

  Stream<Position> getLocationUpdates() {
    return Geolocator.getPositionStream(
      locationSettings: LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 10, // Update every 10 meters
      ),
    );
  }

  Future<double> getDistanceBetween(
    double lat1,
    double lon1,
    double lat2,
    double lon2,
  ) async {
    return Geolocator.distanceBetween(lat1, lon1, lat2, lon2);
  }
}
