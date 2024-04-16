import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mindfulwalk/pages/Health.dart';
import 'package:mindfulwalk/pages/HiName.dart';
import 'package:mindfulwalk/pages/MapPage.dart';
import 'package:mindfulwalk/pages/PhotosPage.dart';
import 'package:mindfulwalk/pages/ProfilePage.dart';

import 'Login.dart';

class PhotoGallery extends StatefulWidget {
  const PhotoGallery({Key? key}) : super(key: key);

  @override
  _PhotoGalleryState createState() => _PhotoGalleryState();
}

class _PhotoGalleryState extends State<PhotoGallery> {
  List<Map<String, dynamic>> imagesData = [];
  final picker = ImagePicker();
  String imageUrl = '';

  @override
  void initState() {
    super.initState();
    _fetchImagesFromFirebase();
  }

  Future<void> _fetchImagesFromFirebase() async {
    try {
      Reference firebaseStorageRef =
          FirebaseStorage.instance.ref().child('Images/$userID');
      ListResult result = await firebaseStorageRef.listAll();
      List<Map<String, dynamic>> data =
          await Future.wait(result.items.map((item) async {
        String url = await item.getDownloadURL();
        return {'url': url, 'reference': item};
      }));
      setState(() {
        imagesData = data;
      });
    } catch (e) {
      print('Error fetching images: $e');
    }
  }

  Future<void> _deleteImageFromFirebase(int index) async {
    try {
      bool confirmDelete = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Confirm Delete'),
            content: Text('Are you sure you want to delete this photo?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false); // No, do not delete
                },
                child: Text('No'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true); // Yes, delete
                },
                child: Text('Yes'),
              ),
            ],
          );
        },
      );

      if (confirmDelete == true) {
        await imagesData[index]['reference'].delete();
        setState(() {
          imagesData.removeAt(index);
        });
      }
    } catch (e) {
      print('Error deleting image: $e');
    }
  }

  Future<void> _uploadImageToFirebase(XFile image) async {
    try {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference firebaseStorageRef =
          FirebaseStorage.instance.ref().child('Images/$userID/$fileName');
      UploadTask uploadTask = firebaseStorageRef.putFile(File(image.path));
      await uploadTask.whenComplete(() => _fetchImagesFromFirebase());
    } catch (e) {
      print('Error uploading image: $e');
    }
  }

  Future<void> getImageAndUpload() async {
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      _uploadImageToFirebase(pickedFile);
    } else {
      print('No image selected.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFFFFEF6),
        body: Stack(
          children: [
            Positioned(
              top: 50,
              left: 30,
              child: Text(
                'Memories',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Color(0xFF406440),
                  fontWeight: FontWeight.w800,
                  fontSize: 33,
                ),
              ),
            ),
            Positioned(
              top: 635,
              left: 20,
              right: 20,
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: getImageAndUpload,
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
                          final XFile? pickedFile = await picker.pickImage(
                              source: ImageSource.gallery);
                          if (pickedFile != null) {
                            _uploadImageToFirebase(pickedFile);
                          } else {
                            print('No image selected.');
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
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: 90,
              left: -75,
              right: 40,
              bottom: 80,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  crossAxisSpacing: 0.0,
                  mainAxisSpacing: 16.0,
                ),
                itemCount: imagesData.length,
                itemBuilder: (BuildContext context, int index) {
                  return Stack(
                    alignment: Alignment.topRight,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(
                            10.0), // Adjust the value as needed
                        child: Image.network(
                          imagesData[index]['url'],
                          fit: BoxFit.cover,
                        ),
                      ),
                      IconButton(
                        icon: Image.asset(
                          'assets/deleteImage.png',
                          width: 28,
                          height: 28,
                        ),
                        onPressed: () {
                          _deleteImageFromFirebase(index);
                        },
                      ),
                    ],
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
                            MaterialPageRoute(builder: (context) => HiName()),
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
        ));
  }
}
