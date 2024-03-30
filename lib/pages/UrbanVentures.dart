// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mindfulwalk/consts.dart';
import 'package:mindfulwalk/pages/MapPage.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:location/location.dart';

var currentLocation = '';

Future<String?> gemini(String locationName) async {
  // Access your API key as an environment variable (see "Set up your API key" above)
  const apiKey = 'AIzaSyBh4EzZRZR7rCY7nFVsl94EY1xhA77cywE';
  // For text-only input, use the gemini-pro model
  final model = GenerativeModel(model: 'gemini-pro', apiKey: apiKey);
  final content = [
    Content.text(
        'Make a list of 10 urban places that I can walk near $currentLocation')
  ];
  final response = await model.generateContent(content);
  //print("Name: $locationName");
  //print("Gemini: ${response.text}");
  return response.text;
}

class UrbanVentures extends StatefulWidget {
  const UrbanVentures({super.key});

  @override
  State<UrbanVentures> createState() => _UrbanVenturesState();
}

Future<String?> getCurrentAddress() async {
  Location location = Location();
  LocationData? currentLocation;

  try {
    currentLocation = await location.getLocation();
    final latitude = currentLocation.latitude!;
    final longitude = currentLocation.longitude!;
    final apiKey = 'YOUR_API_KEY'; // Replace with your Google Maps API key
    final url =
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$latitude,$longitude&key=$apiKey';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['status'] == 'OK') {
        return data['results'][0]['formatted_address'];
      } else {
        return null;
      }
    } else {
      throw Exception('Failed to fetch address');
    }
  } catch (e) {
    print('Error: $e');
    return null;
  }
}

class _UrbanVenturesState extends State<UrbanVentures> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset('assets/backArrow.png'),
          onPressed: null, // Disabling the back button
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Urban Ventures',
                style: GoogleFonts.raleway(
                  textStyle: TextStyle(
                    color: Color(0xFF406440),
                    fontWeight: FontWeight.w800,
                    fontSize: 55,
                  ),
                ),
              ),
              Text(
                'Choose a location:',
                style: GoogleFonts.raleway(
                  textStyle: TextStyle(
                    color: Color(0xFF406440),
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Expanded(
                child: SingleChildScrollView(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      height: 200.0,
                      decoration: BoxDecoration(
                        color: Color(0xFFEDE9D7),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 1.0, top: 5.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image.asset(
                                'assets/LegacyWest.jpeg',
                                width: 340.0,
                                height: 120.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  16.0, 8, 16.0, 16.0),
                              child: Text(
                                'Legacy West',
                                style: GoogleFonts.raleway(
                                  textStyle: TextStyle(
                                    color: Color(0xFF4B5563),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Container(
                      height: 200.0,
                      decoration: BoxDecoration(
                        color: Color(0xFFEDE9D7),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 1.0, top: 5.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image.asset(
                                'assets/BishopArts.jpeg',
                                width: 340.0,
                                height: 120.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  16.0, 8, 16.0, 16.0),
                              child: Text(
                                'Bishop Arts',
                                style: GoogleFonts.raleway(
                                  textStyle: TextStyle(
                                    color: Color(0xFF4B5563),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Container(
                      height: 200.0,
                      decoration: BoxDecoration(
                        color: Color(0xFFEDE9D7),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 1.0, top: 5.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image.asset(
                                'assets/OakLawn.jpeg',
                                width: 340.0,
                                height: 120.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  16.0, 8, 16.0, 16.0),
                              child: Text(
                                'Oak Lawn',
                                style: GoogleFonts.raleway(
                                  textStyle: TextStyle(
                                    color: Color(0xFF4B5563),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.0),
                  ],
                )),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Color(0xFFFFA9A8),
        ),
        child: BottomNavigationBar(
          currentIndex: 0,
          selectedItemColor: Colors
              .white, // we can change this if we want text under each icon
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Image.asset('assets/Home.png', width: 45, height: 45),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.fromLTRB(0, 8, 30, 0),
                child: Image.asset('assets/Photo.png', width: 50, height: 50),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 35, 0),
                child: Image.asset('assets/Map.png', width: 50, height: 50),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.fromLTRB(0, 5, 30, 0),
                child: Image.asset('assets/Health.png', width: 50, height: 50),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 30, 0),
                child: Image.asset('assets/Profile.png', width: 40, height: 40),
              ),
              label: '',
            ),
          ],
          onTap: (index) {
            // Handle button tap
          },
        ),
      ),
    );
  }
}
