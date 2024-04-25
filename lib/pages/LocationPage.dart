// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mindfulwalk/consts.dart';
import 'package:mindfulwalk/pages/Health.dart';
import 'package:mindfulwalk/pages/MapPage.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:mindfulwalk/pages/PhotoGallery.dart';
import 'package:mindfulwalk/pages/PhotosPage.dart';
import 'package:mindfulwalk/pages/ProfilePage.dart';

var geminiDescription;
final List<String> photoUrlList = [];

Future<String?> gemini(String locationName) async {
  // Access your API key as an environment variable (see "Set up your API key" above)
  const apiKey = 'AIzaSyBh4EzZRZR7rCY7nFVsl94EY1xhA77cywE';
  // For text-only input, use the gemini-pro model
  final model = GenerativeModel(model: 'gemini-pro', apiKey: apiKey);
  final content = [
    Content.text(
        'Write a one paragraph location description for $locationName. The description should be like the ones you see on google.')
    //Content.text('Make a list of 10 walking trails near 7315 Marigold Dr, Irving, TX.')
  ];
  final response = await model.generateContent(content);
  //print("Name: $locationName");
  //print("Gemini: ${response.text}");
  return response.text;
}

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
    photoUrlList.clear(); // Clear the list before adding new URLs
  }

  // Getting placeId, Name, Address, and Photo
  Future<List<PlacePrediction>> textSearch(String query) async {
    final apiKey = GOOGLE_MAPS_API_KEY;
    final url =
        'https://maps.googleapis.com/maps/api/place/textsearch/json?query=$query&key=$apiKey';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      //print(data);
      setState(() {
        name = data['results'][0]['name'];
        placeId = data['results'][0]['place_id'];
        photoReference = data['results'][0]['photos'][0]['photo_reference'];
        maxHeight = data['results'][0]['photos'][0]['height'].toString();
        maxWidth = data['results'][0]['photos'][0]['width'].toString();
        photoUrl =
            'https://maps.googleapis.com/maps/api/place/photo?maxwidth=${maxWidth}&maxheight=${maxHeight}&photoreference=${photoReference}&key=${apiKey}';
      });
      geminiDescription = gemini(name);

      final urlPhotos = Uri.https(
        'maps.googleapis.com',
        '/maps/api/place/details/json',
        {
          'placeid': placeId,
          'fields': 'formatted_address,name,photos', // Specify desired fields
          'key': apiKey,
        },
      );
      final responseDescription = await http.get(urlPhotos);
      if (responseDescription.statusCode == 200) {
        final dataDescription = jsonDecode(responseDescription.body);
        final photoData = dataDescription['result']['photos'];
        print('PHOTO Data________________: $photoData');
        String photoUrlx = '';
        String photoReferencex = '';
        String maxHeightx = '';
        String maxWidthx = '';

        for (int i = 0; i < photoData.length; i++) {
          //print("Iteration PhotoUrlList: $photoUrlx");

          photoReferencex = photoData[i]['photo_reference'];
          print("Photoreferenx       :       $photoReferencex");
          maxHeightx = photoData[i]['height'].toString();
          maxWidthx = photoData[i]['width'].toString();
          photoUrlx =
              'https://maps.googleapis.com/maps/api/place/photo?maxwidth=${maxWidthx}&maxheight=${maxHeightx}&photoreference=${photoReferencex}&key=${apiKey}';

          setState(() {});
          photoUrlList.add(photoUrlx);
        }

        print("PhotoURLlist__________________________: $photoUrlList");

        final result = data['result'];

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

  Future<String> _getImageUrl(i) async {
    return photoUrlList[i]; // Replace with your actual image URL
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
                  child: Padding(
                padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        photoUrl.isNotEmpty
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(30.0),
                                child: Image.network(
                                  photoUrl,
                                  width: 340.0,
                                  height: 240.0,
                                  fit: BoxFit.cover,
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
                          height: 400.0,
                          width: 340,
                          decoration: BoxDecoration(
                            color: Color(0xFFEDE9D7),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                SizedBox(height: 16),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        16.0, 0, 16.0, 16.0),
                                    child: FutureBuilder<String?>(
                                      future: geminiDescription,
                                      builder: (BuildContext context,
                                          AsyncSnapshot<String?> snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          // Display a loading indicator while waiting for the future to complete
                                          return Column(
                                            children: [
                                              SizedBox(height: 100),
                                              Align(
                                                  alignment:
                                                      Alignment.bottomCenter,
                                                  child:
                                                      CircularProgressIndicator()),
                                            ],
                                          );
                                        } else {
                                          if (snapshot.hasData) {
                                            // If the future completed successfully, display the data
                                            return Text(
                                              snapshot.data ??
                                                  '', // Display the data or a default value if null
                                              style: GoogleFonts.jost(
                                                textStyle: TextStyle(
                                                  color: Color(0xFF4B5563),
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 20,
                                                ),
                                              ),
                                            );
                                          } else {
                                            // Handle other states, such as ConnectionState.done
                                            return Text('Loading...');
                                          }
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        photoUrlList.isNotEmpty
                            ? Row(
                                children: [
                                  FutureBuilder<String>(
                                    future: _getImageUrl(1),
                                    builder: (BuildContext context,
                                        AsyncSnapshot<String> snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        // While the future is still in progress, display a loading indicator
                                        return CircularProgressIndicator();
                                      } else {
                                        // If the image URL is fetched successfully, display the image using Image.network
                                        return ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          child: Image.network(snapshot.data!,
                                              width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2 -
                                                  35,
                                              height: 130,
                                              fit: BoxFit.fill),
                                        );
                                      }
                                    },
                                  ),
                                  SizedBox(width: 16),
                                  FutureBuilder<String>(
                                    future: _getImageUrl(2),
                                    builder: (BuildContext context,
                                        AsyncSnapshot<String> snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        // While the future is still in progress, display a loading indicator
                                        return CircularProgressIndicator();
                                      } else {
                                        // If the image URL is fetched successfully, display the image using Image.network
                                        return ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          child: Image.network(snapshot.data!,
                                              width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2 -
                                                  35,
                                              height: 130,
                                              fit: BoxFit.fill),
                                        );
                                      }
                                    },
                                  ),
                                ],
                              )
                            : SizedBox(height: 500),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            FutureBuilder<String>(
                              future: _getImageUrl(3),
                              builder: (BuildContext context,
                                  AsyncSnapshot<String> snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  // While the future is still in progress, display a loading indicator
                                  return CircularProgressIndicator();
                                } else {
                                  // If the image URL is fetched successfully, display the image using Image.network
                                  return ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: Image.network(snapshot.data!,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                    2 -
                                                35,
                                        height: 130,
                                        fit: BoxFit.fill),
                                  );
                                }
                              },
                            ),
                            SizedBox(width: 16),
                            FutureBuilder<String>(
                              future: _getImageUrl(4),
                              builder: (BuildContext context,
                                  AsyncSnapshot<String> snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  // While the future is still in progress, display a loading indicator
                                  return CircularProgressIndicator();
                                } else {
                                  // If the image URL is fetched successfully, display the image using Image.network
                                  return ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: Image.network(snapshot.data!,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                    2 -
                                                35,
                                        height: 130,
                                        fit: BoxFit.fill),
                                  );
                                }
                              },
                            ),
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
                              child: GestureDetector(
                                onTap: () {
                                  // Navigate to the MapPage and pass necessary information as arguments
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MapPage(
                                        placeIdChosen: placeId,
                                      ),
                                    ),
                                  );
                                },
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
                child: GestureDetector(
                    onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PhotoGallery()),
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
                child: GestureDetector(
                    onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Health()),
                        ),
                    child: Image.asset('assets/health.png',
                        width: 50, height: 50)),
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
