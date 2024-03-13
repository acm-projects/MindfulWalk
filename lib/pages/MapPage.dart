// ignore_for_file: prefer_const_constructors

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:location/location.dart';
import 'dart:math';
import 'dart:async';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:mindfulwalk/consts.dart';
import 'package:geocoding/geocoding.dart' as gc;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

String? distance;
String? duration;
String? formattedETA;

class _MapPageState extends State<MapPage> {
  TextEditingController _searchController = TextEditingController();
  // Both of these will change when the search icon is clicked
  bool isSearchClicked = false;
  String? destinationString;

  // Google maps and polyline stuff begins here
  Location _locationController = new Location();
  final Completer<GoogleMapController> _mapController =
      Completer<GoogleMapController>();

  LatLng _pDestination = LatLng(32.9856, -96.7502);
  LatLng? _currentP;

  Map<PolylineId, Polyline> polylines = {};

  @override
  void initState() {
    super.initState();
    getLocationUpdates();
  }

  Future<void> _cameraToPosition(LatLng pos) async {
    final GoogleMapController controller = await _mapController.future;
    CameraPosition _newCameraPosition = CameraPosition(
      target: pos,
      zoom: 13,
    );
    await controller.animateCamera(
      CameraUpdate.newCameraPosition(_newCameraPosition),
    );
  }

  Future<void> getLocationUpdates() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await _locationController.serviceEnabled();
    if (_serviceEnabled) {
      _serviceEnabled = await _locationController.requestService();
    } else {
      return;
    }

    _permissionGranted = await _locationController.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _locationController.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationController.onLocationChanged
        .listen((LocationData currentLocation) {
      if (currentLocation.latitude != null &&
          currentLocation.longitude != null) {
        setState(() {
          _currentP =
              LatLng(currentLocation.latitude!, currentLocation.longitude!);
          // Fetch polyline points only when _currentP is not null
          if (_currentP != null) {
            getPolylinePoints().then((coordinates) {
              generatePolyLineFromPoints(coordinates);
            });
          }
          // Move the camera to the average position of the origin and destination points
          double avgLat = (_currentP!.latitude + _pDestination.latitude) / 2;
          double avgLng = (_currentP!.longitude + _pDestination.longitude) / 2;
          LatLng median = LatLng(avgLat, avgLng);

          //_cameraToPosition(median);
        });
      }
    });
  }

  Future<List<LatLng>> getPolylinePoints() async {
    List<LatLng> polylineCoordinates = [];
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      GOOGLE_MAPS_API_KEY,
      PointLatLng(_currentP!.latitude, _currentP!.longitude),
      PointLatLng(_pDestination.latitude, _pDestination.longitude),
      travelMode: TravelMode.walking,
    );
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    } else {
      print("ERROR: ");
      print(result.errorMessage);
    }
    return polylineCoordinates;
  }

  void generatePolyLineFromPoints(List<LatLng> polylineCoordinates) async {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
        polylineId: id,
        color: Colors.black,
        points: polylineCoordinates,
        width: 8);
    setState(() {
      polylines[id] = polyline;
    });
  }

  // Converting string address to LatLang for google maps
  Future<void> _getLatLngFromAddress() async {
    try {
      List<gc.Location> locations =
          await gc.locationFromAddress(destinationString!);
      if (locations.isNotEmpty) {
        gc.Location first = locations.first;
        _pDestination = LatLng(first.latitude, first.longitude);
        print('Latitude: ${first.latitude}, Longitude: ${first.longitude}');
        // Do something with latitude and longitude
      } else {
        print('No location found for the address: $destinationString');
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }

  // Function for getting the ETA and miles away for destinations
  Future<void> getDistanceAndTime() async {
    if (_currentP == null || _pDestination == null) {
      return;
    }

    final String baseUrl =
        'https://maps.googleapis.com/maps/api/directions/json?';
    final String origin =
        'origin=${_currentP!.latitude},${_currentP!.longitude}';
    final String destination =
        'destination=${_pDestination.latitude},${_pDestination.longitude}';
    final String apiKey = GOOGLE_MAPS_API_KEY;

    final String url = '$baseUrl$origin&$destination&key=$apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final routes = data['routes'] as List;
      final route = routes.isNotEmpty ? routes[0] : null;
      final legs = route != null ? route['legs'] as List : null;
      final leg = legs != null ? legs[0] : null;

      if (leg != null) {
        distance = leg['distance']['text'];
        duration = leg['duration']['text'];
        final durationInSeconds = leg['duration']['value'] as int;
        final DateTime currentTime = DateTime.now();
        final DateTime estimatedArrivalTime =
            currentTime.add(Duration(seconds: durationInSeconds));

        formattedETA = DateFormat.jm().format(estimatedArrivalTime);

        print('Distance: $distance');
        print('Duration: $duration');
        print('ETA: $formattedETA');
      }
    } else {
      print('Failed to load directions');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
        child: _currentP == null
            ? const Center(child: Text("Loading..."))
            : GoogleMap(
                zoomControlsEnabled: false,
                myLocationButtonEnabled: false,
                onMapCreated: ((GoogleMapController controller) =>
                    _mapController.complete(controller)),
                initialCameraPosition:
                    CameraPosition(target: _currentP!, zoom: 15),
                markers: {
                  Marker(
                    markerId: MarkerId("_currentLocation"),
                    infoWindow: const InfoWindow(title: 'Origin'),
                    icon: BitmapDescriptor.defaultMarkerWithHue(210),
                    position: _currentP!,
                  ),
                  Marker(
                    markerId: MarkerId("_destinationLocation"),
                    infoWindow: const InfoWindow(title: 'Destination'),
                    icon: BitmapDescriptor.defaultMarker,
                    position: _pDestination,
                  ),
                },
                polylines: Set<Polyline>.of(polylines.values),
              ),
      ),

      Positioned(
          top: 30,
          left: 20,
          child: GestureDetector(
              onTap: () {
                setState(() {
                  if (isSearchClicked = true) {
                    isSearchClicked = false;
                  }
                });
              },
              child:
                  Image.asset('assets/backArrow.png', width: 40, height: 40))),
      // Positioned(top: 150, left: 20, right: 20, child: Directions()),
      Positioned(
        top: isSearchClicked ? 550 : 650,
        left: 20,
        right: 20,
        child: isSearchClicked
            ? Directions()
            : Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                decoration: BoxDecoration(
                  color: Color(0xFFFFA9A8), // Set the background color
                  borderRadius:
                      BorderRadius.circular(15.0), // Add curved corners
                ),
                child: Column(children: [
                  TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Search Location',
                        hintStyle: GoogleFonts.jost(
                          textStyle: TextStyle(
                            color: Color(0xFF5B8C5A).withOpacity(0.5),
                            fontSize: 24,
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 6.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        prefix: SizedBox(width: 20),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.search,
                              color: Color(0xFF406440), size: 35),
                          onPressed: () {
                            destinationString = _searchController.text;
                            setState(() {
                              isSearchClicked = true;
                              print(destinationString);
                              _getLatLngFromAddress().then((_) {
                                getDistanceAndTime();
                              });
                            });
                          },
                        ),
                      )),
                  SizedBox(height: 12),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                        width: double.infinity,
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                        decoration: BoxDecoration(
                          color: Color(0xFFADC178), // Set the background color
                          borderRadius:
                              BorderRadius.circular(15.0), // Add curved corners
                        ),
                        child: Row(children: [
                          Text(
                            'Use my location',
                            style: GoogleFonts.jost(
                              textStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 24,
                              ),
                            ),
                          ),
                          Spacer(),
                          Image.asset('assets/myLocationIcon.png',
                              height: 35, width: 35)
                        ])),
                  ),
                ]),
              ),
      )
    ]));
  }
}

class Directions extends StatefulWidget {
  const Directions({super.key});

  @override
  State<Directions> createState() => _DirectionsState();
}

class _DirectionsState extends State<Directions> {
  bool continueClicked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: continueClicked
          ? ETA()
          : Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(
                color: Color(0xFFADC178), // Set the background color
                borderRadius: BorderRadius.circular(15.0), // Add curved corners
              ),
              child: Column(
                children: [
                  Container(
                      width: double.infinity,
                      height: 180,
                      padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                      decoration: BoxDecoration(
                        color: Color(0xFFEDE9D7), // Set the background color
                        borderRadius:
                            BorderRadius.circular(15.0), // Add curved corners
                      ),
                      child: Column(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image.asset('assets/urban-ventures.jpg',
                                  height: 115, width: 400, fit: BoxFit.fill)),
                          SizedBox(height: 8),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Legacy West',
                              style: GoogleFonts.jost(
                                textStyle: TextStyle(
                                  color: Color(0xFF5B8C5A),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                  SizedBox(height: 16),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        continueClicked = true;
                      });
                    },
                    child: Row(children: [
                      Text(
                        'Continue',
                        style: GoogleFonts.jost(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 24,
                          ),
                        ),
                      ),
                      Spacer(),
                      Image.asset('assets/walkingMan.png',
                          height: 35, width: 35)
                    ]),
                  )
                ],
              )),
    );
  }
}

class ETA extends StatefulWidget {
  const ETA({super.key});

  @override
  State<ETA> createState() => _ETAState();
}

class _ETAState extends State<ETA> {
  bool startWalkClicked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: startWalkClicked
          ? mindfulGoal()
          : Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(
                color: Color(0xFFADC178), // Set the background color
                borderRadius: BorderRadius.circular(15.0), // Add curved corners
              ),
              child: Column(
                children: [
                  Container(
                      width: double.infinity,
                      height: 180,
                      padding: EdgeInsets.fromLTRB(8, 10, 8, 10),
                      decoration: BoxDecoration(
                        color: Color(0xFFEDE9D7), // Set the background color
                        borderRadius:
                            BorderRadius.circular(15.0), // Add curved corners
                      ),
                      child: ETAinfo()),
                  SizedBox(height: 16),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        startWalkClicked = true;
                      });
                    },
                    child: Row(children: [
                      Text(
                        'Start Walk',
                        style: GoogleFonts.jost(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 24,
                          ),
                        ),
                      ),
                      Spacer(),
                      Image.asset('assets/walkingMan.png',
                          height: 35, width: 35)
                    ]),
                  )
                ],
              )),
    );
  }
}

class ETAinfo extends StatefulWidget {
  const ETAinfo({super.key});

  @override
  State<ETAinfo> createState() => _ETAinfoState();
}

class _ETAinfoState extends State<ETAinfo> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 100,
          height: 200,
          padding: EdgeInsets.fromLTRB(5, 16, 5, 10),
          decoration: BoxDecoration(
              color: Color(0xFFEDE9D7), // Set the background color
              borderRadius: BorderRadius.circular(30.0),
              border: Border.all(
                  color: Color(0xFFADC178), width: 5) // Add curved corners
              ),
          child: Column(children: [
            Image.asset('assets/ETA.png', width: 70, height: 70),
            SizedBox(height: 8),
            Text(
              '$formattedETA',
              style: GoogleFonts.jost(
                textStyle: TextStyle(
                  color: Color(0xFF8B6B55),
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            ),
            Text(
              'ETA',
              style: GoogleFonts.jost(
                textStyle: TextStyle(
                  color: Color(0xFF7B9E87),
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ]),
        ),
        Spacer(),
        Container(
          width: 100,
          height: 200,
          padding: EdgeInsets.fromLTRB(5, 16, 5, 10),
          decoration: BoxDecoration(
              color: Color(0xFFEDE9D7), // Set the background color
              borderRadius: BorderRadius.circular(30.0),
              border: Border.all(
                  color: Color(0xFFADC178), width: 5) // Add curved corners
              ),
          child: Column(children: [
            Image.asset('assets/milesRemaining.png', width: 70, height: 70),
            SizedBox(height: 8),
            Text(
              '$distance',
              style: GoogleFonts.jost(
                textStyle: TextStyle(
                  color: Color(0xFF8B6B55),
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            ),
            Text(
              'distance',
              style: GoogleFonts.jost(
                textStyle: TextStyle(
                  color: Color(0xFF7B9E87),
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ]),
        ),
        Spacer(),
        Container(
          width: 100,
          height: 200,
          padding: EdgeInsets.fromLTRB(5, 16, 5, 10),
          decoration: BoxDecoration(
              color: Color(0xFFEDE9D7), // Set the background color
              borderRadius: BorderRadius.circular(30.0),
              border: Border.all(
                  color: Color(0xFFADC178), width: 5) // Add curved corners
              ),
          child: Column(children: [
            Image.asset('assets/minutesLeft.png', width: 70, height: 70),
            SizedBox(height: 8),
            Text(
              duration!,
              style: GoogleFonts.jost(
                textStyle: TextStyle(
                  color: Color(0xFF8B6B55),
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            ),
            Text(
              'away',
              style: GoogleFonts.jost(
                textStyle: TextStyle(
                  color: Color(0xFF7B9E87),
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ]),
        ),
      ],
    );
  }
}

class mindfulGoal extends StatefulWidget {
  const mindfulGoal({super.key});

  @override
  State<mindfulGoal> createState() => _mindfulGoalState();
}

class _mindfulGoalState extends State<mindfulGoal> {
  bool navigationStarted = false;
  List<String> mindfulnessPrompts = [
    'Notice the sensation of each step connecting with the ground beneath you.',
    'Pay attention to the rhythm of your breath as it synchronizes with your pace.',
    'Observe the various sounds around you, from rustling leaves to distant traffic.',
    'Feel the warmth of the sunlight or the coolness of the breeze on your skin.',
    'Take note of the subtle smells in the air, identifying different scents as you walk.',
    'Engage your senses by focusing on the colors and shapes of the scenery around you.',
    'Be aware of the movement of your body – the swing of your arms, the flexing of muscles.',
    'Practice gratitude by acknowledging the things you appreciate in your surroundings.',
    'Let go of tension with each exhale, allowing your body to relax as you move forward.',
    'Connect with nature by observing plants, trees, and any wildlife you encounter.',
    'Feel the texture of the ground beneath your feet, whether it\'s pavement, grass, or gravel.',
    'Express kindness by smiling at others you pass, fostering a sense of community.'
  ];

  var promptIndexValue = Random().nextInt(10);

  @override
  Widget build(BuildContext context) {
    return navigationStarted
        ? showArrow0()
        : Container(
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                decoration: BoxDecoration(
                  color: Color(0xFFADC178), // Set the background color
                  borderRadius:
                      BorderRadius.circular(15.0), // Add curved corners
                ),
                child: Column(
                  children: [
                    Container(
                        width: double.infinity,
                        height: 180,
                        padding: EdgeInsets.fromLTRB(8, 10, 8, 10),
                        decoration: BoxDecoration(
                          color: Color(0xFFEDE9D7), // Set the background color
                          borderRadius:
                              BorderRadius.circular(15.0), // Add curved corners
                        ),
                        child: Container(
                          width: 300,
                          height: 200,
                          padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
                          decoration: BoxDecoration(
                              color:
                                  Color(0xFFFFFFFF), // Set the background color
                              borderRadius: BorderRadius.circular(30.0),
                              border: Border.all(
                                  color: Color(0xFFADC178),
                                  width: 5) // Add curved corners
                              ),
                          child: Center(
                            child: Text(
                              mindfulnessPrompts[promptIndexValue],
                              textAlign: TextAlign.center,
                              style: GoogleFonts.jost(
                                textStyle: TextStyle(
                                  color: Color(0xFF8B6B55),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        )),
                    SizedBox(height: 16),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          navigationStarted = true;
                        });
                      },
                      child: Row(children: [
                        Text(
                          'Begin Navigation',
                          style: GoogleFonts.jost(
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 24,
                            ),
                          ),
                        ),
                        Spacer(),
                        Image.asset('assets/walkingMan.png',
                            height: 35, width: 35)
                      ]),
                    )
                  ],
                )),
          );
  }
}

bool dropUpSelected = false;
bool continueSelected = false;

class showArrow0 extends StatefulWidget {
  const showArrow0({super.key});

  @override
  State<showArrow0> createState() => _showArrow0State();
}

class _showArrow0State extends State<showArrow0> {
  @override
  Widget build(BuildContext context) {
    return dropUpSelected
        ? pauseWalk()
        : Container(
            child: Transform.translate(
              offset: Offset(0, -74),
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  decoration: BoxDecoration(
                    color: Color(0xFFADC178), // Set the background color
                    borderRadius:
                        BorderRadius.circular(15.0), // Add curved corners
                  ),
                  child: Column(
                    children: [
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              dropUpSelected = true;
                            });
                          },
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Image.asset('assets/dropUpArrow.png',
                                height: 30, width: 30),
                          )),
                      SizedBox(height: 16),
                      Container(
                          width: double.infinity,
                          height: 180,
                          padding: EdgeInsets.fromLTRB(8, 10, 8, 10),
                          decoration: BoxDecoration(
                            color:
                                Color(0xFFEDE9D7), // Set the background color
                            borderRadius: BorderRadius.circular(
                                15.0), // Add curved corners
                          ),
                          child: ETAinfo()),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '0.5 Miles',
                          style: GoogleFonts.jost(
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ),
                      Row(children: [
                        Text(
                          'Turn Left',
                          style: GoogleFonts.jost(
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 24,
                            ),
                          ),
                        ),
                        Spacer(),
                        Image.asset('assets/walkingMan.png',
                            height: 35, width: 35),
                      ])
                    ],
                  )),
            ),
          );
  }
}

class pauseWalk extends StatefulWidget {
  const pauseWalk({super.key});

  @override
  State<pauseWalk> createState() => _pauseWalkState();
}

class _pauseWalkState extends State<pauseWalk> {
  @override
  Widget build(BuildContext context) {
    return !dropUpSelected
        ? showArrow0()
        : continueSelected
            ? ContinueWalk()
            : Container(
                child: Transform.translate(
                  offset: Offset(0, -107),
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      decoration: BoxDecoration(
                        color: Color(0xFFADC178), // Set the background color
                        borderRadius:
                            BorderRadius.circular(15.0), // Add curved corners
                      ),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  dropUpSelected = false;
                                });
                              },
                              child: Image.asset('assets/dropDownArrow.png',
                                  height: 30, width: 30),
                            ),
                          ),
                          SizedBox(height: 16),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                continueSelected = true;
                              });
                            },
                            child: Container(
                              width: double.infinity,
                              height: 45,
                              padding: EdgeInsets.fromLTRB(18, 10, 16, 10),
                              decoration: BoxDecoration(
                                color: Color(
                                    0xFFFFFFFF), // Set the background color
                                borderRadius: BorderRadius.circular(
                                    30.0), // Add curved corners
                              ),
                              child: Row(children: [
                                Text(
                                  'Pause Walk',
                                  style: GoogleFonts.jost(
                                    textStyle: TextStyle(
                                      color: Color(0xFF8B6B55),
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Image.asset('assets/pause.png')
                              ]),
                            ),
                          ),
                          SizedBox(height: 16),
                          Container(
                              width: double.infinity,
                              height: 180,
                              padding: EdgeInsets.fromLTRB(8, 10, 8, 10),
                              decoration: BoxDecoration(
                                color: Color(
                                    0xFFEDE9D7), // Set the background color
                                borderRadius: BorderRadius.circular(
                                    15.0), // Add curved corners
                              ),
                              child: ETAinfo()),
                          SizedBox(height: 16),
                          Row(children: [
                            Text(
                              'Start Walk',
                              style: GoogleFonts.jost(
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 24,
                                ),
                              ),
                            ),
                            Spacer(),
                            Image.asset('assets/walkingMan.png',
                                height: 35, width: 35)
                          ])
                        ],
                      )),
                ),
              );
  }
}

class ContinueWalk extends StatefulWidget {
  const ContinueWalk({super.key});

  @override
  State<ContinueWalk> createState() => _ContinueWalkState();
}

class _ContinueWalkState extends State<ContinueWalk> {
  @override
  Widget build(BuildContext context) {
    return !dropUpSelected
        ? showArrow0()
        : !continueSelected
            ? pauseWalk()
            : Container(
                child: Transform.translate(
                  offset: Offset(0, -107),
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      decoration: BoxDecoration(
                        color: Color(0xFFADC178), // Set the background color
                        borderRadius:
                            BorderRadius.circular(15.0), // Add curved corners
                      ),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  dropUpSelected = false;
                                });
                              },
                              child: Image.asset('assets/dropDownArrow.png',
                                  height: 30, width: 30),
                            ),
                          ),
                          SizedBox(height: 16),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                continueSelected = false;
                              });
                            },
                            child: Container(
                              width: double.infinity,
                              height: 45,
                              padding: EdgeInsets.fromLTRB(18, 10, 16, 10),
                              decoration: BoxDecoration(
                                color: Color(
                                    0xFFFFFFFF), // Set the background color
                                borderRadius: BorderRadius.circular(
                                    30.0), // Add curved corners
                              ),
                              child: Row(children: [
                                Text(
                                  'Continue Walk',
                                  style: GoogleFonts.jost(
                                    textStyle: TextStyle(
                                      color: Color(0xFF8B6B55),
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Image.asset('assets/pause.png')
                              ]),
                            ),
                          ),
                          SizedBox(height: 16),
                          Container(
                              width: double.infinity,
                              height: 180,
                              padding: EdgeInsets.fromLTRB(8, 10, 8, 10),
                              decoration: BoxDecoration(
                                color: Color(
                                    0xFFEDE9D7), // Set the background color
                                borderRadius: BorderRadius.circular(
                                    15.0), // Add curved corners
                              ),
                              child: ETAinfo()),
                          SizedBox(height: 16),
                          Row(children: [
                            Text(
                              'Start Walk',
                              style: GoogleFonts.jost(
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 24,
                                ),
                              ),
                            ),
                            Spacer(),
                            Image.asset('assets/walkingMan.png',
                                height: 35, width: 35)
                          ])
                        ],
                      )),
                ),
              );
  }
}
