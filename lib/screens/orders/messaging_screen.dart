import 'package:flutter/material.dart';

class MessagingScreen extends StatefulWidget {
  final String orderId;

  const MessagingScreen({Key? key, required this.orderId}) : super(key: key);

  @override
  State<MessagingScreen> createState() => _MessagingScreenState();
}

class _MessagingScreenState extends State<MessagingScreen> {
  late TextEditingController _messageController;
  final List<ChatMessage> messages = [
    ChatMessage(
      name: 'Clean Express',
      message: 'Hi! Your order has been received. Will start soon.',
      isFromMe: false,
      timestamp: DateTime.now().subtract(Duration(minutes: 5)),
    ),
    ChatMessage(
      name: 'You',
      message: 'Thanks! Please ensure the items are handled carefully.',
      isFromMe: true,
      timestamp: DateTime.now().subtract(Duration(minutes: 3)),
    ),
    ChatMessage(
      name: 'Clean Express',
      message: 'Absolutely! Rider is on the way to pick up your items.',
      isFromMe: false,
      timestamp: DateTime.now().subtract(Duration(minutes: 1)),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _messageController = TextEditingController();
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clean Express'),
        subtitle: Text('Rider: Ahmed (2 min away)'),
        actions: [
          IconButton(
            icon: Icon(Icons.call),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16),
              reverse: true,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[messages.length - 1 - index];
                return _buildMessageBubble(message);
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(top: BorderSide(color: Colors.grey[300]!)),
            ),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.attach_file),
                  onPressed: () {},
                ),
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide(color: Colors.grey[300]!),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.send, color: Colors.white),
                    onPressed: () {
                      if (_messageController.text.isNotEmpty) {
                        setState(() {
                          messages.add(ChatMessage(
                            name: 'You',
                            message: _messageController.text,
                            isFromMe: true,
                            timestamp: DateTime.now(),
                          ));
                          _messageController.clear();
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(ChatMessage message) {
    return Align(
      alignment: message.isFromMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(bottom: 12),
        child: Column(
          crossAxisAlignment: message.isFromMe
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          children: [
            if (!message.isFromMe)
              Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: Text(
                  message.name,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: message.isFromMe
                    ? Theme.of(context).primaryColor
                    : Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                message.message,
                style: TextStyle(
                  color: message.isFromMe ? Colors.white : Colors.black,
                ),
              ),
            ),
            SizedBox(height: 4),
            Text(
              message.timestamp.toString().split('.')[0].split(' ')[1],
              style: TextStyle(fontSize: 10, color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatMessage {
  final String name;
  final String message;
  final bool isFromMe;
  final DateTime timestamp;

  ChatMessage({
    required this.name,
    required this.message,
    required this.isFromMe,
    required this.timestamp,
  });
}
