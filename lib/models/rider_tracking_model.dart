class RiderTracking {
  final String riderId;
  final String riderName;
  final String riderPhone;
  final String? riderImage;
  final double currentLatitude;
  final double currentLongitude;
  final String status; // 'on_way', 'arrived', 'picked_up', 'delivering', 'delivered'
  final double? estimatedArrivalMinutes;
  final double? distanceKm;
  final DateTime lastUpdated;
  final String? vehicleInfo;

  RiderTracking({
    required this.riderId,
    required this.riderName,
    required this.riderPhone,
    this.riderImage,
    required this.currentLatitude,
    required this.currentLongitude,
    required this.status,
    this.estimatedArrivalMinutes,
    this.distanceKm,
    required this.lastUpdated,
    this.vehicleInfo,
  });

  factory RiderTracking.fromJson(Map<String, dynamic> json) {
    return RiderTracking(
      riderId: json['rider_id'] ?? '',
      riderName: json['rider_name'] ?? '',
      riderPhone: json['rider_phone'] ?? '',
      riderImage: json['rider_image'],
      currentLatitude: (json['current_latitude'] as num?)?.toDouble() ?? 0.0,
      currentLongitude: (json['current_longitude'] as num?)?.toDouble() ?? 0.0,
      status: json['status'] ?? 'on_way',
      estimatedArrivalMinutes: (json['estimated_arrival_minutes'] as num?)?.toDouble(),
      distanceKm: (json['distance_km'] as num?)?.toDouble(),
      lastUpdated: DateTime.parse(json['last_updated'] ?? DateTime.now().toIso8601String()),
      vehicleInfo: json['vehicle_info'],
    );
  }

  Map<String, dynamic> toJson() => {
        'rider_id': riderId,
        'rider_name': riderName,
        'rider_phone': riderPhone,
        'rider_image': riderImage,
        'current_latitude': currentLatitude,
        'current_longitude': currentLongitude,
        'status': status,
        'estimated_arrival_minutes': estimatedArrivalMinutes,
        'distance_km': distanceKm,
        'last_updated': lastUpdated.toIso8601String(),
        'vehicle_info': vehicleInfo,
      };
}
