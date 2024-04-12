import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import "EditProfile.dart";
import "HiName.dart";
import "Login.dart";

class CreateProfile extends StatelessWidget {
  const CreateProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController bioController = TextEditingController();
    TextEditingController quoteController = TextEditingController();

    void navigateToNextPage() {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => EditProfile(),
        ),
      );
    }

    // Function to update data in Firebase and navigate to HiNamePage
    void updateDataAndNavigate() async {
      String username = usernameController.text;
      String name = nameController.text;
      String bio = bioController.text;
      String quote = quoteController.text;

      try {
        // Check if all fields are filled
        if (username.isNotEmpty &&
            name.isNotEmpty &&
            bio.isNotEmpty &&
            quote.isNotEmpty) {
          // Update data in Firestore
          CollectionReference users =
              FirebaseFirestore.instance.collection('Users');
          await users.doc(userID).update({
            'Name': name,
            'Username': username,
            'Bio': bio,
            'Favorite Quote': quote,
          });

          // Navigate to HiNamePage
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => HiName(),
            ),
          );
        } else {
          // Show error if any field is empty
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Error'),
                content: Text('All fields are required.'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('OK'),
                  ),
                ],
              );
            },
          );
        }
      } catch (e) {
        print('Error updating data: $e');
        // Handle error
      }
    }

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
      ),
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  'build/app/intermediates/flutter/debug/flutter_assets/images/background flowers.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      Positioned(
                        top: 10,
                        right: 300,
                        child: Text(
                          'Create Profile',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color(0xFF406440),
                            fontWeight: FontWeight.w800,
                            fontSize: 45,
                          ),
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
                              backgroundImage:
                                  AssetImage('assets/createProfileAvatar.png'),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            left: 80,
                            child: GestureDetector(
                              onTap: () {},
                              child: Image.asset(
                                'assets/createProfileEditPhoto.png',
                                width: 80,
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
                              controller: usernameController,
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
                            'Name:',
                            style: TextStyle(
                              color: Color(0xFF253659),
                              fontSize: 24,
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            width: 300,
                            child: TextFormField(
                              controller: nameController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide: BorderSide(
                                    color: Color(0xFFADC178),
                                    width: 2.0,
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
                              controller: bioController,
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
                              controller: quoteController,
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
                        onPressed: updateDataAndNavigate,
                        style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all(Size(300, 70)),
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xFFADC178)),
                          foregroundColor:
                              MaterialStateProperty.all(Colors.white),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                        ),
                        child: Text(
                          'Done',
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
    );
  }
}
