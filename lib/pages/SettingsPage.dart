import 'package:flutter/material.dart';
import 'package:mindfulwalk/pages/BottomNavBar.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      appBar: AppBar(
        leading: IconButton(
          icon: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child:
                  Image.asset('assets/backArrow.png', width: 40, height: 40)),
          onPressed: null, // Disabling the back button
        ),
        title: Text('\nSettings',
            style: TextStyle(
                color: const Color(0xff406440),
                fontWeight: FontWeight.bold,
                fontSize: 25)),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'General',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.italic,
                color: const Color(0xff406440),
              ),
            ),
            SizedBox(height: 1),
            SettingsItem(
              title: 'Account',
              iconPath: 'assets/Account.png', // Change this to your icon path
            ),
            SettingsItem(
              title: 'Notifications',
              iconPath:
                  'assets/Notifications.png', // Change this to your icon path
            ),
            SettingsItem(
              title: 'Location Settings',
              iconPath: 'assets/Location.png', // Change this to your icon path
            ),
            SizedBox(height: 7),
            Text(
              ' ___________________________________ ',
              style: TextStyle(
                fontSize: 20,
                color: const Color(0xff406440),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'More',
              style: TextStyle(
                fontSize: 20,
                color: const Color(0xff406440),
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.italic,
              ),
            ),
            SettingsItem(
              title: 'Customer Service',
              iconPath:
                  'assets/CustomerService.png', // Change this to your icon path
            ),
            SettingsItem(
              title: 'Information',
              iconPath:
                  'assets/Information.png', // Change this to your icon path
            ),
            SettingsItem(
              title: 'Application Introduction',
              iconPath:
                  'assets/ApplicationIntroductions.png', // Change this to your icon path
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsItem extends StatelessWidget {
  final String title;
  final String iconPath;

  SettingsItem({required this.title, required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: const Color(0xffEDE9D7),
      margin: EdgeInsets.symmetric(vertical: 15),
      child: ListTile(
        leading: Image.asset(
          iconPath,
          width: 24, // Adjust the icon size as needed
          height: 24,
        ),
        title: Text(title),
        onTap: () {
          // Add your logic for handling each setting item's tap
        },
      ),
    );
  }
}
