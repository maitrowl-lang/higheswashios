class Bid {
  final String id;
  final String orderId;
  final String merchantId;
  final String merchantName;
  final String merchantImage;
  final double quotedPrice;
  final int estimatedDays;
  final String message;
  final double merchantRating;
  final int merchantReviews;
  final String status; // 'pending', 'accepted', 'rejected'
  final DateTime createdAt;

  Bid({
    required this.id,
    required this.orderId,
    required this.merchantId,
    required this.merchantName,
    required this.merchantImage,
    required this.quotedPrice,
    required this.estimatedDays,
    required this.message,
    required this.merchantRating,
    required this.merchantReviews,
    required this.status,
    required this.createdAt,
  });

  factory Bid.fromJson(Map<String, dynamic> json) {
    return Bid(
      id: json['id'] ?? '',
      orderId: json['order_id'] ?? '',
      merchantId: json['merchant_id'] ?? '',
      merchantName: json['merchant_name'] ?? '',
      merchantImage: json['merchant_image'] ?? '',
      quotedPrice: (json['quoted_price'] as num?)?.toDouble() ?? 0.0,
      estimatedDays: json['estimated_days'] ?? 0,
      message: json['message'] ?? '',
      merchantRating: (json['merchant_rating'] as num?)?.toDouble() ?? 0.0,
      merchantReviews: json['merchant_reviews'] ?? 0,
      status: json['status'] ?? 'pending',
      createdAt: DateTime.parse(json['created_at'] ?? DateTime.now().toIso8601String()),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'order_id': orderId,
        'merchant_id': merchantId,
        'merchant_name': merchantName,
        'merchant_image': merchantImage,
        'quoted_price': quotedPrice,
        'estimated_days': estimatedDays,
        'message': message,
        'merchant_rating': merchantRating,
        'merchant_reviews': merchantReviews,
        'status': status,
        'created_at': createdAt.toIso8601String(),
      };
}
