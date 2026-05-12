import 'package:flutter/material.dart';

class HowItWorksScreen extends StatelessWidget {
  const HowItWorksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('How It Works'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildStep(
              context,
              '1',
              'Select Service',
              'Browse through our laundry services and choose what you need.',
              '🔍',
            ),
            _buildStep(
              context,
              '2',
              'Fill Details',
              'Provide delivery address, special instructions, and upload photos.',
              '📝',
            ),
            _buildStep(
              context,
              '3',
              'Take Photos',
              'Take photos of your items for documentation and quality assurance.',
              '📸',
            ),
            _buildStep(
              context,
              '4',
              'Post Request',
              'Submit your order and let merchants know about your requirements.',
              '📤',
            ),
            _buildStep(
              context,
              '5',
              'Merchants Bid',
              'Up to 4 merchants will bid for your order with their quoted prices.',
              '💰',
            ),
            _buildStep(
              context,
              '6',
              'Accept Bid',
              'Choose the bid that fits your budget and requirements.',
              '✅',
            ),
            _buildStep(
              context,
              '7',
              'Rider Pickup',
              'System assigns a rider who picks up your items from your location.',
              '🚴',
            ),
            _buildStep(
              context,
              '8',
              'Payment',
              'Make payment to the rider or use our secure payment gateway.',
              '💳',
            ),
            _buildStep(
              context,
              '9',
              'Real-time Tracking',
              'Track your order in real-time from pickup to delivery.',
              '📍',
            ),
            _buildStep(
              context,
              '10',
              'Messaging',
              'Stay in touch with merchant and rider through real-time messaging.',
              '💬',
            ),
            _buildStep(
              context,
              '11',
              'Service Processing',
              'Merchant processes your items with care and attention.',
              '✨',
            ),
            _buildStep(
              context,
              '12',
              'Delivery',
              'Rider delivers your cleaned items to your preferred location.',
              '🚚',
            ),
            SizedBox(height: 24),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Why Choose HighesWash?',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  SizedBox(height: 12),
                  _buildBenefit('✓ Affordable prices from multiple merchants'),
                  _buildBenefit('✓ Real-time order tracking'),
                  _buildBenefit('✓ Safe and secure payment'),
                  _buildBenefit('✓ Direct communication with service providers'),
                  _buildBenefit('✓ Quality assured services'),
                  _buildBenefit('✓ Fast delivery options'),
                ],
              ),
            ),
            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildStep(
    BuildContext context,
    String number,
    String title,
    String description,
    String emoji,
  ) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: Theme.of(context).primaryColor,
            child: Text(
              number,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      emoji,
                      style: TextStyle(fontSize: 24),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        title,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(height: 4),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBenefit(String benefit) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Text(benefit),
    );
  }
}
