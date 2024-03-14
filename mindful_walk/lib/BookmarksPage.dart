import 'package:flutter/material.dart';
import 'package:mindful_walk/ProfilePage.dart';

class BookmarksPage extends StatelessWidget {
  const BookmarksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    void navigateToNextPage() {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => ProfilePage(), // Replace with the actual next page widget
        ),
      );
    }

    // Use a Future.delayed to wait for 5 seconds before navigating to the next page
    Future.delayed(Duration(seconds: 1), navigateToNextPage);


    return Scaffold(
      backgroundColor: Color(0xFFFFFEF6),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('build/app/intermediates/flutter/debug/flutter_assets/images/background flowers.jpg'), // Replace 'assets/background_image.jpg' with your image path
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 70,
              left: 30,
              child: Text(
                'Bookmarks',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Color(0xFF406440),
                  fontWeight: FontWeight.w800,
                  fontSize: 45,
                ),
              ),
            ),
            Positioned(
              top: 70,
              left: 275,
              child: Image.asset(
                'build/app/intermediates/flutter/debug/flutter_assets/images/Bookmark.png',
                width: 55,
                height: 65,
              ),
            ),
            Positioned(
              top: 130,
              left: 30,
              child: Text(
                'Choose a category: ',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Color(0xFF406440),
                  fontSize: 18,
                ),
              ),
            ),
            Positioned(
              top: 250,
              left: (MediaQuery.of(context).size.width - 300) / 2,
              child: Container(
                width: 300,
                height: 225,
                decoration: BoxDecoration(
                  color: Color(0xFFEDE9D7),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            Positioned(
              top: 225,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  ElevatedButton(
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
                      'Notes',
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 325,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  ElevatedButton(
                    onPressed: () {
                      // Add your button press logic here
                    },
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(Size(270, 70)),
                      backgroundColor: MaterialStateProperty.all(Color(0xFFADC178)),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                    child: Text(
                      'Locations',
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Color(0xFFFFA9A8),
        ),
        child: BottomNavigationBar(
          currentIndex: 0,
          selectedItemColor: Colors.white, // we can change this if we want text under each icon
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Image.asset('build/app/intermediates/flutter/debug/flutter_assets/images/Home.svg.png', width: 45, height: 45),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.fromLTRB(0, 8, 30, 0),
                child: Image.asset('build/app/intermediates/flutter/debug/flutter_assets/images/Photo.png', width: 50, height: 50),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 35, 0),
                child: Image.asset('build/app/intermediates/flutter/debug/flutter_assets/images/Maps.png', width: 50, height: 50),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.fromLTRB(0, 5, 30, 0),
                child: Image.asset('build/app/intermediates/flutter/debug/flutter_assets/images/Health.png', width: 50, height: 50),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 30, 0),
                child: Image.asset('build/app/intermediates/flutter/debug/flutter_assets/images/Profile.png', width: 40, height: 40),
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
