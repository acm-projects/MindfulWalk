// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:mindfulwalk/pages/details/widgets/graph.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mindfulwalk/pages/meal.dart';

void main() {
  runApp(Health());
}

class Health extends StatelessWidget {
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
          //padding: EdgeInsets.all(16.0),
          padding: EdgeInsets.fromLTRB(16.0, 25, 16, 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,



            children: <Widget>[
              Image.asset('assets/backArrow.png', width: 40, height: 40),

              Row(
                  children: [

                    Text(
                      /*String name = intent.getStringExtra("name");
                  //int number = Integer.valueOf(intent.getStringExtra("number"));

                  data.setText("Name is " + name );*/

                      '  Health',
                      style: GoogleFonts.raleway(
                        textStyle: TextStyle(
                          color: Color(0xFF406440),
                          fontWeight: FontWeight.w800,
                          fontSize: 36,
                        ),
                      ),
                    )
                  ] // children
              ),

              //SizedBox(height: 12.0),

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
                  left: 32,
                  right: 16,
                ),

              ),

              Container(
                width: 352.33,
                height: 206.76,
                child: Stack(
                  children: [
                    Positioned(
                      left: 135,
                      top: 37,
                      child: Opacity(
                        opacity: 0.90,
                        child: Container(
                          width: 217.33,
                          height: 167.04,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 55.32,
                                top: 27,
                                child: SizedBox(
                                  width: 78.94,
                                  height: 30.77,
                                  child: Text(
                                    '24.9',
                                    style: TextStyle(
                                      color: Color(0xFF253659),
                                      fontSize: 24,
                                      fontFamily: 'Mulish',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 15.32,
                                top: 33,
                                child: SizedBox(
                                  width: 123.51,
                                  height: 18.92,
                                  child: Text(
                                    'BMI',
                                    style: TextStyle(
                                      color: Color(0xFF253659),
                                      fontSize: 16,
                                      fontFamily: 'Mulish',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 126.32,
                                top: 24,
                                child: Container(
                                  width: 80.08,
                                  height: 32.97,
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                                  decoration: ShapeDecoration(
                                    color: Color(0xFFD5FFDD),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 49,
                                        height: 9,
                                        child: Text(
                                          'Healthy',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontFamily: 'Mulish',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 20.65,
                                top: 79.13,
                                child: Container(
                                  width: 189.70,
                                  height: 55.44,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: -0,
                                        top: 32.97,
                                        child: SizedBox(
                                          width: 19.45,
                                          height: 13.19,
                                          child: Text(
                                            '15',
                                            style: TextStyle(
                                              color: Color(0xFF253659),
                                              fontSize: 12,
                                              fontFamily: 'Mulish',
                                              fontWeight: FontWeight.w700,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 40.06,
                                        top: 32.24,
                                        child: SizedBox(
                                          width: 38.85,
                                          height: 13.92,
                                          child: Text(
                                            '18.5',
                                            style: TextStyle(
                                              color: Color(0xFF253659),
                                              fontSize: 12,
                                              fontFamily: 'Mulish',
                                              fontWeight: FontWeight.w700,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 86.19,
                                        top: 32.24,
                                        child: SizedBox(
                                          width: 26.71,
                                          height: 23.20,
                                          child: Text(
                                            '25',
                                            style: TextStyle(
                                              color: Color(0xFF253659),
                                              fontSize: 12,
                                              fontFamily: 'Mulish',
                                              fontWeight: FontWeight.w700,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 124.70,
                                        top: 32.97,
                                        child: SizedBox(
                                          width: 24.03,
                                          height: 13.19,
                                          child: Text(
                                            '30',
                                            style: TextStyle(
                                              color: Color(0xFF253659),
                                              fontSize: 12,
                                              fontFamily: 'Mulish',
                                              fontWeight: FontWeight.w700,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 165.68,
                                        top: 32.97,
                                        child: SizedBox(
                                          width: 24.03,
                                          height: 13.19,
                                          child: Text(
                                            '40',
                                            style: TextStyle(
                                              color: Color(0xFF253659),
                                              fontSize: 12,
                                              fontFamily: 'Mulish',
                                              fontWeight: FontWeight.w700,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: -0,
                                        top: 11.35,
                                        child: Container(
                                          width: 177.59,
                                          height: 13.24,
                                          decoration: ShapeDecoration(
                                            gradient: LinearGradient(
                                              begin: Alignment(1.00, 0.00),
                                              end: Alignment(-1, 0),
                                              colors: [Color(0xFFB4D4F1), Color(0xFF81E5DA), Color(0xFFE7D284), Color(0xFFE2788E)],
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(21),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 78.93,
                                        top: -0,
                                        child: Container(
                                          width: 4.38,
                                          height: 5.68,
                                          decoration: ShapeDecoration(
                                            color: Color(0xFFD16564),
                                            shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                width: 1,
                                                strokeAlign: BorderSide.strokeAlignOutside,
                                                color: Color(0xFF262729),
                                              ),
                                              borderRadius: BorderRadius.circular(19),
                                            ),
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
                    ),
                    Positioned(
                      left: 0,
                      top: 37,
                      child: Container(
                        width: 123,
                        height: 82.38,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                width: 123,
                                height: 82.38,
                                decoration: ShapeDecoration(
                                  color: Color(0xFFECEAD5),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 22.71,
                              top: 8.01,
                              child: SizedBox(
                                width: 92.65,
                                height: 16.71,
                                child: Text(
                                  'Height',
                                  style: TextStyle(
                                    color: Color(0xFF253659),
                                    fontSize: 12,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 40,
                              top: 57,
                              child: SizedBox(
                                width: 48,
                                height: 13,
                                child: Text(
                                  '170 cm',
                                  style: TextStyle(
                                    color: Color(0xFF253659),
                                    fontSize: 12,
                                    fontFamily: 'Mulish',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 30.35,
                              top: 32.27,
                              child: Container(
                                width: 64.46,
                                height: 22.10,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: Container(
                                        width: 1.31,
                                        height: 10.05,
                                        decoration: ShapeDecoration(
                                          color: Color(0x47282828),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(25),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 7.89,
                                      top: 0,
                                      child: Container(
                                        width: 1.31,
                                        height: 10.05,
                                        decoration: ShapeDecoration(
                                          color: Color(0x66282828),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(25),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 15.79,
                                      top: 0,
                                      child: Container(
                                        width: 1.31,
                                        height: 10.05,
                                        decoration: ShapeDecoration(
                                          color: Color(0xB2282828),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(25),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 23.68,
                                      top: 0,
                                      child: Container(
                                        width: 1.31,
                                        height: 22.10,
                                        decoration: ShapeDecoration(
                                          color: Color(0xFFD16564),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(25),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 31.57,
                                      top: 0,
                                      child: Container(
                                        width: 1.31,
                                        height: 10.05,
                                        decoration: ShapeDecoration(
                                          color: Color(0xFF282828),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(25),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 39.46,
                                      top: 0,
                                      child: Container(
                                        width: 1.31,
                                        height: 10.05,
                                        decoration: ShapeDecoration(
                                          color: Color(0xFF282828),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(25),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 47.36,
                                      top: 0,
                                      child: Container(
                                        width: 1.31,
                                        height: 10.05,
                                        decoration: ShapeDecoration(
                                          color: Color(0xFF282828),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(25),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 55.25,
                                      top: 0,
                                      child: Container(
                                        width: 1.31,
                                        height: 10.05,
                                        decoration: ShapeDecoration(
                                          color: Color(0x99282828),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(25),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 63.14,
                                      top: 0,
                                      child: Container(
                                        width: 1.31,
                                        height: 10.05,
                                        decoration: ShapeDecoration(
                                          color: Color(0x4C282828),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(25),
                                          ),
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
                      left: 0,
                      top: 124.38,
                      child: Container(
                        width: 123.46,
                        height: 82.38,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                width: 123.46,
                                height: 82.38,
                                decoration: ShapeDecoration(
                                  color: Color(0xFFECEAD5),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 21.22,
                              top: 9.28,
                              child: SizedBox(
                                width: 96.45,
                                height: 18.56,
                                child: Text(
                                  'Weight',
                                  style: TextStyle(
                                    color: Color(0xFF253659),
                                    fontSize: 12,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 21.22,
                              top: 55.69,
                              child: SizedBox(
                                width: 81.02,
                                height: 24.04,
                                child: Text(
                                  '72 kg',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF253659),
                                    fontSize: 12,
                                    fontFamily: 'Mulish',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 30.87,
                              top: 33.65,
                              child: Container(
                                width: 64.70,
                                height: 22.10,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: Container(
                                        width: 1.32,
                                        height: 10.05,
                                        decoration: ShapeDecoration(
                                          color: Color(0x47282828),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(25),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 7.92,
                                      top: 0,
                                      child: Container(
                                        width: 1.32,
                                        height: 10.05,
                                        decoration: ShapeDecoration(
                                          color: Color(0x66282828),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(25),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 15.85,
                                      top: 0,
                                      child: Container(
                                        width: 1.32,
                                        height: 10.05,
                                        decoration: ShapeDecoration(
                                          color: Color(0xB2282828),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(25),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 23.77,
                                      top: 0,
                                      child: Container(
                                        width: 1.32,
                                        height: 22.10,
                                        decoration: ShapeDecoration(
                                          color: Color(0xFFD16564),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(25),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 31.69,
                                      top: 0,
                                      child: Container(
                                        width: 1.32,
                                        height: 10.05,
                                        decoration: ShapeDecoration(
                                          color: Color(0xFF282828),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(25),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 39.61,
                                      top: 0,
                                      child: Container(
                                        width: 1.32,
                                        height: 10.05,
                                        decoration: ShapeDecoration(
                                          color: Color(0xFF282828),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(25),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 47.54,
                                      top: 0,
                                      child: Container(
                                        width: 1.32,
                                        height: 10.05,
                                        decoration: ShapeDecoration(
                                          color: Color(0xFF282828),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(25),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 55.46,
                                      top: 0,
                                      child: Container(
                                        width: 1.32,
                                        height: 10.05,
                                        decoration: ShapeDecoration(
                                          color: Color(0x99282828),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(25),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 63.38,
                                      top: 0,
                                      child: Container(
                                        width: 1.32,
                                        height: 10.05,
                                        decoration: ShapeDecoration(
                                          color: Color(0x4C282828),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(25),
                                          ),
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
                      left: 12,
                      top: 0,
                      child: SizedBox(
                        width: 98,
                        height: 32,
                        child: Text(
                          'Body',
                          style: TextStyle(
                            color: Color(0xFFFFA9A8),
                            fontSize: 22,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),



              Container(
                width: 400,
                height: 397,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 390,
                        height: 465,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(32),
                              topRight: Radius.circular(32),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 16,
                      top: 163,
                      child: Container(
                        width: 359,
                        height: 140,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                width: 359,
                                height: 140,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 330,
                                      top: -16,
                                      child: Text(
                                        '12,000',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          color: Color(0xFF867676),
                                          fontSize: 9,
                                          fontFamily: 'SF Pro Display',
                                          fontWeight: FontWeight.w500,
                                          height: 0,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 334,
                                      top: 46,
                                      child: Text(
                                        '6,000',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          color: Color(0xFF867676),
                                          fontSize: 9,
                                          fontFamily: 'SF Pro Display',
                                          fontWeight: FontWeight.w500,
                                          height: 0,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 346,
                                      top: 123,
                                      child: Text(
                                        '30',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          color: Color(0xFF867676),
                                          fontSize: 10,
                                          fontFamily: 'SF Pro Display',
                                          fontWeight: FontWeight.w500,
                                          height: 0,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 1,
                                      top: 123,
                                      child: Text(
                                        '1',
                                        style: TextStyle(
                                          color: Color(0xFF867676),
                                          fontSize: 10,
                                          fontFamily: 'SF Pro Display',
                                          fontWeight: FontWeight.w500,
                                          height: 0,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 174,
                                      top: 123,
                                      child: Text(
                                        '15',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Color(0xFF867676),
                                          fontSize: 10,
                                          fontFamily: 'SF Pro Display',
                                          fontWeight: FontWeight.w500,
                                          height: 0,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 0,
                                      top: 1,
                                      child: Opacity(
                                        opacity: 0.30,
                                        child: Transform(
                                          transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(-1.57),
                                          child: Container(
                                            width: 1,
                                            height: 358,
                                            decoration: ShapeDecoration(
                                              color: Color(0xFF8E8E93),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(0.50),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 0,
                                      top: 61,
                                      child: Opacity(
                                        opacity: 0.30,
                                        child: Transform(
                                          transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(-1.57),
                                          child: Container(
                                            width: 1,
                                            height: 358,
                                            decoration: ShapeDecoration(
                                              color: Color(0xFF8E8E93),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(0.50),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 0,
                                      top: 121,
                                      child: Opacity(
                                        opacity: 0.30,
                                        child: Transform(
                                          transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(-1.57),
                                          child: Container(
                                            width: 1,
                                            height: 358,
                                            decoration: ShapeDecoration(
                                              color: Color(0xFF8E8E93),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(0.50),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            //Graph(),
                            Positioned(
                              left: 1,
                              top: 50,
                              child: Container(
                                width: 336,
                                child:

                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Graph(),
                                    /*Container(// Put Chart here
                                      width: 242.73,
                                      height: 126,
                                      //Graph(),
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage("https://via.placeholder.com/243x126"),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),*/
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 16,
                      top: 107,
                      child: Container(
                        width: 358,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Transform(
                              transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(0.79),
                              child: Container(
                                width: 8.07,
                                height: 8.07,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage("https://via.placeholder.com/8x8"),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: SizedBox(
                                child: Text(
                                  'April , 2023',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF321C1C),
                                    fontSize: 15,
                                    fontFamily: 'SF Pro Display',
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Transform(
                              transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(-2.36),
                              child: Container(
                                width: 8.07,
                                height: 8.07,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage("https://via.placeholder.com/8x8"),
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
                      left: 15,
                      top: 62,
                      child: Container(
                        width: 359,
                        height: 32,
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          color: Color(0x54E6E1D8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              left: 124,
                              top: 2,
                              child: Container(
                                width: 112,
                                height: 28,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: Container(
                                        width: 112,
                                        height: 28,
                                        decoration: ShapeDecoration(
                                          color: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                              width: 0.50,
                                              strokeAlign: BorderSide.strokeAlignOutside,
                                              color: Colors.black.withOpacity(0.03999999910593033),
                                            ),
                                            borderRadius: BorderRadius.circular(100),
                                          ),
                                          shadows: [
                                            BoxShadow(
                                              color: Color(0x0A000000),
                                              blurRadius: 1,
                                              offset: Offset(0, 3),
                                              spreadRadius: 0,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 8,
                                      top: 6,
                                      child: SizedBox(
                                        width: 96,
                                        height: 16,
                                        child: Text(
                                          'Monthly',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontFamily: 'SF Pro Text',
                                            fontWeight: FontWeight.w600,
                                            height: 0.09,
                                            letterSpacing: -0.24,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 0,
                              top: 2,
                              child: Container(
                                width: 112,
                                height: 28,
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 96,
                                      height: 16,
                                      child: Text(
                                        'Daily',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontFamily: 'SF Pro Text',
                                          fontWeight: FontWeight.w500,
                                          height: 0.09,
                                          letterSpacing: -0.24,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 240.73,
                              top: 2,
                              child: Container(
                                width: 117.22,
                                height: 28,
                                padding: const EdgeInsets.only(
                                  top: 6,
                                  left: 8,
                                  right: 8.22,
                                  bottom: 6,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 101,
                                      height: 16,
                                      child: Text(
                                        'Yearly',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontFamily: 'SF Pro Text',
                                          fontWeight: FontWeight.w500,
                                          height: 0.09,
                                          letterSpacing: -0.24,
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
                      left: 23,
                      top: -220,
                      child: Container(
                        width: 352.33,
                        height: 206.76,
                        
                        child: Stack(
                          children: [
                            Positioned(
                              left: 135,
                              top: 37,
                              child: Opacity(
                                opacity: 0.90,
                                child: Container(
                                  width: 217.33,
                                  height: 167.04,
                                  /*decoration: ShapeDecoration(
                                    color: Color(0x54E6E1D8),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                  ),*/
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 55.32,
                                        top: 27,
                                        child: SizedBox(
                                          width: 78.94,
                                          height: 30.77,
                                          child: Text(
                                            '24.9',
                                            style: TextStyle(
                                              color: Color(0xFF253659),
                                              fontSize: 24,
                                              fontFamily: 'Mulish',
                                              fontWeight: FontWeight.w400,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 15.32,
                                        top: 33,

                                        child: SizedBox(
                                          width: 123.51,
                                          height: 18.92,

                                          child: Text(
                                            'BMI',
                                            style: TextStyle(
                                              color: Color(0xFF253659),
                                              fontSize: 16,
                                              fontFamily: 'Mulish',
                                              fontWeight: FontWeight.w400,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 126.32,
                                        top: 24,
                                        child: Container(
                                          width: 80.08,
                                          height: 32.97,
                                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                                          decoration: ShapeDecoration(
                                            color: Color(0xFFD5FFDD),
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Healthy',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12,
                                                  fontFamily: 'Mulish',
                                                  fontWeight: FontWeight.w400,
                                                  height: 0,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 20.65,
                                        top: 79.13,
                                        child: Container(
                                          width: 189.70,
                                          height: 55.44,
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                left: -0,
                                                top: 32.97,
                                                child: SizedBox(
                                                  width: 19.45,
                                                  height: 13.19,
                                                  child: Text(
                                                    '15',
                                                    style: TextStyle(
                                                      color: Color(0xFF253659),
                                                      fontSize: 12,
                                                      fontFamily: 'Mulish',
                                                      fontWeight: FontWeight.w700,
                                                      height: 0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                left: 40.06,
                                                top: 32.24,
                                                child: SizedBox(
                                                  width: 38.85,
                                                  height: 13.92,
                                                  child: Text(
                                                    '18.5',
                                                    style: TextStyle(
                                                      color: Color(0xFF253659),
                                                      fontSize: 12,
                                                      fontFamily: 'Mulish',
                                                      fontWeight: FontWeight.w700,
                                                      height: 0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                left: 86.19,
                                                top: 32.24,
                                                child: SizedBox(
                                                  width: 26.71,
                                                  height: 23.20,
                                                  child: Text(
                                                    '25',
                                                    style: TextStyle(
                                                      color: Color(0xFF253659),
                                                      fontSize: 12,
                                                      fontFamily: 'Mulish',
                                                      fontWeight: FontWeight.w700,
                                                      height: 0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                left: 124.70,
                                                top: 32.97,
                                                child: SizedBox(
                                                  width: 24.03,
                                                  height: 13.19,
                                                  child: Text(
                                                    '30',
                                                    style: TextStyle(
                                                      color: Color(0xFF253659),
                                                      fontSize: 12,
                                                      fontFamily: 'Mulish',
                                                      fontWeight: FontWeight.w700,
                                                      height: 0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                left: 165.68,
                                                top: 32.97,
                                                child: SizedBox(
                                                  width: 24.03,
                                                  height: 13.19,
                                                  child: Text(
                                                    '40',
                                                    style: TextStyle(
                                                      color: Color(0xFF253659),
                                                      fontSize: 12,
                                                      fontFamily: 'Mulish',
                                                      fontWeight: FontWeight.w700,
                                                      height: 0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                left: -0,
                                                top: 11.35,
                                                child: Container(
                                                  width: 177.59,
                                                  height: 13.24,
                                                  decoration: ShapeDecoration(
                                                    gradient: LinearGradient(
                                                      begin: Alignment(1.00, 0.00),
                                                      end: Alignment(-1, 0),
                                                      colors: [Color(0xFFB4D4F1), Color(0xFF81E5DA), Color(0xFFE7D284), Color(0xFFE2788E)],
                                                    ),
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(21),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                left: 78.93,
                                                top: -0,
                                                child: Container(
                                                  width: 4.38,
                                                  height: 5.68,
                                                  decoration: ShapeDecoration(
                                                    color: Color(0xFFD16564),
                                                    shape: RoundedRectangleBorder(
                                                      side: BorderSide(
                                                        width: 1,
                                                        strokeAlign: BorderSide.strokeAlignOutside,
                                                        color: Color(0xFF262729),
                                                      ),
                                                      borderRadius: BorderRadius.circular(19),
                                                    ),
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
                            ),
                            Positioned(
                              left: 0,
                              top: 37,
                              child: Container(
                                width: 123,
                                height: 82.38,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: Container(
                                        width: 123,
                                        height: 82.38,
                                        decoration: ShapeDecoration(
                                          color: Color(0xFFECEAD5),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 22.71,
                                      top: 8.01,
                                      child: SizedBox(
                                        width: 92.65,
                                        height: 16.71,
                                        child: Text(
                                          'Height',
                                          style: TextStyle(
                                            color: Color(0xFF253659),
                                            fontSize: 12,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 40,
                                      top: 57,
                                      child: SizedBox(
                                        width: 48,
                                        height: 13,
                                        child: Text(
                                          '170 cm',
                                          style: TextStyle(
                                            color: Color(0xFF253659),
                                            fontSize: 12,
                                            fontFamily: 'Mulish',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 30.35,
                                      top: 32.27,
                                      child: Container(
                                        width: 64.46,
                                        height: 22.10,
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              left: 0,
                                              top: 0,
                                              child: Container(
                                                width: 1.31,
                                                height: 10.05,
                                                decoration: ShapeDecoration(
                                                  color: Color(0x47282828),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(25),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              left: 7.89,
                                              top: 0,
                                              child: Container(
                                                width: 1.31,
                                                height: 10.05,
                                                decoration: ShapeDecoration(
                                                  color: Color(0x66282828),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(25),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              left: 15.79,
                                              top: 0,
                                              child: Container(
                                                width: 1.31,
                                                height: 10.05,
                                                decoration: ShapeDecoration(
                                                  color: Color(0xB2282828),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(25),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              left: 23.68,
                                              top: 0,
                                              child: Container(
                                                width: 1.31,
                                                height: 22.10,
                                                decoration: ShapeDecoration(
                                                  color: Color(0xFFD16564),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(25),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              left: 31.57,
                                              top: 0,
                                              child: Container(
                                                width: 1.31,
                                                height: 10.05,
                                                decoration: ShapeDecoration(
                                                  color: Color(0xFF282828),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(25),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              left: 39.46,
                                              top: 0,
                                              child: Container(
                                                width: 1.31,
                                                height: 10.05,
                                                decoration: ShapeDecoration(
                                                  color: Color(0xFF282828),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(25),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              left: 47.36,
                                              top: 0,
                                              child: Container(
                                                width: 1.31,
                                                height: 10.05,
                                                decoration: ShapeDecoration(
                                                  color: Color(0xFF282828),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(25),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              left: 55.25,
                                              top: 0,
                                              child: Container(
                                                width: 1.31,
                                                height: 10.05,
                                                decoration: ShapeDecoration(
                                                  color: Color(0x99282828),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(25),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              left: 63.14,
                                              top: 0,
                                              child: Container(
                                                width: 1.31,
                                                height: 10.05,
                                                decoration: ShapeDecoration(
                                                  color: Color(0x4C282828),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(25),
                                                  ),
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
                              left: 0,
                              top: 124.38,
                              child: Container(
                                width: 123.46,
                                height: 82.38,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: Container(
                                        width: 123.46,
                                        height: 82.38,
                                        decoration: ShapeDecoration(
                                          color: Color(0xFFECEAD5),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 21.22,
                                      top: 9.28,
                                      child: SizedBox(
                                        width: 96.45,
                                        height: 18.56,
                                        child: Text(
                                          'Weight',
                                          style: TextStyle(
                                            color: Color(0xFF253659),
                                            fontSize: 12,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 21.22,
                                      top: 55.69,
                                      child: SizedBox(
                                        width: 81.02,
                                        height: 22.04,
                                        child: Text(
                                          '72 kg',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Color(0xFF253659),
                                            fontSize: 12,
                                            fontFamily: 'Mulish',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 30.87,
                                      top: 33.65,
                                      child: Container(
                                        width: 64.70,
                                        height: 22.10,
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              left: 0,
                                              top: 0,
                                              child: Container(
                                                width: 1.32,
                                                height: 10.05,
                                                decoration: ShapeDecoration(
                                                  color: Color(0x47282828),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(25),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              left: 7.92,
                                              top: 0,
                                              child: Container(
                                                width: 1.32,
                                                height: 10.05,
                                                decoration: ShapeDecoration(
                                                  color: Color(0x66282828),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(25),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              left: 15.85,
                                              top: 0,
                                              child: Container(
                                                width: 1.32,
                                                height: 10.05,
                                                decoration: ShapeDecoration(
                                                  color: Color(0xB2282828),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(25),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              left: 23.77,
                                              top: 0,
                                              child: Container(
                                                width: 1.32,
                                                height: 22.10,
                                                decoration: ShapeDecoration(
                                                  color: Color(0xFFD16564),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(25),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              left: 31.69,
                                              top: 0,
                                              child: Container(
                                                width: 1.32,
                                                height: 10.05,
                                                decoration: ShapeDecoration(
                                                  color: Color(0xFF282828),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(25),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              left: 39.61,
                                              top: 0,
                                              child: Container(
                                                width: 1.32,
                                                height: 10.05,
                                                decoration: ShapeDecoration(
                                                  color: Color(0xFF282828),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(25),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              left: 47.54,
                                              top: 0,
                                              child: Container(
                                                width: 1.32,
                                                height: 10.05,
                                                decoration: ShapeDecoration(
                                                  color: Color(0xFF282828),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(25),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              left: 55.46,
                                              top: 0,
                                              child: Container(
                                                width: 1.32,
                                                height: 10.05,
                                                decoration: ShapeDecoration(
                                                  color: Color(0x99282828),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(25),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              left: 63.38,
                                              top: 0,
                                              child: Container(
                                                width: 1.32,
                                                height: 10.05,
                                                decoration: ShapeDecoration(
                                                  color: Color(0x4C282828),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(25),
                                                  ),
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
                              left: 40,
                              top: 0,
                              child: SizedBox(
                                width: 98,
                                height: 32,
                                child: Text(
                                  'Body',
                                  style: TextStyle(
                                    color: Color(0xFFFFA9A8),
                                    fontSize: 22,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    height: 0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),



                    //This is Steps
                    Positioned(
                      left: 40,
                      top: 10,
                      child: SizedBox(
                        width: 98,
                        height: 32,
                        child: Text(
                          'Steps',
                          style: TextStyle(
                            color: Color(0xFFFFA9A8),
                            fontSize: 22,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 18,
                      top: 316,
                      child: Container(
                        width: 357,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Average',
                                      style: TextStyle(
                                        color: Color(0xFF867676),
                                        fontSize: 15,
                                        fontFamily: 'SF Pro Display',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Container(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            '8,635',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 24,
                                              fontFamily: 'SF Pro Display',
                                              fontWeight: FontWeight.w600,
                                              height: 0,
                                            ),
                                          ),
                                          const SizedBox(width: 4),
                                          Container(
                                            padding: const EdgeInsets.only(top: 12.50, right: 7, bottom: 2.50),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'steps',
                                                  style: TextStyle(
                                                    color: Color(0xFF867676),
                                                    fontSize: 12,
                                                    fontFamily: 'SF Pro Display',
                                                    fontWeight: FontWeight.w500,
                                                    height: 0,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Opacity(
                              opacity: 0.30,
                              child: Container(
                                width: 1,
                                height: 49,
                                decoration: ShapeDecoration(
                                  color: Color(0xFF8E8E93),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0.50),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Container(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Best',
                                      style: TextStyle(
                                        color: Color(0xFF867676),
                                        fontSize: 15,
                                        fontFamily: 'SF Pro Display',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Container(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            '12,235',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 24,
                                              fontFamily: 'SF Pro Display',
                                              fontWeight: FontWeight.w600,
                                              height: 0,
                                            ),
                                          ),
                                          const SizedBox(width: 4),
                                          Container(
                                            padding: const EdgeInsets.only(top: 12.50, right: 7, bottom: 2.50),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'steps',
                                                  style: TextStyle(
                                                    color: Color(0xFF867676),
                                                    fontSize: 12,
                                                    fontFamily: 'SF Pro Display',
                                                    fontWeight: FontWeight.w500,
                                                    height: 0,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
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
                  ],
                ),
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


class Bg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

      ],
    );
  }
}
/*class _MealCard extends StatelessWidget {
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
              fit: FlexFit.tight,
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(height: 5),
                    Text(
                      location.category,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.blueGrey,
                      ),
                    ),
                    Text(
                      location.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "${location.kiloCaloriesBurnt} kcal",
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.blueGrey,
                      ),
                    ),
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
}*/
