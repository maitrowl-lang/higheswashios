class Message {
  final String id;
  final String orderId;
  final String senderId;
  final String senderName;
  final String senderType; // 'customer', 'merchant', 'rider'
  final String? senderImage;
  final String messageText;
  final List<String>? attachments;
  final DateTime timestamp;
  final bool isRead;

  Message({
    required this.id,
    required this.orderId,
    required this.senderId,
    required this.senderName,
    required this.senderType,
    this.senderImage,
    required this.messageText,
    this.attachments,
    required this.timestamp,
    required this.isRead,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['id'] ?? '',
      orderId: json['order_id'] ?? '',
      senderId: json['sender_id'] ?? '',
      senderName: json['sender_name'] ?? '',
      senderType: json['sender_type'] ?? '',
      senderImage: json['sender_image'],
      messageText: json['message_text'] ?? '',
      attachments: List<String>.from(json['attachments'] as List<dynamic>? ?? []),
      timestamp: DateTime.parse(json['timestamp'] ?? DateTime.now().toIso8601String()),
      isRead: json['is_read'] ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'order_id': orderId,
        'sender_id': senderId,
        'sender_name': senderName,
        'sender_type': senderType,
        'sender_image': senderImage,
        'message_text': messageText,
        'attachments': attachments,
        'timestamp': timestamp.toIso8601String(),
        'is_read': isRead,
      };
}
