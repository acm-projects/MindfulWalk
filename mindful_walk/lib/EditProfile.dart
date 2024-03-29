import 'package:flutter/material.dart';
import 'BookmarksPage.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    void navigateToNextPage() {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => BookmarksPage(),
        ),
      );
    }

    // Use a Future.delayed to wait for 5 seconds before navigating to the next page
    Future.delayed(Duration(seconds: 5), navigateToNextPage);


    return Theme(
      data: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(
              color: Color(0xFFADC178),
              width: 2.0,
            ),
          ),
        ),
        canvasColor: Colors.transparent,
      ),
      child: Scaffold(
        body: SizedBox.expand(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background flowers.png'),
                fit: BoxFit.cover, // Set fit property to BoxFit.cover
              ),
            ),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Edit Profile',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color(0xFF406440),
                            fontWeight: FontWeight.w800,
                            fontSize: 45,
                          ),
                        ),
                        SizedBox(height: 30, width: 200),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
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
                                radius: 70,
                                backgroundColor: Color(0xFFFFFBE7),
                              ),
                            ),
                            Container(
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
                                radius: 60,
                                backgroundImage: AssetImage('assets/images/dog.jpg'),
                              ),
                            ),
                            Positioned(
                              top: 3,
                              left: 90,
                              child: GestureDetector(
                                onTap: () {},
                                child: Image.asset(
                                  'assets/images/edit icon.png',
                                  width: 45,
                                  height: 45,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Username:',
                              style: TextStyle(
                                color: Color(0xFF253659),
                                fontSize: 24,
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              width: 300,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                    borderSide: BorderSide(
                                      color: Color(0xFFADC178), // Border color
                                      width: 2.0, // Border width
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Bio:',
                              style: TextStyle(
                                color: Color(0xFF253659),
                                fontSize: 24,
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              width: 300,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                    borderSide: BorderSide(
                                      color: Color(0xFFADC178), // Border color
                                      width: 2.0, // Border width
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Favorite Quote:',
                              style: TextStyle(
                                color: Color(0xFF253659),
                                fontSize: 24,
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              width: 300,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                    borderSide: BorderSide(
                                      color: Color(0xFFADC178), // Border color
                                      width: 2.0, // Border width
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 50),
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
                            'Save Changes',
                            style: TextStyle(
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
