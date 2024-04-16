// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mindfulwalk/consts.dart';
import 'package:mindfulwalk/pages/HiName.dart';
import 'package:mindfulwalk/pages/MapPage.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:location/location.dart';
import 'package:mindfulwalk/pages/PhotosPage.dart';
import 'package:mindfulwalk/pages/ProfilePage.dart';

var geminiLocationList;
var currentLocation = '';
List<String> photoUrlList = [];
String photo1 = '';
List<String> locationNames = [];
List<String> addresses = [];

List<String> parseLocations(String text) {
  List<String> locations = [];

  // Split the text by line breaks
  List<String> lines = text.split('\n');

  // Iterate through each line
  for (String line in lines) {
    // Remove leading and trailing whitespace
    line = line.trim();

    // Check if the line starts with a number followed by a dot
    if (RegExp(r'^\d+\.\s').hasMatch(line)) {
      // Extract the location name after the dot
      String location = line.split('.').sublist(1).join('.').trim();

      // Add the location to the list
      locations.add(location);
    }
  }

  return locations;
}

class UrbanVentures extends StatefulWidget {
  const UrbanVentures({super.key});

  @override
  State<UrbanVentures> createState() => _UrbanVenturesState();
}

class _UrbanVenturesState extends State<UrbanVentures> {
  String name = '';
  String placeId = '';
  String photoReference = '';
  String photoUrl = '';
  String maxHeight = '';
  String maxWidth = '';

  void fetchLocationAndGemini() async {
    await getCurrentAddress(); // Wait for current address to be fetched
    photoUrlList.clear(); // Clear the list before adding new URLs
    //print("\n\n\nGEMINILOCATIONLIST: ${geminiLocationList}");
  }

  Future<String?> gemini(String locationName) async {
    // Access your API key as an environment variable (see "Set up your API key" above)
    const apiKey = 'AIzaSyBh4EzZRZR7rCY7nFVsl94EY1xhA77cywE';
    // For text-only input, use the gemini-pro model
    final model = GenerativeModel(model: 'gemini-pro', apiKey: apiKey);
    final content = [
      Content.text(
          'Make a numbered list of 5 urban walks in the largest city near me. My current location is $locationName. Do not use any syntax or markdown. I only want names of places and the city.')
    ];
    final response = await model.generateContent(content);
    //print("Gemini: ${response.text}");
    geminiLocationList = response.text;
    addresses = parseLocations(geminiLocationList);
    print("ADDRESSES: ${addresses}");
    print("Length: ${addresses.length}");
    print("Address 4: ${addresses[3]}");
    for (int i = 0; i < addresses.length; i++) {
      await textSearch(addresses[i], i);
      print("Place: ${locationNames[i]}");
      print("Photo: ${photoUrlList[i]}");
    }

    return response.text;
  }

// Getting placeId, Name, Address, and Photo
  Future<void> textSearch(String query, int i) async {
    final apiKey = GOOGLE_MAPS_API_KEY;
    final url =
        'https://maps.googleapis.com/maps/api/place/textsearch/json?query=$query&key=$apiKey';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      name = data['results'][0]['name'];
      placeId = data['results'][0]['place_id'];
      photoReference = data['results'][0]['photos'][0]['photo_reference'];
      maxHeight = data['results'][0]['photos'][0]['height'].toString();
      maxWidth = data['results'][0]['photos'][0]['width'].toString();
      photoUrl =
          'https://maps.googleapis.com/maps/api/place/photo?maxwidth=${maxWidth}&maxheight=${maxHeight}&photoreference=${photoReference}&key=${apiKey}';

      //print("\n\n\nName: ${name}");
      //print("PHOTOURL: ${photoUrl}\n\n\n");
      setState(() {
        //photoUrlList[i] = photoUrl;
        photoUrlList.add(photoUrl);
        locationNames.add(name);
      });
    } else {
      // Handle error
      throw Exception('Failed to get place predictions');
    }
  }

  Future<String?> getCurrentAddress() async {
    Location location = Location();
    LocationData? currentLocation;

    try {
      currentLocation = await location.getLocation();
      final latitude = currentLocation.latitude!;
      final longitude = currentLocation.longitude!;
      final apiKey =
          'AIzaSyAUQqJRizh2NeZWIAbrtLO6F5VafF3Rvj4'; // Replace with your Google Maps API key
      final url =
          'https://maps.googleapis.com/maps/api/geocode/json?latlng=$latitude,$longitude&key=$apiKey';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['status'] == 'OK') {
          setState() {
            currentLocation = data['results'][0]['formatted_address'];
          }

          print(
              "\n\n\ngetCurrentAddress Success!:  ${data['results'][0]['formatted_address']}");
          await gemini(data['results'][0]['formatted_address']);
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

  @override
  void initState() {
    super.initState();
    fetchLocationAndGemini();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset('assets/backArrow.png',
                      width: 40, height: 40)),
              Text(
                'Urban Ventures',
                style: GoogleFonts.raleway(
                  textStyle: TextStyle(
                    color: Color(0xFF406440),
                    fontWeight: FontWeight.w800,
                    fontSize: 40,
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
                              child: photoUrlList.isNotEmpty
                                  ? Image.network(
                                      photoUrlList[0],
                                      width: 340,
                                      height: 120,
                                      fit: BoxFit.cover,
                                    )
                                  : CircularProgressIndicator(),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  16.0, 8, 16.0, 16.0),
                              child: locationNames.isNotEmpty
                                  ? Text(
                                      '${locationNames[0]}',
                                      style: GoogleFonts.raleway(
                                        textStyle: TextStyle(
                                          color: Color(0xFF4B5563),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25,
                                        ),
                                      ),
                                    )
                                  : CircularProgressIndicator(),
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
                child: GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HiName()),
                  ),
                  child: Image.asset('assets/homeSelected.png',
                      width: 45, height: 45),
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.fromLTRB(0, 8, 30, 0),
                child: GestureDetector(
                    onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PhotosPage()),
                        ),
                    child: Image.asset('assets/photoIcon.png',
                        width: 50, height: 50)),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 35, 0),
                child: GestureDetector(
                    onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MapPage()),
                        ),
                    child:
                        Image.asset('assets/map.png', width: 50, height: 50)),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.fromLTRB(0, 5, 30, 0),
                child: Image.asset('assets/health.png', width: 50, height: 50),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 30, 0),
                child: GestureDetector(
                    onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfilePage()),
                        ),
                    child: Image.asset('assets/profile.png',
                        width: 40, height: 40)),
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
