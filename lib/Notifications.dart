import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage("assets/BackgroundImage.png"), fit: BoxFit.cover)),
    child: Scaffold(
          backgroundColor: Colors.transparent,
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
            title: Text('\nNotifications', style: TextStyle(color: const Color(0xff406440), fontWeight: FontWeight.bold, fontSize: 25)),
            centerTitle: false, backgroundColor: Colors.transparent,
          ),
          body:
          Container(
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: NotificationsPage(),
              ),
          ),
          ),
      ),
    );
  }
}

class NotificationsPage extends StatefulWidget {
  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  bool dailyRemindersEnabled = true;
  bool quoteOfTheDayEnabled = false;
  bool whileWalkingEnabled = true;
  bool bookmarkedEnabled = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 356.0, // Adjust the height of the background box
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(width: 0, color: Color(0xFFEDE9D7),
            ),
            borderRadius: BorderRadius.all(Radius.circular(20),),
            color: Color(0xFFEDE9D7),
      ),
        //color: Color(0xFFEDE9D7),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 1.0, // Adjust the height to move the "Notifications" text up
              ),
              Text(
                'Allow Notifications',
                style: TextStyle(
                  fontSize: 20,
                  color: const Color(0xff8B6B55),
                ),
              ),
              SizedBox(height: 20.0),
              buildNotificationSwitch('daily reminders', dailyRemindersEnabled, (value) {
                setState(() {
                  dailyRemindersEnabled = value;
                });
              }),
              buildNotificationSwitch('quote of the day', quoteOfTheDayEnabled, (value) {
                setState(() {
                  quoteOfTheDayEnabled = value;
                });
              }),
              buildNotificationSwitch('while walking', whileWalkingEnabled, (value) {
                setState(() {
                  whileWalkingEnabled = value;
                });
              }),
              buildNotificationSwitch('bookmarked', bookmarkedEnabled, (value) {
                setState(() {
                  bookmarkedEnabled = value;
                });
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildNotificationSwitch(String label, bool value, Function(bool) onChanged) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 18.0),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: Colors.green,
            inactiveThumbColor: Colors.red,
          ),
        ],
      ),
    );
  }
}
