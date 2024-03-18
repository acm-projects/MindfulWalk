// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mindfulwalk/pages/meal.dart';

void main() {
  runApp(Hi_name());
}

class Hi_name extends StatelessWidget {
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
  //final double height;
  //const _MyHomePageState(this.height) : super(key);
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    }); //setState()
  }// _incrementCounter()

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xffFFFEF6),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: [
                  Text(
                  /*String name = intent.getStringExtra("name");
                  //int number = Integer.valueOf(intent.getStringExtra("number"));

                  data.setText("Name is " + name );*/

                  'Hi Sojung! ',
                  style: GoogleFonts.raleway(
                    textStyle: TextStyle(
                      color: Color(0xFF406440),
                      fontWeight: FontWeight.w800,
                      fontSize: 36,
                    ),
                  ),
                ),
                  Image.asset('assets/waving-hand.png')
              ] // children
              ),

              SizedBox(height: 12.0),

              /*Text(
                /*String name = intent.getStringExtra("name");
                  //int number = Integer.valueOf(intent.getStringExtra("number"));

                  data.setText("Name is " + name );*/

                'Your Record',
                style: GoogleFonts.raleway(
                  textStyle: TextStyle(
                    color: Color(0xFF4B5563),
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                  ),
                ),
              ),*/


              Padding(
                padding: const EdgeInsets.only(
                  bottom: 8,
                  left: 16,
                  right: 16,
                ),
                child: Text(
                  "Where To Next?",
                  style: const TextStyle(color: Color(0xFF4B5563), fontSize: 24, fontWeight: FontWeight.w500),
                ),
              ),
              Expanded(
                //height: height*0.6,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 16,
                      ),
                      for (int i = 0; i < locations.length; i++)
                        _MealCard(
                          location: locations[i],
                        ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 12.0),



              Padding(
                padding: const EdgeInsets.only(
                  bottom: 8,
                  left: 16,
                  right: 16,
                ),
                child: Text(
                  "Your Record",
                  style: const TextStyle(color: Color(0xFF4B5563), fontSize: 24, fontWeight: FontWeight.w500),
                ),
              ),
              Expanded(
                //height: height*0.6,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 16,
                      ),
                      for (int i = 0; i < locations.length; i++)
                        _MealCard(
                          location: locations[i],
                        ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(
                  bottom: 8,
                  left: 16,
                  right: 16,
                )
              ),



              Container(
                padding: const EdgeInsets.only(
                  bottom: 8,
                  left: 16,
                  right: 16,
                ),
                width: 380,
                height: 180,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    SizedBox(
                      width: 380,
                      height: 30,
                      child: Text(
                        'Quote of the day:',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF7B9E87),
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Jost',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ),
                    Container(
                      width: 380,
                      height: 70,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 3, color: Color(0xFFADC178)),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            left: 20,
                            top: 16,
                            child: SizedBox(
                              width: 300,
                              child: Text(
                                'Insert a random mindful mindful quote for the day ',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF8B6B55),
                                  fontSize: 16,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              ),
                            ),
                          ),



                        ],
                      ),
                    ),


                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 8,
                        left: 16,
                        right: 16,
                      ),

                    ),

                    Container(//level box
                      width: 326,
                      height: 62,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 224,
                            top: 48,
                            child: Text(
                              'Goal 10,000',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Color(0xFF867676),
                                fontSize: 12,
                                fontFamily: 'SF Pro Display',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            top: 48,
                            child: Text(
                              '8,312 steps done',
                              style: TextStyle(
                                color: Color(0xFF867676),
                                fontSize: 12,
                                fontFamily: 'SF Pro Display',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            top: 29,
                            child: Container(
                              width: 315,
                              height: 11,
                              decoration: ShapeDecoration(
                                color: Color(0xFFD8D1C2),
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 4,
                                    strokeAlign: BorderSide.strokeAlignOutside,
                                    color: Colors.white.withOpacity(0.20000000298023224),
                                  ),
                                  borderRadius: BorderRadius.circular(32),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            top: 29,
                            child: Container(
                              width: 214,
                              height: 11,
                              decoration: ShapeDecoration(
                                color: Color(0xFF23B774),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 283,
                            top: 12,
                            child: Container(
                              width: 43,
                              height: 43,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Container(
                                      width: 43,
                                      height: 43,
                                      decoration: ShapeDecoration(
                                        color: Color(0xFFFDFBF7),
                                        shape: OvalBorder(
                                          side: BorderSide(width: 1, color: Color(0xFFFFC600)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 9,
                                    top: 10,
                                    child: Container(
                                      width: 25,
                                      height: 22,
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            left: 0,
                                            top: 0,
                                            child: Container(
                                              width: 25,
                                              height: 22,
                                              child: Stack(
                                                children: [
                                                  Positioned(
                                                    left: 5.18,
                                                    top: 0.98,
                                                    child: Container(
                                                      width: 14.98,
                                                      height: 21.02,
                                                      decoration: BoxDecoration(color: Color(0xFF5B8C5A)),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    left: 5.18,
                                                    top: 1.69,
                                                    child: Container(
                                                      width: 14.98,
                                                      height: 1.78,
                                                      decoration: BoxDecoration(color: Color(0xFFADC178)),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    left: 5.18,
                                                    top: 19.51,
                                                    child: Container(
                                                      width: 14.98,
                                                      height: 1.78,
                                                      decoration: BoxDecoration(color: Color(0xFFADC178)),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    left: 5.18,
                                                    top: 15.23,
                                                    child: Container(
                                                      width: 14.98,
                                                      height: 1.78,
                                                      decoration: BoxDecoration(color: Color(0xFFADC178)),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    left: 5.18,
                                                    top: 5.68,
                                                    child: Container(
                                                      width: 14.98,
                                                      height: 1.78,
                                                      decoration: BoxDecoration(color: Color(0xFFADC178)),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    left: 0.65,
                                                    top: 0.98,
                                                    child: Container(
                                                      width: 4.18,
                                                      height: 11.04,
                                                      decoration: BoxDecoration(color: Color(0xFFD28800)),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    left: 2.05,
                                                    top: 11.67,
                                                    child: Container(
                                                      width: 2.79,
                                                      height: 9.26,
                                                      decoration: BoxDecoration(color: Color(0xFFD28800)),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    left: 20.17,
                                                    top: 0.98,
                                                    child: Container(
                                                      width: 4.18,
                                                      height: 11.04,
                                                      decoration: BoxDecoration(color: Color(0xFFD28800)),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    left: 20.17,
                                                    top: 11.67,
                                                    child: Container(
                                                      width: 2.79,
                                                      height: 9.26,
                                                      decoration: BoxDecoration(color: Color(0xFFD28800)),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    left: 4.83,
                                                    top: 10.60,
                                                    child: Container(
                                                      width: 15.33,
                                                      height: 2.14,
                                                      decoration: BoxDecoration(color: Color(0xFFFBB502)),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    left: -5.27,
                                                    top: -6.86,
                                                    child: Container(
                                                      width: 11.50,
                                                      height: 37.41,
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                          image: NetworkImage("https://via.placeholder.com/11x37"),
                                                          fit: BoxFit.fill,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    left: 19.12,
                                                    top: -6.86,
                                                    child: Container(
                                                      width: 11.85,
                                                      height: 37.41,
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                          image: NetworkImage("https://via.placeholder.com/12x37"),
                                                          fit: BoxFit.fill,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            left: 9.02,
                                            top: 8.11,
                                            child: Container(
                                              width: 6.97,
                                              height: 7.48,
                                              decoration: ShapeDecoration(
                                                color: Color(0xFFFBCF04),
                                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 38,
                            top: -1,
                            child: SizedBox(
                              width: 250,
                              height: 44.24,
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Level',
                                      style: TextStyle(
                                        color: Color(0xFF7B9E87),
                                        fontSize: 18,
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.w700,
                                        height: 0,
                                      ),
                                    ),
                                    TextSpan(
                                      text: ' 5',
                                      style: TextStyle(
                                        color: Color(0xFF7B9E87),
                                        fontSize: 18,
                                        fontFamily: 'Jost',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )



                  ],
                ),
              ),








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



class _MealCard extends StatelessWidget {
  final Location location;

  const _MealCard({ Key? key, required this.location}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      margin: const EdgeInsets.only(
        right: 20,
        bottom: 10,
      ),
      child: Material(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[

            Flexible(
              flex:3,
              fit: FlexFit.tight,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                child: Image.asset(
                  location.imagePath,
                  width: 200,
                  //height: 200,
                  fit: BoxFit.fill,
                ),
              ),



              /*child: OpenContainer(
                closedShape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                transitionDuration: const Duration(milliseconds: 1000),
                openBuilder: (context, _) {
                  return MealDetailScreen(
                    location: location,
                  );
                },
                closedBuilder: (context, openContainer) {
                  return GestureDetector(
                    onTap: openContainer,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      child: Image.asset(
                        location.imagePath,
                        width: 150,
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                },
              ),*/
            ),

            Flexible(
              flex:2,


              fit: FlexFit.tight,
              child: Padding(

                padding: const EdgeInsets.only(left: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(height: 5),
                    /*Text(
                      location.category,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.blueGrey,
                      ),
                    ),*/
                    Text(
                      location.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    /*Text(
                      "${location.kiloCaloriesBurnt} kcal",
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.blueGrey,
                      ),
                    ),*/
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.access_time,
                          size: 15,
                          color: Colors.black12,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          "${location.timeTaken} min",
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Colors.blueGrey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );







  }
}
