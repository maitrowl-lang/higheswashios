import 'package:flutter/material.dart';

class OrderTrackingScreen extends StatefulWidget {
  final String orderId;

  const OrderTrackingScreen({Key? key, required this.orderId}) : super(key: key);

  @override
  State<OrderTrackingScreen> createState() => _OrderTrackingScreenState();
}

class _OrderTrackingScreenState extends State<OrderTrackingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Tracking'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Order Status Card
            Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Order #1001',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            SizedBox(height: 4),
                            Text('3 items - \$15.00',
                                style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.blue[100],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            'In Progress',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24),
            // Timeline
            Text(
              'Timeline',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(height: 16),
            _buildTimelineItem(
              'Order Confirmed',
              'Your order has been received',
              Icons.check_circle,
              Colors.green,
              true,
            ),
            _buildTimelineItem(
              'Bids Received',
              'Merchants are bidding for your order',
              Icons.people,
              Colors.blue,
              true,
            ),
            _buildTimelineItem(
              'Bid Accepted',
              'Accepted bid from Clean Express',
              Icons.handshake,
              Colors.purple,
              true,
            ),
            _buildTimelineItem(
              'Rider On The Way',
              'Ahmed (2 min away)',
              Icons.two_wheeler,
              Colors.orange,
              true,
            ),
            _buildTimelineItem(
              'Pickup Complete',
              'Items picked up',
              Icons.check,
              Colors.grey,
              false,
            ),
            _buildTimelineItem(
              'Processing',
              'Items being cleaned',
              Icons.local_laundry_service,
              Colors.grey,
              false,
            ),
            _buildTimelineItem(
              'Delivery',
              'Items ready for delivery',
              Icons.local_shipping,
              Colors.grey,
              false,
            ),
            SizedBox(height: 24),
            // Rider Info
            Text(
              'Rider Details',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(height: 12),
            Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 32,
                      backgroundColor: Colors.orange[100],
                      child: Text('A', style: TextStyle(fontSize: 24)),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ahmed Hassan',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.amber, size: 16),
                              SizedBox(width: 4),
                              Text('4.9 (342 rides)'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        IconButton(
                          icon: Icon(Icons.call, color: Colors.green),
                          onPressed: () {},
                        ),
                        Text('Call', style: TextStyle(fontSize: 10)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24),
            // Live Tracking Map
            Container(
              height: 300,
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.map, size: 40, color: Colors.blue),
                    SizedBox(height: 12),
                    Text('Live Map Tracking'),
                    Text('(Integration with Google Maps)',
                        style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildTimelineItem(
    String title,
    String subtitle,
    IconData icon,
    Color color,
    bool isCompleted,
  ) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Column(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color.withOpacity(0.2),
                  border: Border.all(color: color, width: 2),
                ),
                child: Center(
                  child: Icon(icon, color: color, size: 20),
                ),
              ),
              if (isCompleted)
                Container(
                  width: 2,
                  height: 30,
                  color: color,
                ),
            ],
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
