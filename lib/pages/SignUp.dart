import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:mindfulwalk/pages/CreateProfile.dart';
import 'package:mindfulwalk/pages/Explore.dart';
import 'package:mindfulwalk/pages/Login.dart';
import 'dart:typed_data';

import 'package:mindfulwalk/pages/PhotoGallery.dart';

void main() {
  runApp(SignUp());
}

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MindfulWalk',
      home: MindfulWalkPage(),
    );
  }
}

class MindfulWalkPage extends StatefulWidget {
  @override
  _MindfulWalkPageState createState() => _MindfulWalkPageState();
}

class _MindfulWalkPageState extends State<MindfulWalkPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  bool _isUsernameFocused = false;
  bool _isPasswordFocused = false;
  bool _isConfirmPasswordFocused = false;
  String _errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFEF6),
      body: SingleChildScrollView(
        child: Stack(children: [
          Positioned(
              top: 250,
              child: Expanded(
                child: Image.asset(
                  'assets/login-signup-overlay.png',
                  width: 500,
                ),
              )),
          Column(
            children: [
              SizedBox(height: 100),
              Container(
                height: 100,
                color: const Color(0x7fDAD5B5),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'MindfulWalk',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff727C90),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Image.asset(
                      'assets/logo.png',
                      width: 70.0,
                      height: 70.0,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 100),
              Text(
                'Please sign up to continue:',
                style: TextStyle(
                  fontSize: 20,
                  color: const Color(0xff5B8C5A),
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 10),
              buildTextFieldWithLabel(
                controller: _usernameController,
                labelText: 'Email:',
                isFocused: _isUsernameFocused,
              ),
              SizedBox(height: 10),
              buildTextFieldWithLabel(
                controller: _passwordController,
                labelText: 'Password:',
                isFocused: _isPasswordFocused,
                isPassword: true,
              ),
              SizedBox(height: 10),
              buildTextFieldWithLabel(
                controller: _confirmPasswordController,
                labelText: 'Confirm Password:',
                isFocused: _isConfirmPasswordFocused,
                isPassword: true,
              ),
              SizedBox(height: 20),
              if (_errorMessage.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.fromLTRB(35, 10, 35, 20),
                  child: Text(
                    _errorMessage,
                    style: TextStyle(color: Colors.red, fontSize: 16),
                  ),
                ),
              ElevatedButton(
                onPressed: () async {
                  String username = _usernameController.text.trim();
                  String password = _passwordController.text.trim();
                  String confirmPassword =
                      _confirmPasswordController.text.trim();

                  if (password == confirmPassword && password.isNotEmpty) {
                    try {
                      // Sign up user with Firebase Auth
                      UserCredential userCredential = await FirebaseAuth
                          .instance
                          .createUserWithEmailAndPassword(
                        email: username,
                        password: password,
                      );
                      // Get the user's ID
                      userID = userCredential.user!.uid;
                      await FirebaseFirestore.instance
                          .collection('Users')
                          .doc(userID)
                          .set({
                        'Name': "",
                        'Username': "",
                        "Bio": "",
                        "Favorite Quote": "",
                        'DateOfBirth': FieldValue.serverTimestamp(),
                        "Gender": "",
                        "Height": 0,
                        "HomeLocation": GeoPoint(37.4219983, -122.084),
                        "ProfilePictureURL": "",
                        "BodyWeight": 0,
                        "Username": "",
                        // Add more fields as needed
                      });

                      // Create a reference to the directory inside the Images folder with the user's ID
                      Reference ref =
                          FirebaseStorage.instance.ref('Images/$userID');

                      // Create the directory by uploading an empty byte array
                      await ref.putData(Uint8List(0));

                      print('Sign Up successful');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CreateProfile()),
                      );
                    } catch (e) {
                      setState(() {
                        _errorMessage = e.toString();
                      });
                      return;
                    }
                  } else {
                    setState(() {
                      _errorMessage =
                          'Passwords do not match or fields are empty';
                    });
                    print('Passwords do not match or fields are empty');
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffADC178),
                  padding: EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 145, // Adjust the width as needed
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
                child: Text(
                  'Sign up',
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Already have an account?",
                style: TextStyle(
                  fontSize: 22,
                  color: const Color(0xff7B9E87),
                  fontStyle: FontStyle.normal,
                ),
              ),
              SizedBox(height: 7),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                },
                child: Text(
                  "Login here",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              SizedBox(height: 50)
            ],
          ),
        ]),
      ),
    );
  }

  Widget buildTextFieldWithLabel({
    required TextEditingController controller,
    required String labelText,
    required bool isFocused,
    bool isPassword = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            labelText,
            style: TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.black,
                fontSize: 28),
          ),
        ),
        SizedBox(height: 8),
        Container(
          width: 350, // Adjust the width as needed
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            decoration: BoxDecoration(
              border: Border.all(
                color: isFocused ? Colors.blue : Colors.grey,
              ),
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.white,
            ),
            child: TextField(
              controller: controller,
              obscureText: isPassword,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                border: InputBorder.none,
              ),
              onChanged: (text) {
                setState(() {
                  if (labelText == 'Email') {
                    _isUsernameFocused = text.isNotEmpty;
                  } else if (labelText == 'Password') {
                    _isPasswordFocused = text.isNotEmpty;
                  }
                });
              },
              onTap: () {
                setState(() {
                  if (labelText == 'Email') {
                    _isUsernameFocused = true;
                    _isPasswordFocused = false;
                  } else if (labelText == 'Password') {
                    _isPasswordFocused = true;
                    _isUsernameFocused = false;
                  }
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
