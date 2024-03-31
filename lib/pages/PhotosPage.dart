// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mindfulwalk/pages/MapPage.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mindfulwalk/pages/ProfilePage.dart';
import 'package:path/path.dart' as Path;

class PhotosPage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<PhotosPage> {
  //File? selectedImage;
  PlatformFile? pickedFile;
  String imageUrl = '';

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Photo Gallery',
                  style: GoogleFonts.raleway(
                    textStyle: TextStyle(
                      color: Color(0xFF406440),
                      fontWeight: FontWeight.w800,
                      fontSize: 33,
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Expanded(
                  child: SingleChildScrollView(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 185.0,
                            width: 360.0,
                            decoration: BoxDecoration(
                              color: Color(0xFFEDE9D7),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 1.0, top: 7.0, bottom: 7.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: Image.asset(
                                      'assets/urban-ventures.jpg',
                                      width: 320.0,
                                      height: 150.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 16.0),
                          Container(
                            height: 185.0,
                            width: 360.0,
                            decoration: BoxDecoration(
                              color: Color(0xFFEDE9D7),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 1.0, top: 7.0, bottom: 7.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: Image.asset(
                                      'assets/urban-ventures.jpg',
                                      width: 320.0,
                                      height: 150.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 16.0),
                          Container(
                            height: 185.0,
                            width: 360.0,
                            decoration: BoxDecoration(
                              color: Color(0xFFEDE9D7),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 1.0, top: 7.0, bottom: 7.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: Image.asset(
                                      'assets/urban-ventures.jpg',
                                      width: 320.0,
                                      height: 150.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 16.0),
                          Container(
                            height: 185.0,
                            width: 360.0,
                            decoration: BoxDecoration(
                              color: Color(0xFFEDE9D7),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 1.0, top: 7.0, bottom: 7.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: Image.asset(
                                      'assets/urban-ventures.jpg',
                                      width: 320.0,
                                      height: 150.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 16.0),
                          Container(
                            height: 185.0,
                            width: 360.0,
                            decoration: BoxDecoration(
                              color: Color(0xFFEDE9D7),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 1.0, top: 7.0, bottom: 7.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: Image.asset(
                                      'assets/urban-ventures.jpg',
                                      width: 320.0,
                                      height: 150.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                ),
                SizedBox(height: 16),
                Row(children: [
                  ElevatedButton(
                    onPressed: () async {
                      // Picking image
                      ImagePicker imagePicker = ImagePicker();
                      XFile? file = await imagePicker.pickImage(
                          source: ImageSource.camera);
                      print('${file?.path}');

                      if (file == null) return;

                      String uniqueFileName =
                          DateTime.now().millisecondsSinceEpoch.toString();

                      // Uploading to firebase storage
                      Reference referenceRoot = FirebaseStorage.instance.ref();
                      Reference referenceDirImages =
                          referenceRoot.child('photos');

                      //Create a reference for the image to be stored
                      Reference referenceImageToUpload =
                          referenceDirImages.child(uniqueFileName);

                      // Handle errors
                      try {
                        // Store the file
                        await referenceImageToUpload.putFile(File(file!.path));
                        // Success: get the download URL
                        imageUrl =
                            await referenceImageToUpload.getDownloadURL();
                      } catch (error) {
                        print('photo storing to firebase error');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffADC178),
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 30, // Adjust the width as needed
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                    child: Text(
                      'Take Photo',
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () async {
                      // Picking image
                      ImagePicker imagePicker = ImagePicker();
                      XFile? file = await imagePicker.pickImage(
                          source: ImageSource.gallery);
                      print('${file?.path}');

                      if (file == null) return;

                      String uniqueFileName =
                          DateTime.now().millisecondsSinceEpoch.toString();

                      // Uploading to firebase storage
                      Reference referenceRoot = FirebaseStorage.instance.ref();
                      Reference referenceDirImages =
                          referenceRoot.child('photos');

                      //Create a reference for the image to be stored
                      Reference referenceImageToUpload =
                          referenceDirImages.child(uniqueFileName);

                      // Handle errors
                      try {
                        // Store the file
                        await referenceImageToUpload.putFile(File(file!.path));
                        // Success: get the download URL
                        imageUrl =
                            await referenceImageToUpload.getDownloadURL();
                      } catch (error) {
                        print('photo storing to firebase error');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffADC178),
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20, // Adjust the width as needed
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                    child: Text(
                      'Upload Photo',
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ]),
              ],
            ),
          ),
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
                  child: GestureDetector(
                      onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MapPage()),
                          ),
                      child: Image.asset('assets/home.png',
                          width: 45, height: 45)),
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
                                builder: (context) => PhotosPage()),
                          ),
                      child: Image.asset('assets/photoIconSelected.png',
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
                  child:
                      Image.asset('assets/health.png', width: 50, height: 50),
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
        ));
  }

  // Future _pickImageFromGallery() async {
  //   final result = await FilePicker.platform.pickFiles();
  //   if (result == null) return;
  //
  //   setState(() {
  //     pickedFile = result.files.first;
  //   });
  //
  //   // final returnedImage =
  //   //     await ImagePicker().pickImage(source: ImageSource.gallery);
  //   // if (returnedImage == null) return;
  //   //
  //   // setState(() {
  //   //   selectedImage = File(returnedImage!.path);
  //   // });
  //
  //   final fileName = pickedFile?.name;
  //   final filePath = pickedFile?.path;
  //
  //   if (fileName == null || filePath == null) {
  //     // Handle the case where either fileName or filePath is null
  //     return;
  //   }
  //
  //   final path = 'photos/$fileName';
  //   final file = File(filePath);
  //
  //   final ref = FirebaseStorage.instance.ref().child(path);
  //   ref.putFile(file);
  // }
  //
  // Future _pickImageFromCamera() async {
  //   // final returnedImage =
  //   //     await ImagePicker().pickImage(source: ImageSource.camera);
  //   // if (returnedImage == null) return;
  //   // setState(() {
  //   //   selectedImage = File(returnedImage!.path);
  //   // });
  // }
}
