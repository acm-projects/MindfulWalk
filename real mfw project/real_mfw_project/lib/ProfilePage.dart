import 'package:flutter/material.dart';
import 'PhotoGallery.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double verticalPadding = 20.0;

    void navigateToNextPage() {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => PhotoGallery(),
        ),
      );
    }

    // Use a Future.delayed to wait for 5 seconds before navigating to the next page
    Future.delayed(Duration(seconds: 10), navigateToNextPage);


    return Scaffold(
      backgroundColor: Color(0xFFFFFEF6), // Set the background color here
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 50,
            right: 30,
            child: Image.asset( // Positioned image
              'assets/images/SettingsButton.png',
              width: 40,
              height: 40,
            ),
          ),
          Positioned(
            top: 100,
            left: 30,
            child: Container(
              padding: EdgeInsets.all(1.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFFBE7),
                border: Border.all(
                  color: Color(0xFFADC178),
                  width: 2.0,
                ),
              ),
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Color(0xFFFFFBE7),
              ),
            ),
          ),
          Positioned(
            top: 102,
            left: 31,
            child: Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFFBE7),
                border: Border.all(
                  color: Color(0xFFFBE7),
                  width: 2.0,
                ),
              ),
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/dog.jpg'),
              ),
            ),
          ),
          Positioned(
            top: 105,
            left: 125,
            child: GestureDetector(
              onTap: () {},
              child: Image.asset(
                'assets/images/edit icon.png',
                width: 40,
                height: 40,
              ),
            ),
          ),
          Positioned(
            top: 200,
            left: 40,
            child: Container(
              width: 100,
              height: 30,
              decoration: BoxDecoration(
                color: Color(0xFFADC178),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Text(
                  'Lv. 5',
                  style: TextStyle(
                    color: Colors.white, // Text color
                    fontSize: 16, // Text size
                    fontWeight: FontWeight.bold, // Text weight
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 90,
            left: 180,
            child: Center(
              child: SizedBox(
                width: 200, // Adjust the width as needed
                child: Text(
                  'Your Name',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color(0xFF406440),
                    fontWeight: FontWeight.w800,
                    fontSize: 36,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 130 + verticalPadding,
            left: 180,
            child: Center(
              child: SizedBox(
                width: 200, // Adjust the width as needed
                child: Tooltip(
                  message: 'User Bio: Lorem ipsum dolor sit amet, consectetur adipiscing',
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Text(
                      'User Bio: Lorem ipsum dolor sit amet, consectetur adipiscing',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color(0xFF406440),
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 250 + verticalPadding, // Adjusted top position
            child: Stack(
              children: [
                Container(
                  height: 15,
                  width: 300, // Adjusted width
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), // Adjusted border radius
                  ),
                  child: LinearProgressIndicator(
                    value: 0.7, // Set the value of the progress indicator (between 0 and 1)
                    backgroundColor: Color(0xFFD9D1C2), // Background color of the progress bar
                    valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF5CB824)), // Color of the progress bar
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: Image.asset(
                    'assets/images/Chest.png', // Replace 'your_image.png' with your image path
                    width: 50, // Adjusted width of the image
                    height: 50, // Adjusted height of the image
                    fit: BoxFit.cover, // Adjusted fit of the image
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              left: 50,
              top: 290,
              bottom: 0,
              child: Text(
                '8,312 steps done',
                style: TextStyle(
                  fontSize: 12, // Font size
                  color: Color(0xFF877777), // Font color
                ),
              )
          ),
          Positioned(
              left: 300,
              top: 290,
              child: Text(
                'Goal 10,000',
                style: TextStyle(
                  fontSize: 12, // Font size
                  color: Color(0xFF877777), // Font color
                ),
              )
          ),
          Positioned(
            top: 320,
            child: Container(
              width: 330,
              height: 100,
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
                      'Insert favorite mindful quote',
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
            top: 440,
            left: 40,
            child: Container(
              width: 150,
              height: 80,
              decoration: BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Color(0xFFFFA9A8), // Border color
                  width: 2.0, // Border width
                ),
              ),
              padding: EdgeInsets.all(10.0), // Padding around the text
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Lifetime Miles',
                        style: TextStyle(
                          fontSize: 16, // Font size
                          color: Color(0xFF8B6B55), // Text color
                        ),
                      ),
                      Text(
                        '47.723',
                        style: TextStyle(
                          fontSize: 18, // Font size
                          color: Color(0xFF8B6B55), // Text color
                          fontWeight: FontWeight.bold, // Bold text
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 440,
            left: 220,
            child: Container(
              width: 150,
              height: 80,
              decoration: BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Color(0xFFADC178), // Border color
                  width: 2.0, // Border width
                ),
              ),
              padding: EdgeInsets.all(10.0), // Padding around the text
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Lifetime Steps',
                        style: TextStyle(
                          fontSize: 16, // Font size
                          color: Color(0xFF8B6B55), // Text color
                        ),
                      ),
                      Text(
                        '303,457',
                        style: TextStyle(
                          fontSize: 18, // Font size
                          color: Color(0xFF8B6B55), // Text color
                          fontWeight: FontWeight.bold, // Bold text
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 540,
            left: 40,
            child: ElevatedButton(
              onPressed: () {
                // Add your button press logic here
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: BorderSide(
                    color: Color(0xFFEDE9D7),
                    width: 2.0,
                  ),
                ),
              ),
              child: Container(
                width: 150,
                height: 140,
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/NotesButton.png',
                      width: 50,
                      height: 50,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Notes',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF8B6B55),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 540,
            left: 220,
            child: ElevatedButton(
              onPressed: () {

              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: BorderSide(
                    color: Color(0xFFEDE9D7),
                    width: 2.0,
                  ),
                ),
              ),
              child: Container(
                width: 150,
                height: 140,
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/BookmarksButton.png',
                      width: 50,
                      height: 50,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Bookmarks',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF8B6B55),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 700, // Adjusted top position to move the text above the progress bar
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'Level 5',
                style: TextStyle(
                  fontSize: 18, // Font size
                  color: Color(0xFF727C90), // Text color
                ),
              ),
            ),
          ),
          Positioned(
            top: 710 + verticalPadding, // Adjusted top position
            child: Stack(
              children: [
                Container(
                  height: 15,
                  width: 300, // Adjusted width
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), // Adjusted border radius
                  ),
                  child: LinearProgressIndicator(
                    value: 0.7, // Set the value of the progress indicator (between 0 and 1)
                    backgroundColor: Color(0xFF727C90), // Background color of the progress bar
                    valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFFFA9A8)), // Color of the progress bar
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
                child: Image.asset('assets/images/diary.png', width: 50, height: 50),
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
                child: Image.asset('assets/images/filled profile.png', width: 40, height: 40),
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