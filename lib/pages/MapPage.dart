// ignore_for_file: prefer_const_constructors

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  bool isSearchClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      FlutterMap(
        options: const MapOptions(
          initialCenter: LatLng(32.9857, -96.7502),
          initialZoom: 15.2,
        ),
        children: [
          TileLayer(
            urlTemplate:
                'https://api.mapbox.com/styles/v1/vms0/cltc3lkvf00na01p3gkf2giw3/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoidm1zMCIsImEiOiJjbHQxczJmaGIxYmJqMmpxcGNyaHJtaGZ0In0.LeujRRoDmVsBEwTfK4hTOg',
            userAgentPackageName: 'com.example.app',
          ),
        ],
      ),
      Positioned(
          top: 30,
          left: 20,
          child: GestureDetector(
              onTap: () {
                setState(() {
                  if (isSearchClicked = true) {
                    isSearchClicked = false;
                  }
                });
              },
              child:
                  Image.asset('assets/backArrow.png', width: 40, height: 40))),
      // Positioned(top: 150, left: 20, right: 20, child: Directions()),
      Positioned(
        top: isSearchClicked ? 550 : 650,
        left: 20,
        right: 20,
        child: isSearchClicked
            ? Directions()
            : Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                decoration: BoxDecoration(
                  color: Color(0xFFFFA9A8), // Set the background color
                  borderRadius:
                      BorderRadius.circular(15.0), // Add curved corners
                ),
                child: Column(children: [
                  TextField(
                      decoration: InputDecoration(
                    hintText: 'Search Location',
                    hintStyle: GoogleFonts.jost(
                      textStyle: TextStyle(
                        color: Color(0xFF5B8C5A).withOpacity(0.5),
                        fontSize: 24,
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 6.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    prefix: SizedBox(width: 20),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.search,
                          color: Color(0xFF406440), size: 35),
                      onPressed: () {
                        setState(() {
                          isSearchClicked = true;
                        });
                      },
                    ),
                  )),
                  SizedBox(height: 12),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                        width: double.infinity,
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                        decoration: BoxDecoration(
                          color: Color(0xFFADC178), // Set the background color
                          borderRadius:
                              BorderRadius.circular(15.0), // Add curved corners
                        ),
                        child: Row(children: [
                          Text(
                            'Use my location',
                            style: GoogleFonts.jost(
                              textStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 24,
                              ),
                            ),
                          ),
                          Spacer(),
                          Image.asset('assets/myLocationIcon.png',
                              height: 35, width: 35)
                        ])),
                  ),
                ]),
              ),
      )
    ]));
  }
}

class Directions extends StatefulWidget {
  const Directions({super.key});

  @override
  State<Directions> createState() => _DirectionsState();
}

class _DirectionsState extends State<Directions> {
  bool continueClicked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: continueClicked
          ? ETA()
          : Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(
                color: Color(0xFFADC178), // Set the background color
                borderRadius: BorderRadius.circular(15.0), // Add curved corners
              ),
              child: Column(
                children: [
                  Container(
                      width: double.infinity,
                      height: 180,
                      padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                      decoration: BoxDecoration(
                        color: Color(0xFFEDE9D7), // Set the background color
                        borderRadius:
                            BorderRadius.circular(15.0), // Add curved corners
                      ),
                      child: Column(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image.asset('assets/urban-ventures.jpg',
                                  height: 115, width: 400, fit: BoxFit.fill)),
                          SizedBox(height: 8),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Legacy West',
                              style: GoogleFonts.jost(
                                textStyle: TextStyle(
                                  color: Color(0xFF5B8C5A),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                  SizedBox(height: 16),
                  Row(children: [
                    Text(
                      'Continue?',
                      style: GoogleFonts.jost(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            continueClicked = true;
                          });
                        },
                        child: Image.asset('assets/walkingMan.png',
                            height: 35, width: 35))
                  ])
                ],
              )),
    );
  }
}

class ETA extends StatefulWidget {
  const ETA({super.key});

  @override
  State<ETA> createState() => _ETAState();
}

class _ETAState extends State<ETA> {
  bool startWalkClicked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: startWalkClicked
          ? mindfulGoal()
          : Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(
                color: Color(0xFFADC178), // Set the background color
                borderRadius: BorderRadius.circular(15.0), // Add curved corners
              ),
              child: Column(
                children: [
                  Container(
                      width: double.infinity,
                      height: 180,
                      padding: EdgeInsets.fromLTRB(8, 10, 8, 10),
                      decoration: BoxDecoration(
                        color: Color(0xFFEDE9D7), // Set the background color
                        borderRadius:
                            BorderRadius.circular(15.0), // Add curved corners
                      ),
                      child: ETAinfo()),
                  SizedBox(height: 16),
                  Row(children: [
                    Text(
                      'Start Walk?',
                      style: GoogleFonts.jost(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            startWalkClicked = true;
                          });
                        },
                        child: Image.asset('assets/walkingMan.png',
                            height: 35, width: 35))
                  ])
                ],
              )),
    );
  }
}

class ETAinfo extends StatefulWidget {
  const ETAinfo({super.key});

  @override
  State<ETAinfo> createState() => _ETAinfoState();
}

class _ETAinfoState extends State<ETAinfo> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 100,
          height: 200,
          padding: EdgeInsets.fromLTRB(5, 16, 5, 10),
          decoration: BoxDecoration(
              color: Color(0xFFEDE9D7), // Set the background color
              borderRadius: BorderRadius.circular(30.0),
              border: Border.all(
                  color: Color(0xFFADC178), width: 5) // Add curved corners
              ),
          child: Column(children: [
            Image.asset('assets/ETA.png', width: 70, height: 70),
            SizedBox(height: 8),
            Text(
              '7:30 PM',
              style: GoogleFonts.jost(
                textStyle: TextStyle(
                  color: Color(0xFF8B6B55),
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            ),
            Text(
              'ETA',
              style: GoogleFonts.jost(
                textStyle: TextStyle(
                  color: Color(0xFF7B9E87),
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ]),
        ),
        Spacer(),
        Container(
          width: 100,
          height: 200,
          padding: EdgeInsets.fromLTRB(5, 16, 5, 10),
          decoration: BoxDecoration(
              color: Color(0xFFEDE9D7), // Set the background color
              borderRadius: BorderRadius.circular(30.0),
              border: Border.all(
                  color: Color(0xFFADC178), width: 5) // Add curved corners
              ),
          child: Column(children: [
            Image.asset('assets/milesRemaining.png', width: 70, height: 70),
            SizedBox(height: 8),
            Text(
              '1.1 Mi',
              style: GoogleFonts.jost(
                textStyle: TextStyle(
                  color: Color(0xFF8B6B55),
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            ),
            Text(
              'distance',
              style: GoogleFonts.jost(
                textStyle: TextStyle(
                  color: Color(0xFF7B9E87),
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ]),
        ),
        Spacer(),
        Container(
          width: 100,
          height: 200,
          padding: EdgeInsets.fromLTRB(5, 16, 5, 10),
          decoration: BoxDecoration(
              color: Color(0xFFEDE9D7), // Set the background color
              borderRadius: BorderRadius.circular(30.0),
              border: Border.all(
                  color: Color(0xFFADC178), width: 5) // Add curved corners
              ),
          child: Column(children: [
            Image.asset('assets/minutesLeft.png', width: 70, height: 70),
            SizedBox(height: 8),
            Text(
              '20 min',
              style: GoogleFonts.jost(
                textStyle: TextStyle(
                  color: Color(0xFF8B6B55),
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            ),
            Text(
              'away',
              style: GoogleFonts.jost(
                textStyle: TextStyle(
                  color: Color(0xFF7B9E87),
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ]),
        ),
      ],
    );
  }
}

class mindfulGoal extends StatefulWidget {
  const mindfulGoal({super.key});

  @override
  State<mindfulGoal> createState() => _mindfulGoalState();
}

class _mindfulGoalState extends State<mindfulGoal> {
  bool navigationStarted = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: navigationStarted
          ? showArrow()
          : Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(
                color: Color(0xFFADC178), // Set the background color
                borderRadius: BorderRadius.circular(15.0), // Add curved corners
              ),
              child: Column(
                children: [
                  Container(
                      width: double.infinity,
                      height: 180,
                      padding: EdgeInsets.fromLTRB(8, 10, 8, 10),
                      decoration: BoxDecoration(
                        color: Color(0xFFEDE9D7), // Set the background color
                        borderRadius:
                            BorderRadius.circular(15.0), // Add curved corners
                      ),
                      child: Container(
                        width: 300,
                        height: 200,
                        padding: EdgeInsets.fromLTRB(25, 16, 5, 10),
                        decoration: BoxDecoration(
                            color:
                                Color(0xFFFFFFFF), // Set the background color
                            borderRadius: BorderRadius.circular(30.0),
                            border: Border.all(
                                color: Color(0xFFADC178),
                                width: 5) // Add curved corners
                            ),
                        child: Center(
                          child: Text(
                            'Be mindful of your breathing during your walk.',
                            style: GoogleFonts.jost(
                              textStyle: TextStyle(
                                color: Color(0xFF8B6B55),
                                fontWeight: FontWeight.w600,
                                fontSize: 24,
                              ),
                            ),
                          ),
                        ),
                      )),
                  SizedBox(height: 16),
                  Row(children: [
                    Text(
                      'Begin Navigation?',
                      style: GoogleFonts.jost(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            navigationStarted = true;
                          });
                        },
                        child: Image.asset('assets/walkingMan.png',
                            height: 35, width: 35))
                  ])
                ],
              )),
    );
  }
}

class showArrow extends StatefulWidget {
  const showArrow({super.key});

  @override
  State<showArrow> createState() => _showArrowState();
}

class _showArrowState extends State<showArrow> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Transform.translate(
        offset: Offset(0, -131),
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              color: Color(0xFFADC178), // Set the background color
              borderRadius: BorderRadius.circular(15.0), // Add curved corners
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Image.asset('assets/dropDownArrow.png',
                      height: 30, width: 30),
                ),
                SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  height: 45,
                  padding: EdgeInsets.fromLTRB(18, 10, 16, 10),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF), // Set the background color
                    borderRadius:
                        BorderRadius.circular(30.0), // Add curved corners
                  ),
                  child: Row(children: [
                    Text(
                      'Pause Walk',
                      style: GoogleFonts.jost(
                        textStyle: TextStyle(
                          color: Color(0xFF8B6B55),
                          fontWeight: FontWeight.normal,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Spacer(),
                    Image.asset('assets/pause.png')
                  ]),
                ),
                SizedBox(height: 16),
                Container(
                    width: double.infinity,
                    height: 180,
                    padding: EdgeInsets.fromLTRB(8, 10, 8, 10),
                    decoration: BoxDecoration(
                      color: Color(0xFFEDE9D7), // Set the background color
                      borderRadius:
                          BorderRadius.circular(15.0), // Add curved corners
                    ),
                    child: Container(
                      width: 300,
                      height: 200,
                      padding: EdgeInsets.fromLTRB(25, 16, 5, 10),
                      decoration: BoxDecoration(
                          color: Color(0xFFFFFFFF), // Set the background color
                          borderRadius: BorderRadius.circular(30.0),
                          border: Border.all(
                              color: Color(0xFFADC178),
                              width: 5) // Add curved corners
                          ),
                      child: Center(
                        child: Text(
                          'Be mindful of your breathing during your walk.',
                          style: GoogleFonts.jost(
                            textStyle: TextStyle(
                              color: Color(0xFF8B6B55),
                              fontWeight: FontWeight.w600,
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ),
                    )),
                SizedBox(height: 16),
                Row(children: [
                  Text(
                    'Begin Navisdfgation?',
                    style: GoogleFonts.jost(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  Spacer(),
                  Image.asset('assets/walkingMan.png', height: 35, width: 35)
                ])
              ],
            )),
      ),
    );
  }
}
