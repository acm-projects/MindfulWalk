import 'dart:async';

import 'package:flutter/material.dart';
import 'StartingPage.dart';

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
    Timer(Duration(seconds: 5), () {
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
              center: Alignment.center,
              radius: 0.6,
              transform: GradientRotation(1.5708),
              colors: [
                Color(0xFFFFFEF6),
                Color(0xFFFCB7B6),
              ],
            ),
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 150),
              Container(
                width: 600,
                height: 250,
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 400,
                  height: 300,
                ),
              ),
              SizedBox(height: 5),
              Container(
                width: 400,
                height: 100,
                child: Image.asset(
                  'assets/images/Mindful Walk.png',
                  width: 200,
                  height: 100,
                ),
              ),
              SizedBox(height: 5),
              Text(
                "Step into peace,\nExplore your city's grace.",
                style: TextStyle(
                  color: Color(0xFF8B6B55),
                  fontSize: 20,
                  decoration: TextDecoration.none,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
