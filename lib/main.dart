import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mindfulwalk/pages/Explore.dart';
import 'package:mindfulwalk/pages/Health.dart';
import 'package:mindfulwalk/pages/HiName.dart';
//import 'package:mindfulwalk/pages/Locations.dart';
import 'package:mindfulwalk/pages/Login.dart';
import 'package:mindfulwalk/pages/NotesPage.dart';
import 'package:mindfulwalk/pages/NotificationsPage.dart';
import 'package:mindfulwalk/pages/PhotoGallery.dart';
import 'package:mindfulwalk/pages/healthWidgets/pedometer.dart';
import 'package:mindfulwalk/pages/PhotosPage.dart';
import 'package:mindfulwalk/pages/SettingsPage.dart';
import 'package:mindfulwalk/pages/SignUp.dart';
import 'package:mindfulwalk/pages/BookmarksPage.dart';
import 'package:mindfulwalk/pages/CreateProfile.dart';
import 'package:mindfulwalk/pages/EditProfile.dart';
import 'package:mindfulwalk/pages/LoadingPage.dart';
import 'package:mindfulwalk/pages/ProfilePage.dart';
import 'package:mindfulwalk/pages/StartingPage.dart';
import 'package:mindfulwalk/pages/LocationPage.dart';
import 'package:mindfulwalk/pages/MapPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mindfulwalk/pages/UrbanVentures.dart';
import 'package:mindfulwalk/pages/mapnew.dart';
import 'package:mindfulwalk/pages/mapstuff/mapmain.dart';
import 'package:mindfulwalk/pages/mapstuff/screens/home.dart';
import 'firebase_options.dart';
import 'package:camera/camera.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => ProfilePage(),
    },
  ));
}
