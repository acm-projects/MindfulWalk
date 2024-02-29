import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mindfulwalk/pages/Explore.dart';
import 'package:mindfulwalk/pages/Login.dart';
import 'package:mindfulwalk/pages/SignUp.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => Login(),
  },
));
