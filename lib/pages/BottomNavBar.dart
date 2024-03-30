import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mindfulwalk/main.dart';
import 'package:mindfulwalk/pages/LocationPage.dart';
import 'package:mindfulwalk/pages/MapPage.dart';
import 'package:mindfulwalk/pages/PhotosPage.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Color(0xFFFFA9A8),
      ),
      child: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor:
            Colors.white, // we can change this if we want text under each icon
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: GestureDetector(
                  onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MapPage()),
                      ),
                  child: Image.asset('assets/homeSelected.png',
                      width: 45, height: 45)),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.fromLTRB(0, 8, 30, 0),
              child: GestureDetector(
                  onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PhotosPage()),
                      ),
                  child: Image.asset('assets/photoIcon.png',
                      width: 50, height: 50)),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 35, 0),
              child: GestureDetector(
                  onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MapPage()),
                      ),
                  child: Image.asset('assets/map.png', width: 50, height: 50)),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.fromLTRB(0, 5, 30, 0),
              child: Image.asset('assets/health.png', width: 50, height: 50),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 30, 0),
              child: Image.asset('assets/profile.png', width: 40, height: 40),
            ),
            label: '',
          ),
        ],
        onTap: (index) {
          // Handle button tap
        },
      ),
    );
  }
}
