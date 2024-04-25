// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mindfulwalk/pages/BottomNavBar.dart';
import 'package:mindfulwalk/pages/Health.dart';
import 'package:mindfulwalk/pages/HiName.dart';
import 'package:mindfulwalk/pages/IndoorOasis.dart';
import 'package:mindfulwalk/pages/LakesideStrolls.dart';
import 'package:mindfulwalk/pages/LocationPage.dart';
import 'package:mindfulwalk/pages/MapPage.dart';
import 'package:mindfulwalk/pages/PhotoGallery.dart';
import 'package:mindfulwalk/pages/PhotosPage.dart';
import 'package:mindfulwalk/pages/ProfilePage.dart';
import 'package:mindfulwalk/pages/UrbanVentures.dart';
import 'package:mindfulwalk/pages/WalkingTrails.dart';

void main() {
  runApp(Explore());
}

String getSearchText() {
  // Your logic to generate the search text string
  return "Search for 5 walking trails in chicago"; // Replace with your logic
}

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  final TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.fromLTRB(16.0, 25, 16, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset('assets/backArrow.png',
                      width: 40, height: 40)),
              Text(
                'Explore',
                style: GoogleFonts.raleway(
                  textStyle: TextStyle(
                    color: Color(0xFF406440),
                    fontWeight: FontWeight.w800,
                    fontSize: 45,
                  ),
                ),
              ),
              Text(
                'Enter a place or location to begin:',
                style: GoogleFonts.raleway(
                  textStyle: TextStyle(
                    color: Color(0xFF406440),
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              SizedBox(height: 12.0),
              TextField(
                controller: _textFieldController,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    prefix: SizedBox(width: 20),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        String searchText = _textFieldController.text;
                        print("Searchtext: ${searchText}");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                LocationPage(searchText: searchText),
                          ),
                        );
                      },
                      child: Icon(Icons.search,
                          color: Color(0xFF406440), size: 35),
                    )),
                onSubmitted: (String value) {
                  String searchText = _textFieldController.text;
                  print("Searchtext: ${searchText}");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          LocationPage(searchText: searchText),
                    ),
                  );
                },
              ),
              SizedBox(height: 16.0),
              Expanded(
                child: SingleChildScrollView(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WalkingTrails()),
                      ),
                      child: Container(
                        height: 200.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFEDE9D7),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 1.0, top: 5.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image.asset(
                                  'assets/walking-trail.jpg',
                                  width: 340.0,
                                  height: 120.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    16.0, 8, 16.0, 16.0),
                                child: Text(
                                  'Walking Trails',
                                  style: GoogleFonts.raleway(
                                    textStyle: TextStyle(
                                      color: Color(0xFF4B5563),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LakesideStrolls()),
                      ),
                      child: Container(
                        height: 200.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFEDE9D7),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 1.0, top: 5.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image.asset(
                                  'assets/lakeside-stroll.jpg',
                                  width: 340.0,
                                  height: 120.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    16.0, 8, 16.0, 16.0),
                                child: Text(
                                  'Lakeside Strolls',
                                  style: GoogleFonts.raleway(
                                    textStyle: TextStyle(
                                      color: Color(0xFF4B5563),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UrbanVentures()),
                      ),
                      child: Container(
                        height: 200.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFEDE9D7),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 1.0, top: 5.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image.asset(
                                  'assets/urban-ventures.jpg',
                                  width: 340.0,
                                  height: 120.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    16.0, 8, 16.0, 16.0),
                                child: Text(
                                  'Urban Ventures',
                                  style: GoogleFonts.raleway(
                                    textStyle: TextStyle(
                                      color: Color(0xFF4B5563),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => IndoorOasis()),
                      ),
                      child: Container(
                        height: 200.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFEDE9D7),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 1.0, top: 5.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image.asset(
                                  'assets/indoor-oasis.jpg',
                                  width: 340.0,
                                  height: 120.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    16.0, 8, 16.0, 16.0),
                                child: Text(
                                  'Indoor Oasis',
                                  style: GoogleFonts.raleway(
                                    textStyle: TextStyle(
                                      color: Color(0xFF4B5563),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                  ],
                )),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Color(0xFFFFA9A8),
        ),
        child: BottomNavigationBar(
          currentIndex: 0,
          selectedItemColor: Colors
              .white, // we can change this if we want text under each icon
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: GestureDetector(
                    onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HiName()),
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
                          MaterialPageRoute(
                              builder: (context) => PhotoGallery()),
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
                    child:
                        Image.asset('assets/map.png', width: 50, height: 50)),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.fromLTRB(0, 5, 30, 0),
                child: GestureDetector(
                    onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Health()),
                        ),
                    child: Image.asset('assets/health.png',
                        width: 50, height: 50)),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 30, 0),
                child: GestureDetector(
                    onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfilePage()),
                        ),
                    child: Image.asset('assets/profile.png',
                        width: 40, height: 40)),
              ),
              label: '',
            ),
          ],
          onTap: (index) {
            // Handle button tap
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textFieldController.dispose();
    super.dispose();
  }
}
