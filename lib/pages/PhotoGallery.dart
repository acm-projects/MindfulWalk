import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

import 'Login.dart';

class PhotoGallery extends StatefulWidget {
  const PhotoGallery({Key? key}) : super(key: key);

  @override
  _PhotoGalleryState createState() => _PhotoGalleryState();
}

class _PhotoGalleryState extends State<PhotoGallery> {
  List<Map<String, dynamic>> imagesData = [];
  final picker = ImagePicker();

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
      List<Map<String, dynamic>> data = await Future.wait(
          result.items.map((item) async {
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
            top: 150,
            left: 0,
            right: 0,
            child: Column(
              children: [
                const SizedBox(height: 50),
                ElevatedButton(
                  onPressed: getImageAndUpload,
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(Size(270, 70)),
                    backgroundColor:
                    MaterialStateProperty.all(Color(0xFF5B8C5A)),
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
            left: 20,
            right: 20,
            bottom: 20,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: imagesData.length,
              itemBuilder: (BuildContext context, int index) {
                return Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Image.network(
                      imagesData[index]['url'],
                      fit: BoxFit.cover,
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
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
    );
  }
}
