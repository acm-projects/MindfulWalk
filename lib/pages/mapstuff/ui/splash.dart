import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../helpers/mapbox_handler.dart';
import '../mapmain.dart';
import '../screens/home.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    initializeLocationAndSave();
  }

  void initializeLocationAndSave() async {
    // Ensure all permissions are collected for Locations
    Location _location = Location();
    bool? _serviceEnabled;
    PermissionStatus? _permissionGranted;

    print("HERE1");

    _serviceEnabled = await _location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await _location.requestService();
    }

    print("HERE2");

    _permissionGranted = await _location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _location.requestPermission();
    }
    print("HERE3");

    // Get the current user location
    LocationData _locationData = await _location.getLocation();
    LatLng currentLocation =
        LatLng(_locationData.latitude!, _locationData.longitude!);
    print("HERE4");

    // Get the current user address
    String currentAddress = '';
    try {
      final geocodedData = await getParsedReverseGeocoding(currentLocation);
      currentAddress = geocodedData['place'];
    } catch (error) {
      print('Error retrieving address: $error');
      // Handle the error gracefully, e.g., display an error message to the user
    }

    // Store the user location in sharedPreferences
    sharedPreferences.setDouble('latitude', _locationData.latitude!);
    print("HERE5");

    sharedPreferences.setDouble('longitude', _locationData.longitude!);
    print("HERE6");

    sharedPreferences.setString('current-address', currentAddress);

    print("HERE7");

    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (_) => const Home()), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.indigo,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            CupertinoIcons.car_detailed,
            color: Colors.white,
            size: 120,
          ),
          Text(
            'Mapbox Cabs',
            style: Theme.of(context)
                .textTheme
                .headlineLarge
                ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
