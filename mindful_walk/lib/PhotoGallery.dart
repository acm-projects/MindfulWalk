import 'package:flutter/material.dart';
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
    Future.delayed(Duration(seconds: 5), navigateToNextPage);

    return Scaffold(
      backgroundColor: Color(0xFFFFFEF6),
      body: Stack(
        children: [
          Positioned(
            top: 70,
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
          Positioned(
            top: 50,
            right: 30,
            child: Image.asset( // Positioned image
              'assets/images/Trash.png',
              width: 40,
              height: 40,
            ),
          ),
          Positioned(
            top: 130,
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
                    'Upload Photo',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 250,
            left: 0,
            right: 0,
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 5, // Change the number of items as per your requirement
              itemBuilder: (BuildContext context, int index) {
                return Center( // Wrap the Column with Center
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center, // Align items to the center
                    children: [
                      Container(
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
                      SizedBox(height: 10),
                      Text(
                        '00/00/00',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                );
              },
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
