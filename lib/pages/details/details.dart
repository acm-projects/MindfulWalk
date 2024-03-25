import 'package:mindfulwalk/pages/details/widgets/stats.dart';
import 'package:mindfulwalk/pages/details/widgets/appbar.dart';
import 'package:mindfulwalk/pages/details/widgets/dates.dart';
import 'package:mindfulwalk/pages/details/widgets/graph.dart';
import 'package:mindfulwalk/pages/details/widgets/info.dart' hide Stats;
import 'package:mindfulwalk/pages/details/widgets/steps.dart';
//import 'package:mindfulwalk/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFEF6),

      //appBar: MainAppBar(appBar: AppBar()),

      body: Column(
        children:  <Widget>[
          Align(
            alignment: Alignment.centerLeft,

              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
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
            'Steps',
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

          Container(
              width: 400,
              height: 100,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Dates(),
              )

          ),








          Padding(
            padding: const EdgeInsets.only(
              bottom: 16,
              left: 16,
              right: 16,
            ),

          ),
          Container(
              width: 300,
              height: 250,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0),
                child: Graph(graphType: 'Weekly',key: UniqueKey()),
              )

          ),
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
          selectedItemColor: Colors.white, // we can change this if we want text under each icon
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Image.asset('assets/home.png', width: 45, height: 45),
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
                child: Image.asset('assets/mapSelected.png', width: 50, height: 50),
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
