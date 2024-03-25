// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mindfulwalk/consts.dart';
import 'package:mindfulwalk/pages/MapPage.dart';

class LocationPage extends StatefulWidget {
  final String searchText;

  const LocationPage({Key? key, required this.searchText}) : super(key: key);

  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<LocationPage> {
  String name = '';
  String placeId = '';
  String photoReference = '';
  String photoUrl = '';
  String maxHeight = '';
  String maxWidth = '';

  @override
  void initState() {
    super.initState();
    // Call the textSearch function when the page is first built
    textSearch(widget.searchText);
    //getPlaceDescription(placeId);
  }

  // Getting placeId, Name, Address, and Photo
  Future<List<PlacePrediction>> textSearch(String query) async {
    final apiKey = GOOGLE_MAPS_API_KEY;
    final url =
        'https://maps.googleapis.com/maps/api/place/textsearch/json?query=$query&key=$apiKey';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print(data);
      setState(() {
        name = data['results'][0]['name'];
        placeId = data['results'][0]['place_id'];
        photoReference = data['results'][0]['photos'][0]['photo_reference'];
        maxHeight = data['results'][0]['photos'][0]['height'].toString();
        maxWidth = data['results'][0]['photos'][0]['width'].toString();
        photoUrl =
            'https://maps.googleapis.com/maps/api/place/photo?maxwidth=${maxWidth}&maxheight=${maxHeight}&photoreference=${photoReference}&key=${apiKey}';
      });
      print("Name: ${name} \n ID: ${placeId} \n PhotoUrl: ${photoUrl}");

      final urlDescription = Uri.https(
        'maps.googleapis.com',
        '/maps/api/place/details/json',
        {
          'placeid': placeId,
          'fields':
              'formatted_address,name,editorialSummary', // Specify desired fields
          'key': apiKey,
        },
      );

      print(urlDescription);

      final responseDescription = await http.get(urlDescription);

      if (responseDescription.statusCode == 200) {
        final dataDescription = jsonDecode(responseDescription.body);
        print(dataDescription);
        final result = data['result'] as Map;

        if (result.containsKey('description')) {
          final description = result['description'] as String;
          print(description);
        } else {
          print('Place description not found');
        }
      } else {
        print('Failed to get place details');
      }

      return (data['predictions'] as List)
          .map((prediction) => PlacePrediction.fromJson(prediction))
          .toList();
    } else {
      // Handle error
      throw Exception('Failed to get place predictions');
    }
  }

  //Getting a place description from placeId
  Future<String> getPlaceDescription(String placeId) async {
    final apiKey = GOOGLE_MAPS_API_KEY;
    final urlDescription = Uri.https(
      'maps.googleapis.com',
      '/maps/api/place/details/json',
      {
        'placeid': placeId,
        'fields':
            'formatted_address,name,description', // Specify desired fields
        'key': apiKey,
      },
    );

    print(urlDescription);

    final responseDescription = await http.get(urlDescription);

    if (responseDescription.statusCode == 200) {
      final data = jsonDecode(responseDescription.body);
      final result = data['result'] as Map;

      if (result.containsKey('description')) {
        final description = result['description'] as String;
        return description;
        print(description);
      } else {
        print('Place description not found');
        return ''; // Or a default message
      }
    } else {
      print('Failed to get place details');
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.fromLTRB(16.0, 25, 16, 0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset('assets/backArrow.png',
                      width: 40, height: 40)),
              SizedBox(height: 10),
              Expanded(
                  child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        photoUrl.isNotEmpty
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image.network(
                                  photoUrl,
                                  width: 340.0,
                                  height: 240.0,
                                  fit: BoxFit.fitWidth,
                                ),
                              )
                            : Center(child: CircularProgressIndicator()),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding:
                                const EdgeInsets.fromLTRB(5.0, 8, 16.0, 16.0),
                            child: Text(
                              '${name}',
                              style: GoogleFonts.raleway(
                                textStyle: TextStyle(
                                  color: Color(0xFF406440),
                                  fontWeight: FontWeight.w800,
                                  fontSize: 30,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 500.0,
                          width: 340,
                          decoration: BoxDecoration(
                            color: Color(0xFFEDE9D7),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 16),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      16.0, 0, 16.0, 16.0),
                                  child: Text(
                                    'Description of the locations         Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed viverra augue ut justo fermentum, vel dapibus arcu fermentum. Integer a purus ut mauris consequat aliquet. Vivamus vehicula vestibulum odio, ut laoreet tortor vehicula sit amet. Quisque vel malesuada urna. Nulla facilisi.',
                                    style: GoogleFonts.jost(
                                      textStyle: TextStyle(
                                        color: Color(0xFF4B5563),
                                        fontWeight: FontWeight.normal,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 16),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width:
                                    MediaQuery.of(context).size.width / 2 - 20,
                                height: 60,
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Add your button click logic here
                                    print('Button pressed!');
                                  },
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor:
                                        Color(0xFFADC178), // Text color
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          15.0), // Rounded corners
                                    ),
                                  ),
                                  child: Text(
                                    'Photos',
                                    style: GoogleFonts.jost(
                                      textStyle: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(0, 40, 8, 0),
                                  child: Text(
                                    'See more',
                                    style: GoogleFonts.jost(
                                      textStyle: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                      ),
                                    ),
                                  )),
                            ]),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image.asset('assets/walking-trail.jpg',
                                    width:
                                        MediaQuery.of(context).size.width / 2 -
                                            35,
                                    height: 130,
                                    fit: BoxFit.fill)),
                            SizedBox(width: 16),
                            ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image.asset('assets/walking-trail.jpg',
                                    width:
                                        MediaQuery.of(context).size.width / 2 -
                                            35,
                                    height: 130,
                                    fit: BoxFit.fill))
                          ],
                        ),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image.asset('assets/walking-trail.jpg',
                                    width:
                                        MediaQuery.of(context).size.width / 2 -
                                            35,
                                    height: 130,
                                    fit: BoxFit.fill)),
                            SizedBox(width: 16),
                            ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image.asset('assets/walking-trail.jpg',
                                    width:
                                        MediaQuery.of(context).size.width / 2 -
                                            35,
                                    height: 130,
                                    fit: BoxFit.fill))
                          ],
                        ),
                        SizedBox(height: 16),
                        Center(
                          child: Container(
                            width: double.infinity,
                            height: 60,
                            child: ElevatedButton(
                              onPressed: () {
                                // Add your button click logic here
                                print('Button pressed!');
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor:
                                    Color(0xFFFFA9A8), // Text color
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      12.0), // Rounded corners
                                ),
                              ),
                              child: Text(
                                'Start Walk',
                                style: GoogleFonts.raleway(
                                  textStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                      ]),
                ),
              ))
            ]),
      )),
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
                child: Image.asset('assets/homeSelected.png',
                    width: 45, height: 45),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.fromLTRB(0, 8, 30, 0),
                child: Image.asset('assets/diary.png', width: 50, height: 50),
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
                child: Image.asset('assets/profile.png', width: 40, height: 40),
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

class PlacePrediction {
  final String placeId;
  final String description;

  PlacePrediction({required this.placeId, required this.description});

  factory PlacePrediction.fromJson(Map<String, dynamic> json) =>
      PlacePrediction(
        placeId: json['place_id'],
        description: json['description'],
      );
}
