import 'package:flutter/material.dart';
import 'package:mindfulwalk/pages/BottomNavBar.dart';

class Notifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/BackgroundImage.png"),
              fit: BoxFit.cover)),
      child: Scaffold(
        bottomNavigationBar: BottomNavBar(),
        appBar: AppBar(
          leading: IconButton(
            icon: Image.asset('assets/backArrow.png'),
            onPressed: null, // Disabling the back button
          ),
          title: Text('\nNotifications',
              style: TextStyle(
                  color: const Color(0xff406440),
                  fontWeight: FontWeight.bold,
                  fontSize: 25)),
          centerTitle: false,
          backgroundColor: Colors.transparent,
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: NotificationsPage(),
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
          border: Border.all(
            width: 0,
            color: Color(0xFFEDE9D7),
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          color: Color(0xFFEDE9D7),
        ),
        //color: Color(0xFFEDE9D7),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height:
                    1.0, // Adjust the height to move the "Notifications" text up
              ),
              Text(
                'Allow Notifications',
                style: TextStyle(
                  fontSize: 20,
                  color: const Color(0xff8B6B55),
                ),
              ),
              SizedBox(height: 20.0),
              buildNotificationSwitch('daily reminders', dailyRemindersEnabled,
                  (value) {
                setState(() {
                  dailyRemindersEnabled = value;
                });
              }),
              buildNotificationSwitch('quote of the day', quoteOfTheDayEnabled,
                  (value) {
                setState(() {
                  quoteOfTheDayEnabled = value;
                });
              }),
              buildNotificationSwitch('while walking', whileWalkingEnabled,
                  (value) {
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

  Widget buildNotificationSwitch(
      String label, bool value, Function(bool) onChanged) {
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
