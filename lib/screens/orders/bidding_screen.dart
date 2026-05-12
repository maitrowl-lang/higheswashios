import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BiddingScreen extends StatefulWidget {
  final String orderId;

  const BiddingScreen({Key? key, required this.orderId}) : super(key: key);

  @override
  State<BiddingScreen> createState() => _BiddingScreenState();
}

class _BiddingScreenState extends State<BiddingScreen> {
  String? _selectedBidId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Merchant Bids'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Icon(Icons.info_outline, color: Colors.blue),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'You have 4 bids for your order. Choose the best one.',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            ...List.generate(
              4,
              (index) => Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: _buildBidCard(index),
              ),
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(20),
        child: ElevatedButton(
          onPressed: _selectedBidId != null
              ? () {
                  // TODO: Accept bid
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Bid accepted! Proceeding to payment.')),
                  );
                  context.go('/messaging/$orderId');
                }
              : null,
          style: ElevatedButton.styleFrom(
            minimumSize: Size(double.infinity, 50),
          ),
          child: Text('Accept Selected Bid'),
        ),
      ),
    );
  }

  Widget _buildBidCard(int index) {
    final merchantNames = [
      'Clean Express',
      'LaundryPro',
      'Quick Clean',
      'Premium Wash'
    ];
    final prices = [15.0, 16.5, 14.99, 17.0];
    final days = [2, 3, 2, 1];
    const ratings = [4.8, 4.6, 4.9, 4.7];
    const reviews = [245, 182, 312, 156];

    final bidId = 'bid_$index';

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedBidId = bidId;
        });
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            color: _selectedBidId == bidId
                ? Theme.of(context).primaryColor
                : Colors.grey[300]!,
            width: 2,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.purple[100 + (index * 50) % 300],
                    child: Text(merchantNames[index][0],
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          merchantNames[index],
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber, size: 16),
                            SizedBox(width: 4),
                            Text('${ratings[index]} (${reviews[index]} reviews)',
                                style: TextStyle(fontSize: 12)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Radio<String>(
                    value: bidId,
                    groupValue: _selectedBidId,
                    onChanged: (value) {
                      setState(() {
                        _selectedBidId = value;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Quote Price', style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                      Text(
                        '\$${prices[index]}',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Estimated Days', style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                      Text(
                        '${days[index]} days',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 12),
              Text(
                'Message from merchant: Looking forward to serving you. Will ensure best quality.',
                style: TextStyle(fontSize: 13, color: Colors.grey[700]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
