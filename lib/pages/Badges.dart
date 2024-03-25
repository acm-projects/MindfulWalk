// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mindfulwalk/main.dart';
import 'package:mindfulwalk/pages/MapPage.dart';

void main() {
  runApp(Badges());
}

class Badges extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.fromLTRB(16.0, 10, 16, 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Align(
                  alignment: Alignment.centerLeft,

                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Image.asset("assets/backArrow.png", width: 31, height: 31),
                    ),
                    /*ImageIcon(
                  AssetImage("assets/backArrow.png"),
                  color: Colors.black,
                  size: 31,
                ),*/
                  )

              ),

              Text(
                'Badges',
                style: GoogleFonts.raleway(
                  textStyle: TextStyle(
                    color: Color(0xFF406440),
                    fontWeight: FontWeight.w800,
                    fontSize: 36,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  //bottom: 8,
                  left: 32,
                  right: 16,
                ),

              ),
              SizedBox(height: 16.0),
              Expanded(
                child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        BadgeCard(Achievement: 'Achievement Name', Contents: 'Went to 3 different Places', BadgeImage: 'assets/3rdMedal.png'),
                        SizedBox(height: 16.0),
                        Container(
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
                                padding: const EdgeInsets.only(left: 1.0, top: 5.0),
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
                        SizedBox(height: 16.0),
                        Container(
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
                                padding: const EdgeInsets.only(left: 1.0, top: 5.0),
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
                        SizedBox(height: 16.0),
                        Container(
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
                                padding: const EdgeInsets.only(left: 1.0, top: 5.0),
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
                        SizedBox(height: 16.0),
                        Container(
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
                                padding: const EdgeInsets.only(left: 1.0, top: 5.0),
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
                                    'Parks and Preserves',
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
                        SizedBox(height: 16.0),
                        Container(
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
                                padding: const EdgeInsets.only(left: 1.0, top: 5.0),
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
                        SizedBox(height: 16.0),
                        Container(
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
                                padding: const EdgeInsets.only(left: 1.0, top: 5.0),
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
                                    'Street Restaurants',
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

class BadgeCard extends StatelessWidget {
  final String Achievement;
  final String Contents;
  final String BadgeImage;

  const BadgeCard({
    Key? key,
    required this.Achievement,
    required this.Contents,
    required this.BadgeImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      decoration: BoxDecoration(
        color: Color(0xFFEDE9D7),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //mainAxisAlignment: MainAxisAlignment.end,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(
                      16, 16, 16, 16),
                  child: Text(
                    Achievement,
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
              Align(
                //alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(
                      16.0, 8, 16.0, 16.0),
                  child: Text(
                    Contents,
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

          Padding(
            padding: const EdgeInsets.only(left: 1.0, top: 5.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset(
                BadgeImage,
                width: 47.0,
                height: 47.0,
                fit: BoxFit.cover,
              ),
            ),
          ),

        ],
      ),
    );
  }
}

