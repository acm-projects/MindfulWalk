import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mindfulwalk/pages/Explore.dart';
import 'package:mindfulwalk/pages/Locations.dart';
import 'package:mindfulwalk/pages/Login.dart';
import 'package:mindfulwalk/pages/NotificationsPage.dart';
import 'package:mindfulwalk/pages/PhotoGallery.dart';
import 'package:mindfulwalk/pages/PhotosPage.dart';
import 'package:mindfulwalk/pages/SettingsPage.dart';
import 'package:mindfulwalk/pages/SignUp.dart';
import 'package:mindfulwalk/pages/BookmarksPage.dart';
import 'package:mindfulwalk/pages/CreateProfile.dart';
import 'package:mindfulwalk/pages/EditProfile.dart';
import 'package:mindfulwalk/pages/LoadingPage.dart';
import 'package:mindfulwalk/pages/PhotoGallery.dart';
import 'package:mindfulwalk/pages/ProfilePage.dart';
import 'package:mindfulwalk/pages/StartingPage.dart';
import 'package:mindfulwalk/pages/LocationPage.dart';
import 'package:mindfulwalk/pages/MapPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mindfulwalk/pages/CameraPage.dart';
import 'package:mindfulwalk/pages/UrbanVentures.dart';
import 'firebase_options.dart';
import 'package:camera/camera.dart';
import 'package:mindfulwalk/pages/LoginPage.dart';

Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    cameras = await availableCameras();
  } on CameraException catch (e) {
    print('Error in fetching the cameras: $e');
  }

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => LoadingPage(),
      '/login': (context) => LoginPage(),
      '/signup': (context) => SignUp(),
      '/photos': (context) => PhotosPage(),
      '/settings': (context) => SettingsPage(),
      '/explore': (context) => Explore(),
      '/urbanventures': (context) => UrbanVentures(),
    },
  ));
}
