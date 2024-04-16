import 'package:mindfulwalk/pages/MapPage.dart';
import 'package:mindfulwalk/pages/PhotosPage.dart';
import 'package:mindfulwalk/pages/ProfilePage.dart';
import 'package:mindfulwalk/pages/healthWidgets/stats.dart';
import 'package:mindfulwalk/pages/healthWidgets/appbar.dart';
import 'package:mindfulwalk/pages/healthWidgets/dates.dart';
import 'package:mindfulwalk/pages/healthWidgets/graph.dart';
import 'package:mindfulwalk/pages/healthWidgets/info.dart' hide Stats;
import 'package:mindfulwalk/pages/healthWidgets/steps.dart';
//import 'package:mindfulwalk/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

int date = 0;

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFEF6),

      //appBar: MainAppBar(appBar: AppBar()),

      body: Column(
        children: <Widget>[
          Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Padding(
                  padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
                  child: Image.asset("assets/backArrow.png",
                      width: 31, height: 31),
                ),
              )),

          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Text(
                'Steps',
                style: GoogleFonts.raleway(
                  textStyle: TextStyle(
                    color: Color(0xFF406440),
                    fontWeight: FontWeight.w800,
                    fontSize: 36,
                  ),
                ),
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

          Container(
              width: 400,
              height: 100,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Dates(),
              )),

          Padding(
            padding: const EdgeInsets.only(
              bottom: 0,
              left: 16,
              right: 16,
            ),
          ),
          Container(
              width: 300,
              height: 250,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0),
                child: Graph(graphType: 'Daily', key: UniqueKey()),
              )),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 25,
              left: 32,
              right: 16,
            ),
          ),

          Info(),
          Divider(height: 16),
          //Stats(),
          Steps(),

          //BottomNavigation(),
        ],
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
                          MaterialPageRoute(builder: (context) => MapPage()),
                        ),
                    child:
                        Image.asset('assets/home.png', width: 45, height: 45)),
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
                    child:
                        Image.asset('assets/map.png', width: 50, height: 50)),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.fromLTRB(0, 5, 30, 0),
                child: Image.asset('assets/healthSelected.png',
                    width: 50, height: 50),
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
}
