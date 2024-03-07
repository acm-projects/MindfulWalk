// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationState();
}

class _LocationState extends State<LocationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.fromLTRB(16.0, 25, 16, 16),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/backArrow.png', width: 40, height: 40),
              SizedBox(height: 10),
              Expanded(
                  child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.asset(
                            'assets/walking-trail.jpg',
                            width: 340.0,
                            height: 240.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding:
                                const EdgeInsets.fromLTRB(5.0, 8, 16.0, 16.0),
                            child: Text(
                              'Location Name',
                              style: GoogleFonts.raleway(
                                textStyle: TextStyle(
                                  color: Color(0xFF406440),
                                  fontWeight: FontWeight.w800,
                                  fontSize: 40,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 500.0,
                          width: 340,
                          decoration: BoxDecoration(
                            color: Color(0xFFEDE9D7),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 16),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      16.0, 0, 16.0, 16.0),
                                  child: Text(
                                    'Description of the locations         Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed viverra augue ut justo fermentum, vel dapibus arcu fermentum. Integer a purus ut mauris consequat aliquet. Vivamus vehicula vestibulum odio, ut laoreet tortor vehicula sit amet. Quisque vel malesuada urna. Nulla facilisi.',
                                    style: GoogleFonts.jost(
                                      textStyle: TextStyle(
                                        color: Color(0xFF4B5563),
                                        fontWeight: FontWeight.normal,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 16),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width:
                                    MediaQuery.of(context).size.width / 2 - 20,
                                height: 60,
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Add your button click logic here
                                    print('Button pressed!');
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary:
                                        Color(0xFFADC178), // Background color
                                    onPrimary: Colors.white, // Text color
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          15.0), // Rounded corners
                                    ),
                                  ),
                                  child: Text(
                                    'Photos',
                                    style: GoogleFonts.jost(
                                      textStyle: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(0, 40, 8, 0),
                                  child: Text(
                                    'See more',
                                    style: GoogleFonts.jost(
                                      textStyle: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                      ),
                                    ),
                                  )),
                            ]),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image.asset('assets/walking-trail.jpg',
                                    width:
                                        MediaQuery.of(context).size.width / 2 -
                                            35,
                                    height: 130,
                                    fit: BoxFit.fill)),
                            SizedBox(width: 16),
                            ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image.asset('assets/walking-trail.jpg',
                                    width:
                                        MediaQuery.of(context).size.width / 2 -
                                            35,
                                    height: 130,
                                    fit: BoxFit.fill))
                          ],
                        ),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image.asset('assets/walking-trail.jpg',
                                    width:
                                        MediaQuery.of(context).size.width / 2 -
                                            35,
                                    height: 130,
                                    fit: BoxFit.fill)),
                            SizedBox(width: 16),
                            ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image.asset('assets/walking-trail.jpg',
                                    width:
                                        MediaQuery.of(context).size.width / 2 -
                                            35,
                                    height: 130,
                                    fit: BoxFit.fill))
                          ],
                        ),
                        SizedBox(height: 16),
                        Center(
                          child: Container(
                            width: double.infinity,
                            height: 60,
                            child: ElevatedButton(
                              onPressed: () {
                                // Add your button click logic here
                                print('Button pressed!');
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xFFFFA9A8), // Background color
                                onPrimary: Colors.white, // Text color
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      12.0), // Rounded corners
                                ),
                              ),
                              child: Text(
                                'Start Walk',
                                style: GoogleFonts.raleway(
                                  textStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]),
                ),
              ))
            ]),
      )),
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
                child: Image.asset('assets/homeSelected.png',
                    width: 45, height: 45),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.fromLTRB(0, 8, 30, 0),
                child: Image.asset('assets/diary.png', width: 50, height: 50),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 35, 0),
                child: Image.asset('assets/map.png', width: 50, height: 50),
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
      ),
    );
  }
}
