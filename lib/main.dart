import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mindfulwalk/pages/Explore.dart';
import 'package:mindfulwalk/pages/Login.dart';
import 'package:mindfulwalk/pages/SignUp.dart';
import 'package:mindfulwalk/pages/BookmarksPage.dart';
import 'package:mindfulwalk/pages/CreateProfile.dart';
import 'package:mindfulwalk/pages/EditProfile.dart';
import 'package:mindfulwalk/pages/LoadingPage.dart';
import 'package:mindfulwalk/pages/PhotoGallery.dart';
import 'package:mindfulwalk/pages/ProfilePage.dart';
import 'package:mindfulwalk/pages/StartingPage.dart';
import 'package:mindfulwalk/pages/MapPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => MapPage(),
    },
  ));
}
