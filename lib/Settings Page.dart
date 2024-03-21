import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Settings App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SettingsPage(),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Color(0xFFFFA9A8),
        ),
        child: BottomNavigationBar(
          currentIndex: 0,
          selectedItemColor: Colors.white, // we can change this if we want text under each icon
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Image.asset('assets/HomeNotFilled.png', width: 45, height: 45),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.fromLTRB(0, 8, 30, 0),
                child: Image.asset('assets/Photo.png', width: 50, height: 50),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 35, 0),
                child: Image.asset('assets/Map.png', width: 50, height: 50),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.fromLTRB(0, 5, 30, 0),
                child: Image.asset('assets/Health.png', width: 50, height: 50),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 30, 0),
                child: Image.asset('assets/SettingsFilled.png', width: 40, height: 40),
              ),
              label: '',
            ),
          ],
          onTap: (index) {
            // Handle button tap
          },
        ),
      ),
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset('assets/BackArrow.png'),
          onPressed: null, // Disabling the back button
        ),
        title: Text('\nSettings', style: TextStyle(color: const Color(0xff406440), fontWeight: FontWeight.bold, fontSize:25)),
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
                fontWeight: FontWeight.w300,
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
              iconPath: 'assets/Notifications.png', // Change this to your icon path
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
                fontWeight: FontWeight.w300,
                fontStyle: FontStyle.italic,
              ),
            ),
            SettingsItem(
              title: 'Customer Service',
              iconPath: 'assets/CustomerService.png', // Change this to your icon path
            ),
            SettingsItem(
              title: 'Information',
              iconPath: 'assets/Information.png', // Change this to your icon path
            ),
            SettingsItem(
              title: 'Application Introduction',
              iconPath: 'assets/ApplicationIntroductions.png', // Change this to your icon path
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
      elevation: 3, color: const Color(0xffEDE9D7),
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
