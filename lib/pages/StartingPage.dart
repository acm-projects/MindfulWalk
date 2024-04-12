import 'package:flutter/material.dart';
import 'package:mindfulwalk/pages/CreateProfile.dart';
import 'package:mindfulwalk/pages/Login.dart';
import 'package:mindfulwalk/pages/LoginPage.dart';
import 'package:mindfulwalk/pages/SignUp.dart';
import 'package:google_fonts/google_fonts.dart';

class StartingPage extends StatelessWidget {
  const StartingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void navigateToNextPage() {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => CreateProfile(),
        ),
      );
    }

    // Use a Future.delayed to wait for 5 seconds before navigating to the next page
    //Future.delayed(Duration(seconds: 7), navigateToNextPage);

    return Scaffold(
      backgroundColor: Color(0xFFFFFEF6),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          FractionallySizedBox(
            heightFactor: .6,
            alignment: Alignment.topCenter,
            child: Image.asset(
              'assets/startingPageBackground.png', // Replace with your actual image path
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 25,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/overlay.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 432,
            left: 25,
            right: 70,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 5),
                  Text(
                    "Step into peace,\nExplore your city's grace.",
                    style: GoogleFonts.comfortaa(
                      textStyle: TextStyle(
                        color: Color(0xFF8B6B55),
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 470,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/fullLogo.png',
              height: 200,
              width: 300,
            ),
          ),
          Positioned(
            top: 600,
            left: 0,
            right: 0,
            child: Column(
              children: [
                const SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => Login(),
                      ),
                    );
                    // Add your button press logic here
                  },
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(Size(300, 70)),
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xFFFFA9A8)),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                  child: Text('Login',
                      style: GoogleFonts.jost(
                        textStyle: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      )),
                ),
              ],
            ),
          ),

          Positioned(
            top: 690,
            left: 0,
            right: 0,
            child: Column(
              children: [
                const SizedBox(height: 50),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => SignUp(),
                        ),
                      );
                    },
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(Size(300, 70)),
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xFFADC178)),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                    child: Text('Sign Up',
                        style: GoogleFonts.jost(
                            textStyle: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        )))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
