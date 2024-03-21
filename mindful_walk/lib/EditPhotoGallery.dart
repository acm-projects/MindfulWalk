import 'package:flutter/material.dart';

class EditPhotoGallery extends StatelessWidget {
  const EditPhotoGallery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double verticalPadding = 10.0;
    return Scaffold(
      backgroundColor: Color(0xFFFFFEF6),
      body: Stack(
        children: [
          Positioned(
            top: 70,
            left: 30,
            child: Text(
              'Photo Collection',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Color(0xFF406440),
                fontWeight: FontWeight.w800,
                fontSize: 45,
              ),
            ),
          ),
          Positioned(
            top: 180 + verticalPadding,
            left: (MediaQuery.of(context).size.width - 300) / 2,
            child: Container(
              width: 300,
              height: 80,
              decoration: BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Color(0xFF5B8C5A), // Border color
                  width: 2.0, // Border width
                ),
              ),
              padding: EdgeInsets.all(8.0), // Padding around the text
              child: SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0), // Inner padding for the text
                    child: Text(
                      'Are you sure you want to delete this photo?',
                      textAlign: TextAlign.center, // Align text to the center
                      style: TextStyle(
                        fontSize: 16, // Font size
                        color: Color(0xFF8B6B55), // Text color
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 300 + verticalPadding,
            left: (MediaQuery.of(context).size.width - 300) / 2,
            child: Container(
              width: 300,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/photogalleryimage.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          Positioned(
            top: 470 + verticalPadding,
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
                    fixedSize: MaterialStateProperty.all(Size(300, 70)),
                    backgroundColor: MaterialStateProperty.all(Color(0xFFADC178)),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 560 + verticalPadding,
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
                    fixedSize: MaterialStateProperty.all(Size(300, 70)),
                    backgroundColor: MaterialStateProperty.all(Color(0xFFFFA9A8)),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                  child: Text(
                    'Delete',
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
                child: Image.asset('assets/images/home.png', width: 45, height: 45),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.fromLTRB(0, 8, 30, 0),
                child: Image.asset('assets/images/filled diary.png', width: 50, height: 50),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 35, 0),
                child: Image.asset('assets/images/maps.png', width: 50, height: 50),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.fromLTRB(0, 5, 30, 0),
                child: Image.asset('assets/images/health.png', width: 50, height: 50),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 30, 0),
                child: Image.asset('assets/images/profile.png', width: 40, height: 40),
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
