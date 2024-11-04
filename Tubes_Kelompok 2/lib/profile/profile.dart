import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/profile_picture.jpg'), // Replace with your actual profile image
            ),
            SizedBox(height: 20),
            Text(
              'Bambang',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'hernandex.redial@gmail.ac.in',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 40),
            Card(
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Ubah Akun'),
                    onTap: () {
                      // Navigate to change account screen
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.payment),
                    title: Text('Opsi Pembayaran'),
                    onTap: () {
                      // Navigate to payment options screen
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.notifications),
                    title: Text('Pemberitahuan'),
                    onTap: () {
                      // Navigate to notification screen
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.history),
                    title: Text('Riwayat'),
                    onTap: () {
                      // Navigate to history screen
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.logout),
                    title: Text('Keluar'),
                    onTap: () {

                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Order'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Akun'),
        ],
      ),
    );
  }
}

/*import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/profile_picture.jpg'), // Replace with your actual profile image
            ),
            SizedBox(height: 20),
            Text(
              'Bambang',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'hernandex.redial@gmail.ac.in',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 40),
            Card(
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Ubah Akun'),
                    onTap: () {
                      // Navigate to change account screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ChangeAccountScreen()), // Replace with your actual ChangeAccountScreen
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.payment),
                    title: Text('Opsi Pembayaran'),
                    onTap: () {
                      // Navigate to payment options screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PaymentOptionsScreen()), // Replace with your actual PaymentOptionsScreen
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.notifications),
                    title: Text('Pemberitahuan'),
                    onTap: () {
                      // Navigate to notification screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NotificationScreen()), // Replace with your actual NotificationScreen
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.history),
                    title: Text('Riwayat'),
                    onTap: () {
                      // Navigate to history screen
                      Navigator.push (
                        context,
                        MaterialPageRoute(builder: (context) => HistoryScreen()), // Replace with your actual HistoryScreen
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.logout),
                    title: Text('Keluar'),
                    onTap: () {
                      // Logout logic here
                      // For example, you can use a package like flutter_secure_storage to store and remove the user's token
                      // await FlutterSecureStorage.delete(key: 'token');
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()), // Replace with your actual LoginScreen
                        (Route<dynamic> route) => false,
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Order'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Akun'),
        ],
      ),
    );
  }
}*/