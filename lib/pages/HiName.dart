// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mindfulwalk/pages/Login.dart';
import 'package:mindfulwalk/pages/MapPage.dart';
import 'package:mindfulwalk/pages/PhotosPage.dart';
import 'package:mindfulwalk/pages/ProfilePage.dart';
import 'package:mindfulwalk/pages/locationinfo.dart';

class HiName extends StatefulWidget {
  const HiName({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HiName> {
  String _userName = "";
  String quoteOTD = '';

  @override
  void initState() {
    super.initState();
    getQuotes();
  }

  Future<void> getQuotes() async {
    final String apiUrl = "https://zenquotes.io/api/random/";

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);

        if (data.isNotEmpty) {
          // Check if the data list is not empty
          setState(() {
            quoteOTD = data[0]['q']; // Update quoteOTD with the first quote
          });

          print('QUOTE: $quoteOTD'); // Print the quoteOTD
        } else {
          print('Empty quote list received'); // Handle empty quote list
        }
      } else {
        // Handle error
        print('Failed to load quotes. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle error
      print('Error fetching quotes: $e');
    }
  }

  Future _fetchUserData() async {
    CollectionReference user = FirebaseFirestore.instance.collection('Users');
    // var data =
    //     await FirebaseFirestore.instance.collection("Users").doc(userID).get();
    // setState(() {
    //   _userName = data["Name"];
    // });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    _fetchUserData();
    final height = MediaQuery.of(context).size.height;

// Assuming you have a document containing a date field named 'birthdate'

    return Scaffold(
      backgroundColor: const Color(0xffFFFEF6),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(children: [
                Text(
                  'Hi $_userName! ',
                  style: GoogleFonts.raleway(
                    textStyle: TextStyle(
                      color: Color(0xFF406440),
                      fontWeight: FontWeight.w800,
                      fontSize: 36,
                    ),
                  ),
                ),
                Image.asset('assets/wavingHand.png')
              ] // children
                  ),
              SizedBox(height: 12.0),
              Padding(
                  padding: const EdgeInsets.only(
                    bottom: 8,
                    left: 16,
                    right: 16,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Where to next?",
                        style: const TextStyle(
                            color: Color(0xFF4B5563),
                            fontSize: 24,
                            fontWeight: FontWeight.w500),
                      ),
                      TextButton(
                        child: Text("See more"),
                        style: TextButton.styleFrom(
                          foregroundColor: Color(0xFF7B9E87),
                        ),
                        onPressed: () {
                          /*Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SecondScreen()),
                        );*/
                        },
                      ),
                    ],
                  )),
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
                        _LocationCard(
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Your Record",
                        style: const TextStyle(
                            color: Color(0xFF4B5563),
                            fontSize: 24,
                            fontWeight: FontWeight.w500),
                      ),
                      TextButton(
                        child: Text("See more"),
                        style: TextButton.styleFrom(
                          foregroundColor: Color(0xFF7B9E87),
                        ),
                        onPressed: () {
                          /*Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SecondScreen()),
                        );*/
                        },
                      ),
                    ],
                  )),
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
                        _LocationCard(
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
              )),
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
                      width: 330,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: Color(0xFF5B8C5A), // Border color
                          width: 2.0, // Border width
                        ),
                      ),
                      padding: EdgeInsets.fromLTRB(
                          5, 0, 5, 0), // Padding around the text
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Padding(
                          padding:
                              const EdgeInsets.all(8.0), // Add padding here
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '$quoteOTD',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16, // Font size
                                  color: Color(0xFF8B6B55), // Text color
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 8,
                        left: 16,
                        right: 16,
                      ),
                    ),
                    Container(
                      //level box
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
                                    color: Colors.white
                                        .withOpacity(0.20000000298023224),
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
                                          side: BorderSide(
                                              width: 1,
                                              color: Color(0xFFFFC600)),
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
                                                      decoration: BoxDecoration(
                                                          color: Color(
                                                              0xFF5B8C5A)),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    left: 5.18,
                                                    top: 1.69,
                                                    child: Container(
                                                      width: 14.98,
                                                      height: 1.78,
                                                      decoration: BoxDecoration(
                                                          color: Color(
                                                              0xFFADC178)),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    left: 5.18,
                                                    top: 19.51,
                                                    child: Container(
                                                      width: 14.98,
                                                      height: 1.78,
                                                      decoration: BoxDecoration(
                                                          color: Color(
                                                              0xFFADC178)),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    left: 5.18,
                                                    top: 15.23,
                                                    child: Container(
                                                      width: 14.98,
                                                      height: 1.78,
                                                      decoration: BoxDecoration(
                                                          color: Color(
                                                              0xFFADC178)),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    left: 5.18,
                                                    top: 5.68,
                                                    child: Container(
                                                      width: 14.98,
                                                      height: 1.78,
                                                      decoration: BoxDecoration(
                                                          color: Color(
                                                              0xFFADC178)),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    left: 0.65,
                                                    top: 0.98,
                                                    child: Container(
                                                      width: 4.18,
                                                      height: 11.04,
                                                      decoration: BoxDecoration(
                                                          color: Color(
                                                              0xFFD28800)),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    left: 2.05,
                                                    top: 11.67,
                                                    child: Container(
                                                      width: 2.79,
                                                      height: 9.26,
                                                      decoration: BoxDecoration(
                                                          color: Color(
                                                              0xFFD28800)),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    left: 20.17,
                                                    top: 0.98,
                                                    child: Container(
                                                      width: 4.18,
                                                      height: 11.04,
                                                      decoration: BoxDecoration(
                                                          color: Color(
                                                              0xFFD28800)),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    left: 20.17,
                                                    top: 11.67,
                                                    child: Container(
                                                      width: 2.79,
                                                      height: 9.26,
                                                      decoration: BoxDecoration(
                                                          color: Color(
                                                              0xFFD28800)),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    left: 4.83,
                                                    top: 10.60,
                                                    child: Container(
                                                      width: 15.33,
                                                      height: 2.14,
                                                      decoration: BoxDecoration(
                                                          color: Color(
                                                              0xFFFBB502)),
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
                                                          image: NetworkImage(
                                                              "https://via.placeholder.com/11x37"),
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
                                                          image: NetworkImage(
                                                              "https://via.placeholder.com/12x37"),
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
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4)),
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
          selectedItemColor: Colors
              .white, // we can change this if we want text under each icon
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Image.asset('assets/homeSelected.png',
                      width: 45, height: 45)),
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
                child: Image.asset('assets/health.png', width: 50, height: 50),
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

class _LocationCard extends StatelessWidget {
  final Location location;

  const _LocationCard({Key? key, required this.location}) : super(key: key);

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
              flex: 3,
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
              flex: 2,
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
                      style: GoogleFonts.raleway(
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
                          Icons.location_on,
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
                    SizedBox(height: 5),
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
