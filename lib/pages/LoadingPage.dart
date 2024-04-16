import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mindfulwalk/pages/StartingPage.dart';
import 'package:google_fonts/google_fonts.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    // Call the function to transition after 5 seconds
    _transitionToStartingPage();
  }

  // Function to transition to the StartingPage after 5 seconds
  void _transitionToStartingPage() {
    Timer(Duration(seconds: 3), () {
      // Use Navigator to push the StartingPage onto the stack
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => StartingPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              center: Alignment(0, -0.3),
              radius: 1.3,
              transform: GradientRotation(0),
              colors: [
                Color(0xFFFFA9A8),
                Color(0xFFFFFCE7),
              ],
            ),
          ),
        ),
        Center(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 200),
              Container(
                width: 600,
                height: 290,
                child: Image.asset(
                  'assets/mindful-walk.png',
                  width: 500,
                  height: 500,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 460,
          left: 75,
          child: Text("Step into peace.\nExplore your city's grace.",
              style: GoogleFonts.comfortaa(
                textStyle: TextStyle(
                  color: Color(0xFF5B8C5A),
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  decoration: TextDecoration.none,
                ),
              ),
              textAlign: TextAlign.center),
        ),
        Positioned(
            top: 600,
            left: -10,
            child: Row(children: [
              Image.asset(
                'assets/walking.gif',
                height: 110,
                width: 110,
              ),
              Image.asset(
                'assets/walking.gif',
                height: 110,
                width: 110,
              ),
              Image.asset(
                'assets/walking.gif',
                height: 110,
                width: 110,
              ),
              Image.asset(
                'assets/walking.gif',
                height: 110,
                width: 110,
              ),
            ])),
      ],
    );
  }
}
