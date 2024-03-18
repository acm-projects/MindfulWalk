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
      appBar: MainAppBar(appBar: AppBar()),
      body: Column(
        children:  [

          Text(
            /*String name = intent.getStringExtra("name");
                  //int number = Integer.valueOf(intent.getStringExtra("number"));

                  data.setText("Name is " + name );*/

            '  Walk',
            style: GoogleFonts.raleway(
              textStyle: TextStyle(
                color: Color(0xFF406440),
                fontWeight: FontWeight.w800,
                fontSize: 36,
              ),
            ),
          ),





          Dates(),

          Padding(
            padding: const EdgeInsets.only(
              bottom: 16,
              left: 16,
              right: 16,
            ),

          ),
          Graph(),
          Steps(),

          Info(),
          Divider(height: 30),
          //Stats(),
          SizedBox(height: 30),

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
