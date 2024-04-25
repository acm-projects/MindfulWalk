// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:mindfulwalk/pages/HiName.dart';
import 'package:mindfulwalk/pages/MapPage.dart';
import 'package:mindfulwalk/pages/PhotoGallery.dart';
import 'package:mindfulwalk/pages/ProfilePage.dart';
import 'package:mindfulwalk/pages/healthWidgets/graph.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_advanced_segment/flutter_advanced_segment.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mindfulwalk/pages/locationinfo.dart';
import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:mindfulwalk/pages/healthWidgets/stats.dart';
import 'package:mindfulwalk/pages/healthWidgets/appbar.dart';
import 'package:mindfulwalk/pages/healthWidgets/dates.dart';
import 'package:mindfulwalk/pages/healthWidgets/graph.dart';
import 'package:mindfulwalk/pages/healthWidgets/info.dart' hide Stats;
import 'package:mindfulwalk/pages/healthWidgets/steps.dart';
import 'package:mindfulwalk/pages/healthWidgets/details.dart';
import 'package:mindfulwalk/helpers.dart';

DateBox globalDateBox = DateBox(
  date: DateTime.now(),
  active: true,
);

void main() {
  runApp(Health());
}
/*DateTime now = new DateTime.now();
DateTime date = new DateTime(now.year, now.month, now.day);
var formatter = new DateFormat('yyyy-MM-dd');
String formattedDate = formatter.format(now);*/

class Health extends StatelessWidget {
  // This widget is the root of your application.

  @override
  String getCurrentDate() {
    var date = DateTime.now().toString();

    var dateParse = DateTime.parse(date);

    var formattedDate = "${dateParse.day}-${dateParse.month}-${dateParse.year}";
    return formattedDate.toString();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
  final TextEditingController _heightFeetController = TextEditingController();
  TextEditingController heightInchesController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  double bmi = 0.0;
  bool showContainer = false;
  Color containerColor = Color(0xFFD5FFDD); // 초기 컨테이너 색상
  String containerText = 'Healthy'; // 초기 텍스트

  final _contentEditController = TextEditingController();

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
  } // _incrementCounter()

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    final height = MediaQuery.of(context).size.height;
    //final _controller = AdvancedSegmentController('all');
    var value = "";

    return Scaffold(
      backgroundColor: const Color(0xffFFFEF6),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(children: <Widget>[
          Container(
            //padding: EdgeInsets.all(16.0),
            padding: EdgeInsets.fromLTRB(33.0, 7, 16, 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //Image.asset('assets/backArrow.png', width: 31, height: 31),

                Row(children: [
                  Text(
                    /*String name = intent.getStringExtra("name");
                    //int number = Integer.valueOf(intent.getStringExtra("number"));

                    data.setText("Name is " + name );*/

                    'Health',
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

                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 8,
                    left: 32,
                    right: 16,
                  ),
                ),

                //this is body container
                Container(
                  width: 352.33,
                  height: 206.76,
                  child: Stack(
                    children: [
                      //This is Body Title
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
                                    child: /*Text(
                                      '24.9',
                                      style: TextStyle(
                                        color: Color(0xFF253659),
                                        fontSize: 24,
                                        fontFamily: 'Mulish',
                                        fontWeight: FontWeight.w400,
                                        height: 0,
                                      ),
                                    ),*/
                                        Text(
                                      '$bmi',
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
                                  left: 112,
                                  top: 24,
                                  child: Visibility(
                                    visible: showContainer, //
                                    child: Container(
                                      width: 88,
                                      height: 32.97,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 6, vertical: 0),
                                      decoration: ShapeDecoration(
                                        color: containerColor, //
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              containerText,
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
                                          top: 32,
                                          child: SizedBox(
                                            width: 19.45,
                                            height: 13,
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
                                          left: 40,
                                          top: 32,
                                          child: SizedBox(
                                            width: 30,
                                            height: 13,
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
                                          left: 90,
                                          top: 32,
                                          child: SizedBox(
                                            width: 26.71,
                                            height: 13,
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
                                          left: 125,
                                          top: 32,
                                          child: SizedBox(
                                            width: 24.03,
                                            height: 13,
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
                                          left: 160,
                                          top: 32,
                                          child: SizedBox(
                                            width: 24.03,
                                            height: 13,
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
                                                colors: [
                                                  Color(0xFFE2788E),
                                                  Color(0xFFE7D284),
                                                  Color(0xFF81E5DA),
                                                  Color(0xFFB4D4F1)
                                                ],
                                              ),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(21),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: calculateRedDotPosition(bmi),
                                          top: -0,
                                          child: Container(
                                            width: 4.38,
                                            height: 5.68,
                                            decoration: ShapeDecoration(
                                              color: Color(0xFFD16564),
                                              shape: RoundedRectangleBorder(
                                                side: BorderSide(
                                                  width: 1,
                                                  strokeAlign: BorderSide
                                                      .strokeAlignOutside,
                                                  color: Color(0xFF262729),
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(19),
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

                              Column(
                                children: [
                                  Padding(
                                      padding:
                                          EdgeInsets.only(left: 15, right: 15),
                                      child: Text('Height',
                                          style: TextStyle(
                                            fontSize: 16,
                                          ))),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 15, right: 15),
                                    child: Row(
                                      children: [
                                        Flexible(
                                          //flex: 2,
                                          child: TextField(
                                            controller: _heightFeetController,
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              hintText: 'feet',
                                              hintStyle:
                                                  TextStyle(fontSize: 12),
                                              border: UnderlineInputBorder(),
                                              suffixText: '\'',
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 8.0),
                                        Flexible(
                                          //flex: 3,
                                          child: TextField(
                                            controller: heightInchesController,
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              hintText: 'inches',
                                              hintStyle:
                                                  TextStyle(fontSize: 12),
                                              border: UnderlineInputBorder(),
                                              suffixText: '"',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )

                              //var text = _contentEditController.text;
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
                              Column(
                                children: [
                                  Padding(
                                      padding:
                                          EdgeInsets.only(left: 15, right: 15),
                                      child: Text('Weight',
                                          style: TextStyle(
                                            fontSize: 16,
                                          ))),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 15, right: 15),
                                    child: TextField(
                                      controller: weightController,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        hintText: 'pounds',
                                        border: UnderlineInputBorder(),
                                        suffixText: 'lb',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // This is Steps
          Container(
            width: double.infinity,
            height: 437.6,
            child: Stack(
              children: [
                //Background White BorderSquare
                Positioned(
                  left: 0,
                  top: 5,
                  child: Container(
                    width: 410,
                    height: 600,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.3),
                          blurRadius: 4.0,
                          spreadRadius: 4.0,
                          offset: Offset(
                            0.0,
                            2.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                //This is Steps Container
                Container(
                  padding: EdgeInsets.only(left: 24.0, top: 20),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // This is Steps Title
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 11.0),
                              child: Text(
                                '  Steps',
                                style: TextStyle(
                                  color: Color(0xFFFFA9A8),
                                  fontSize: 22,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailsPage()),
                                );
                              },
                              icon: Padding(
                                padding: EdgeInsets.fromLTRB(10, 10, 35, 0),
                                child: Image.asset("assets/staticon.png",
                                    width: 31, height: 31),
                              ),
                              /*ImageIcon(
                    AssetImage("assets/backArrow.png"),
                    color: Colors.black,
                    size: 31,
                  ),*/
                            ),
                          ],
                        ),

                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 5,
                            left: 16,
                            right: 16,
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(left: 11.0),
                          child: Row(
                            children: [
                              Expanded(
                                //alignment: Alignment.topCenter,
                                //width: double.infinity,

                                child: CustomSlidingSegmentedControl<int>(
                                  initialValue: 2,
                                  children: {
                                    1: Padding(
                                        padding: EdgeInsets.only(
                                            left: 15, right: 15),
                                        child: Text('Weekly',
                                            style: TextStyle(
                                              fontSize: 18,
                                            ))),
                                    2: Padding(
                                        padding: EdgeInsets.only(
                                            left: 15, right: 15),
                                        child: Text('Monthly',
                                            style: TextStyle(
                                              fontSize: 18,
                                            ))),
                                    3: Padding(
                                        padding: EdgeInsets.only(
                                            left: 15, right: 15),
                                        child: Text(
                                          'Yearly',
                                          style: TextStyle(
                                            fontSize: 18,
                                          ),
                                        )),
                                  },
                                  decoration: BoxDecoration(
                                    color: Color(0xFFECEAD5),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  thumbDecoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(.3),
                                        blurRadius: 4.0,
                                        spreadRadius: 1.0,
                                        offset: Offset(
                                          0.0,
                                          2.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.easeInToLinear,
                                  onValueChanged: (v) {
                                    if (v != null) {
                                      setState(() {
                                        selectedContainer = containers[v - 1];
                                        //  _selectedSegment = v;
                                      });
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 16,
                            left: 16,
                            right: 16,
                          ),
                        ),

                        selectedContainer,

                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 8,
                            left: 16,
                            right: 16,
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 8,
                            left: 16,
                            right: 16,
                          ),
                        ),
                      ]),
                ),
              ],
            ),
          )
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
                child: GestureDetector(
                    onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HiName()),
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
                    child: Image.asset('assets/healthSelected.png',
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

  void _calculateBMI() {
    double heightFeet = double.tryParse(_heightFeetController.text) ?? 0.0;
    double heightInches = double.tryParse(heightInchesController.text) ?? 0.0;
    double weight = double.tryParse(weightController.text) ?? 0.0;

    if (heightFeet <= 0 || heightInches < 0 || weight <= 0) {
      setState(() {
        bmi = 0.0;
      });
      return;
    }

    double heightInInches = heightFeet * 12 + heightInches;
    double bmiValue = (703 * weight) / (heightInInches * heightInInches);
    String roundedBMI = bmiValue.toStringAsFixed(1);

    setState(() {
      //bmi = bmiValue;
      bmi = double.parse(roundedBMI);
    });

    onBMICalculated(bmiValue);
    updateContainerColorAndText(bmi);
  }

  void onBMICalculated(double bmi) {
    // BMI에 따라 컨테이너를 보이도록 설정합니다.
    if (bmi != 0) {
      setState(() {
        showContainer = true;
      });
    }
  }

  @override
  // BMI에 따라 컨테이너의 색상과 Text를 업데이트하는 함수
  void updateContainerColorAndText(double bmi) {
    Color color;
    String text;

    if (bmi <= 18.5) {
      color = Color(0xFFB4D4F1);
      text = 'Underweight';
    } else if (bmi <= 25) {
      color = Color(0xFFD5FFDD);
      text = 'Healthy';
    } else if (bmi <= 30) {
      color = Color(0xFFE7D284);
      text = 'Overweight';
    } else {
      color = Color(0xFFE2788E);
      text = 'Obese';
    }

    // setState를 사용하여 UI를 업데이트합니다.
    setState(() {
      containerColor = color;
      containerText = text;
    });
  }

  @override
  double calculateRedDotPosition(double bmi) {
    double position;
    if (bmi <= 18.5) {
      position = (bmi - 15) / (18.5 - 15) * 52;
    } else if (bmi <= 25) {
      position = 52 + (bmi - 18.5) / (25 - 18.5) * (95 - 52);
    } else if (bmi <= 30) {
      position = 95 + (bmi - 25) / (30 - 25) * (130 - 95);
    } else {
      position = 130 + (bmi - 30) / (40 - 30) * (171 - 130);
    }

    // 반환하기 전에 위치가 컨테이너 범위 내에 있는지 확인합니다.
    // 예를 들어 범위를 벗어나면 최솟값 또는 최댓값으로 설정할 수 있습니다.
    if (position < 0) {
      position = 0;
    } else if (position > 171) {
      position = 171;
    }

    return position;
  }

  @override
  void initState() {
    super.initState();
    _heightFeetController.addListener(_calculateBMI);
    heightInchesController.addListener(_calculateBMI);
    weightController.addListener(_calculateBMI);
  }

  @override
  void dispose() {
    _heightFeetController.dispose();
    heightInchesController.dispose();
    weightController.dispose();
    super.dispose();
  }
}

List<Widget> containers = [
  // Container for Weekly
  Container(
      //color: Colors.red, // Customize container as per your need
      child: Column(
    children: [
      Container(
        width: 358,
        height: 30,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(),
        child: Padding(
          padding: EdgeInsets.only(right: 25.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 20,
                ),
                child: Icon(
                  Icons.arrow_left_rounded,
                  size: 30,
                  color: Colors.black12,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: SizedBox(
                  child: Text(
                    //formattedDate,

                    monthsOfYear[globalDateBox.nowmonth]! +
                        ' ' +
                        globalDateBox.nowMonday.toString() +
                        '~' +
                        globalDateBox.nowSunday.toString(), //+'March 18~24',
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
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 20,
                ),
                child: Icon(
                  Icons.arrow_right_rounded,
                  size: 30,
                  color: Colors.black12,
                ),
              ),
            ],
          ),
        ),
      ),

      Container(
          width: 300,
          height: 160,
          child: Padding(
            //padding: EdgeInsets.symmetric(vertical: 15.0),
            padding: EdgeInsets.only(right: 20.0),
            child: Graph(graphType: 'Weekly', key: UniqueKey()),
          )),

      Padding(
        padding: const EdgeInsets.only(
          bottom: 33,
          left: 16,
          right: 16,
        ),
      ),

      //This is Average and Best steps
      Row(
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
                          '9,345',
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
                          padding: const EdgeInsets.only(
                              top: 12.50, right: 7, bottom: 2.50),
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

          // middle seperation line between Average and the Best.
          const SizedBox(width: 10),
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

          // This is the Best steps
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
                          '10,268',
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
                          padding: const EdgeInsets.only(
                              top: 12.50, right: 7, bottom: 2.50),
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
      )
    ],
  )),

  // Container for Monthly
  Container(

      //color: Colors.green, // Customize container as per your need
      child: //Center(child: Text('Monthly')), // Example content
          Column(
    children: [
      Container(
        width: 358,
        height: 30,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(),
        child: Padding(
          padding: EdgeInsets.only(right: 25),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 20,
                ),
                child: Icon(
                  Icons.arrow_left_rounded,
                  size: 30,
                  color: Colors.black12,
                ),
              ),
              Expanded(
                child: SizedBox(
                  child: Text(
                    monthsOfYear[globalDateBox.nowmonth]!,
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
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 20,
                ),
                child: Icon(
                  Icons.arrow_right_rounded,
                  size: 30,
                  color: Colors.black12,
                ),
              ),
            ],
          ),
        ),
      ),

      Container(
          width: 300,
          height: 160,
          child: Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Graph(graphType: 'Monthly', key: UniqueKey()),
          )),

      Padding(
        padding: const EdgeInsets.only(
          bottom: 32,
          left: 16,
          right: 16,
        ),
      ),

      /*Info(),

          Row(

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
                              '6,354',
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






              // middle seperation line between Average and the Best.
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



              // This is the Best steps
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
                              '15,248',
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


          )*/

      Padding(
        padding: const EdgeInsets.only(
          bottom: 8.6,
        ),
      ),

      //This is Average and Best steps
      Container(
        width: 410,
        height: 49,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stats(value: '2223', unit: 'steps', label: 'Current'),

            // middle seperation line between Average and the Best.
            Opacity(
              opacity: 0.30,
              child: Container(
                padding: const EdgeInsets.only(
                  bottom: 8,
                  left: 32,
                  right: 32,
                ),
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

            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
            ),

            // This is the Best steps
            Stats(value: '9037', unit: 'steps', label: 'Average'),

            // middle seperation line between Average and the Best.
            Opacity(
              opacity: 0.30,
              child: Container(
                padding: const EdgeInsets.only(
                  bottom: 8,
                  left: 32,
                  right: 32,
                ),
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

            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
            ),

            // This is the Best steps
            Stats(value: '15083', unit: 'steps', label: 'Best'),
          ],
        ),
      )
    ],
  )),

  // Container for Yearly
  Container(
      //color: Colors.red, // Customize container as per your need
      child: Column(
    children: [
      Container(
        width: 358,
        height: 30,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(),
        child: Padding(
          padding: EdgeInsets.only(right: 25.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 20,
                ),
                child: Icon(
                  Icons.arrow_left_rounded,
                  size: 30,
                  color: Colors.black12,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: SizedBox(
                  child: Text(
                    globalDateBox.nowyear.toString(),
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
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 20,
                ),
                child: Icon(
                  Icons.arrow_right_rounded,
                  size: 30,
                  color: Colors.black12,
                ),
              ),
            ],
          ),
        ),
      ),

      Container(
          width: 300,
          height: 160,
          child: Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Graph(graphType: 'Yearly', key: UniqueKey()),
          )),

      Padding(
        padding: const EdgeInsets.only(
          bottom: 35,
        ),
      ),

      //This is Average and Best steps
      Padding(
        padding: EdgeInsets.only(left: 0.0),
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
                            padding: const EdgeInsets.only(
                                top: 12.50, right: 7, bottom: 2.50),
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

            // middle seperation line between Average and the Best.
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

            // This is the Best steps
            const SizedBox(width: 8),
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
                            '22,235',
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
                            padding: const EdgeInsets.only(
                                top: 12.50, right: 7, bottom: 2.50),
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
      )
    ],
  ))
];

// Define a variable to hold the selected container
Widget selectedContainer = containers[1];

class Stats extends StatelessWidget {
  final String value;
  final String unit;
  final String label;

  const Stats({
    Key? key,
    required this.value,
    required this.unit,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 110,
        height: 49,
        child: Expanded(
          child: Container(
            padding: const EdgeInsets.only(

                //left: 16,
                ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: 8),
                Text(
                  label,
                  style: TextStyle(
                    color: Color(0xFF867676),
                    fontSize: 15,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
                Text.rich(
                  TextSpan(
                      text: value,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                      children: [
                        const TextSpan(text: ' '),
                        TextSpan(
                          text: unit,
                          style: TextStyle(
                            color: Color(0xFF867676),
                            fontSize: 12,
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                      ]),
                ),
                //const SizedBox(height: 6),
              ],
            ),
          ),
        ));
  }
}
