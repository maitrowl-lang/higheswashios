import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.purple[100],
                    child: Text('J', style: TextStyle(fontSize: 40)),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'John Doe',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  SizedBox(height: 4),
                  Text('john@example.com'),
                  SizedBox(height: 4),
                  Text('+1 (555) 123-4567'),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 20),
                      SizedBox(width: 4),
                      Text('4.8 (12 reviews)'),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 32),
            _buildSectionTitle('Account'),
            _buildListTile(
              icon: Icons.location_on,
              title: 'Saved Addresses',
              onTap: () {},
            ),
            _buildListTile(
              icon: Icons.payment,
              title: 'Payment Methods',
              onTap: () {},
            ),
            _buildListTile(
              icon: Icons.history,
              title: 'Order History',
              onTap: () {},
            ),
            SizedBox(height: 24),
            _buildSectionTitle('Support'),
            _buildListTile(
              icon: Icons.help,
              title: 'Help & Support',
              onTap: () {},
            ),
            _buildListTile(
              icon: Icons.info,
              title: 'About Us',
              onTap: () {},
            ),
            _buildListTile(
              icon: Icons.description,
              title: 'Terms & Conditions',
              onTap: () {},
            ),
            _buildListTile(
              icon: Icons.privacy_tip,
              title: 'Privacy Policy',
              onTap: () {},
            ),
            SizedBox(height: 24),
            _buildSectionTitle('Preferences'),
            _buildListTile(
              icon: Icons.notifications,
              title: 'Notifications',
              onTap: () {},
            ),
            _buildListTile(
              icon: Icons.dark_mode,
              title: 'Dark Mode',
              trailing: Icon(Icons.toggle_off),
              onTap: () {},
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement logout
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text('Logout', style: TextStyle(color: Colors.white)),
            ),
            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }

  Widget _buildListTile({
    required IconData icon,
    required String title,
    Widget? trailing,
    required VoidCallback onTap,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 4),
      leading: Icon(icon, color: Theme.of(context).primaryColor),
      title: Text(title),
      trailing: trailing ?? Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
