import 'package:flutter/material.dart';
import 'MapPage.dart';
import 'EditPhotoGallery.dart';

class PhotoGallery extends StatelessWidget {
  const PhotoGallery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double verticalPadding = 10.0;

    void navigateToNextPage() {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => EditPhotoGallery(),
        ),
      );
    }

    // Use a Future.delayed to wait for 5 seconds before navigating to the next page
    //Future.delayed(Duration(seconds: 5), navigateToNextPage);

    return Scaffold(
      backgroundColor: Color(0xFFFFFEF6),
      body: Stack(
        children: [
          Positioned(
              top: 40,
              left: 20,
              child:
                  Image.asset('assets/backArrow.png', width: 40, height: 40)),
          Positioned(
            top: 80,
            left: 30,
            child: Text(
              'Photo Gallery',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Color(0xFF406440),
                fontWeight: FontWeight.w800,
                fontSize: 45,
              ),
            ),
          ),
          // Positioned(
          //   top: 50,
          //   right: 30,
          //   child: Image.asset(
          //     // Positioned image
          //     'assets/Trash.png',
          //     width: 40,
          //     height: 40,
          //   ),
          // ),
          Transform.translate(
            offset: Offset(0, 240),
            child: SingleChildScrollView(
                child: Center(
              // Wrap the Column with Center
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.asset(
                      'assets/trees.jpg',
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '00/10/00',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 10),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.asset(
                      'assets/trees.jpg',
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '00/10/00',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 10),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.asset(
                      'assets/trees.jpg',
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '00/10/00',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(0, 240),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.asset(
                              'assets/trees.jpg',
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            '00/110/00',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 10),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.asset(
                              'assets/trees.jpg',
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            '00/112/00',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 10),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.asset(
                              'assets/trees.jpg',
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            '00/1=20/00',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )),
          ),
          Positioned(
              top: 170,
              child: Container(
                height: 50.0,
                decoration: BoxDecoration(
                  color: Color(0xFFEDE9D7),
                ),
              )),
          Positioned(
            top: 160,
            left: 70,
            child: ElevatedButton(
              onPressed: () {
                // Add your button press logic here
              },
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(Size(270, 70)),
                backgroundColor: MaterialStateProperty.all(Color(0xFF5B8C5A)),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
              child: Text(
                'Take Photo',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
          ),
        ],
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
