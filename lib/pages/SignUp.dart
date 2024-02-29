// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mindfulwalk/pages/Login.dart';

void main() {
  runApp(SignUp());
}

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFEF6),
      body: Column(
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
                Image.asset('assets/logo.png', width: 70.0, height: 70.0,),
              ],
            ),
          ),
          SizedBox(height: 40),
          Text(
            'Please sign up to continue:',
            style: TextStyle(
              fontSize: 20,
              color: const Color(0xff5B8C5A),
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 20),
          buildTextFieldWithLabel(
            controller: _usernameController,
            labelText: 'Email:',
            isFocused: _isUsernameFocused,
          ),
          SizedBox(height: 17),
          buildTextFieldWithLabel(
            controller: _passwordController,
            labelText: 'Password:',
            isFocused: _isPasswordFocused,
            isPassword: true,
          ),
          SizedBox(height: 17),
          buildTextFieldWithLabel(
            controller: _confirmPasswordController,
            labelText: 'Confirm Password:',
            isFocused: _isConfirmPasswordFocused,

          ),
          SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {
              String username = _usernameController.text;
              String password = _passwordController.text;

              // Validate credentials (this is a simple example, do not use in production)
              if (username == 'user' && password == 'password') {
                print('Login successful');
              } else {
                print('Login failed');
              }
            },
            style: ElevatedButton.styleFrom(
              primary: const Color(0xffADC178),
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
              style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 35),
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
              // Navigate to the desired page here
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
                  decoration: TextDecoration. underline,
                ),
              ),
        ),
        ],
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
            style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black, fontSize: 28),
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