class Service {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final double basePrice;
  final String category; // 'washing', 'ironing', 'dry_cleaning', etc.
  final int estimatedDays;
  final bool isTrending;
  final double rating;
  final int reviewCount;
  final List<ServiceDetail> details;
  final DateTime createdAt;

  Service({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.basePrice,
    required this.category,
    required this.estimatedDays,
    required this.isTrending,
    required this.rating,
    required this.reviewCount,
    required this.details,
    required this.createdAt,
  });

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      imageUrl: json['image_url'] ?? '',
      basePrice: (json['base_price'] as num?)?.toDouble() ?? 0.0,
      category: json['category'] ?? '',
      estimatedDays: json['estimated_days'] ?? 0,
      isTrending: json['is_trending'] ?? false,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      reviewCount: json['review_count'] ?? 0,
      details: (json['details'] as List<dynamic>?)
              ?.map((e) => ServiceDetail.fromJson(e))
              .toList() ??
          [],
      createdAt: DateTime.parse(json['created_at'] ?? DateTime.now().toIso8601String()),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'image_url': imageUrl,
        'base_price': basePrice,
        'category': category,
        'estimated_days': estimatedDays,
        'is_trending': isTrending,
        'rating': rating,
        'review_count': reviewCount,
        'details': details.map((e) => e.toJson()).toList(),
        'created_at': createdAt.toIso8601String(),
      };
}

class ServiceDetail {
  final String key;
  final String value;

  ServiceDetail({
    required this.key,
    required this.value,
  });

  factory ServiceDetail.fromJson(Map<String, dynamic> json) {
    return ServiceDetail(
      key: json['key'] ?? '',
      value: json['value'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'key': key,
        'value': value,
      };
}
