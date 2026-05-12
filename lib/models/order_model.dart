class Order {
  final String id;
  final String customerId;
  final String serviceId;
  final String status; // 'pending', 'bidding', 'accepted', 'in_progress', 'completed', 'cancelled'
  final OrderDetails details;
  final List<String> itemPhotos;
  final double? finalPrice;
  final String? acceptedMerchantId;
  final String? riderId;
  final DateTime createdAt;
  final DateTime? completedAt;
  final double? rating;
  final String? review;

  Order({
    required this.id,
    required this.customerId,
    required this.serviceId,
    required this.status,
    required this.details,
    required this.itemPhotos,
    this.finalPrice,
    this.acceptedMerchantId,
    this.riderId,
    required this.createdAt,
    this.completedAt,
    this.rating,
    this.review,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'] ?? '',
      customerId: json['customer_id'] ?? '',
      serviceId: json['service_id'] ?? '',
      status: json['status'] ?? 'pending',
      details: OrderDetails.fromJson(json['details'] ?? {}),
      itemPhotos: List<String>.from(json['item_photos'] as List<dynamic>? ?? []),
      finalPrice: (json['final_price'] as num?)?.toDouble(),
      acceptedMerchantId: json['accepted_merchant_id'],
      riderId: json['rider_id'],
      createdAt: DateTime.parse(json['created_at'] ?? DateTime.now().toIso8601String()),
      completedAt: json['completed_at'] != null ? DateTime.parse(json['completed_at']) : null,
      rating: (json['rating'] as num?)?.toDouble(),
      review: json['review'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'customer_id': customerId,
        'service_id': serviceId,
        'status': status,
        'details': details.toJson(),
        'item_photos': itemPhotos,
        'final_price': finalPrice,
        'accepted_merchant_id': acceptedMerchantId,
        'rider_id': riderId,
        'created_at': createdAt.toIso8601String(),
        'completed_at': completedAt?.toIso8601String(),
        'rating': rating,
        'review': review,
      };
}

class OrderDetails {
  final String pickupAddress;
  final String deliveryAddress;
  final String additionalNotes;
  final String urgency; // 'normal', 'urgent', 'express'
  final int quantity; // number of items

  OrderDetails({
    required this.pickupAddress,
    required this.deliveryAddress,
    required this.additionalNotes,
    required this.urgency,
    required this.quantity,
  });

  factory OrderDetails.fromJson(Map<String, dynamic> json) {
    return OrderDetails(
      pickupAddress: json['pickup_address'] ?? '',
      deliveryAddress: json['delivery_address'] ?? '',
      additionalNotes: json['additional_notes'] ?? '',
      urgency: json['urgency'] ?? 'normal',
      quantity: json['quantity'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        'pickup_address': pickupAddress,
        'delivery_address': deliveryAddress,
        'additional_notes': additionalNotes,
        'urgency': urgency,
        'quantity': quantity,
      };
}
