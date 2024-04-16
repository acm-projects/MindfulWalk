import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mindfulwalk/pages/mapstuff/screens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ui/splash.dart';
import 'package:permission_handler/permission_handler.dart';

late SharedPreferences sharedPreferences;

class MapMain extends StatefulWidget {
  const MapMain({super.key});

  @override
  State<MapMain> createState() => _MapMainState();
}

class _MapMainState extends State<MapMain> {
  void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    sharedPreferences = await SharedPreferences.getInstance();
    await dotenv.load(fileName: "assets/config/.env");
  }

  Future<void> requestLocationPermission() async {
    final locationStatus = await Permission.location.request();
    if (locationStatus == PermissionStatus.granted) {
      // Location permission granted, proceed with your logic.
      print('Location permission granted!');
    } else if (locationStatus == PermissionStatus.permanentlyDenied) {
      // Permission permanently denied, handle this case.
      openAppSettings();
    } else {
      // Handle other permission status (e.g., denied)
    }
  }

  @override
  void initState() {
    super.initState();
    requestLocationPermission();
    main();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Mapbox Flutter',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.indigo,
            textTheme:
                GoogleFonts.openSansTextTheme(Theme.of(context).textTheme)),
        home: Splash());
  }
}
