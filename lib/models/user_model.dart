class User {
  final String id;
  final String email;
  final String name;
  final String phoneNumber;
  final String? profileImage;
  final String userType; // 'customer', 'merchant', 'rider'
  final Address address;
  final DateTime createdAt;
  final double? rating;
  final int? totalOrders;

  User({
    required this.id,
    required this.email,
    required this.name,
    required this.phoneNumber,
    this.profileImage,
    required this.userType,
    required this.address,
    required this.createdAt,
    this.rating,
    this.totalOrders,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? '',
      email: json['email'] ?? '',
      name: json['name'] ?? '',
      phoneNumber: json['phone_number'] ?? '',
      profileImage: json['profile_image'],
      userType: json['user_type'] ?? 'customer',
      address: Address.fromJson(json['address'] ?? {}),
      createdAt: DateTime.parse(json['created_at'] ?? DateTime.now().toIso8601String()),
      rating: (json['rating'] as num?)?.toDouble(),
      totalOrders: json['total_orders'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'name': name,
        'phone_number': phoneNumber,
        'profile_image': profileImage,
        'user_type': userType,
        'address': address.toJson(),
        'created_at': createdAt.toIso8601String(),
        'rating': rating,
        'total_orders': totalOrders,
      };
}

class Address {
  final String street;
  final String city;
  final String state;
  final String postalCode;
  final double latitude;
  final double longitude;

  Address({
    required this.street,
    required this.city,
    required this.state,
    required this.postalCode,
    required this.latitude,
    required this.longitude,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street: json['street'] ?? '',
      city: json['city'] ?? '',
      state: json['state'] ?? '',
      postalCode: json['postal_code'] ?? '',
      latitude: (json['latitude'] as num?)?.toDouble() ?? 0.0,
      longitude: (json['longitude'] as num?)?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() => {
        'street': street,
        'city': city,
        'state': state,
        'postal_code': postalCode,
        'latitude': latitude,
        'longitude': longitude,
      };
}
