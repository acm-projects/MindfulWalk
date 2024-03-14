import 'package:flutter/material.dart';

class PhotoGallery extends StatelessWidget {
  const PhotoGallery({Key? key}) : super(key: key);

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
            top: 420+ verticalPadding,
            left: (MediaQuery.of(context).size.width - 300) / 2,
            child: Container(
              width: 300,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'build/app/intermediates/flutter/debug/flutter_assets/images/trees.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          Positioned(
            top: 640+ verticalPadding,
            right: 60,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Add any additional widgets you want to overlay on top of the image
                Text(
                  '00/00/00',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 690+ verticalPadding,
            left: (MediaQuery.of(context).size.width - 300) / 2,
            child: Container(
              width: 300,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'build/app/intermediates/flutter/debug/flutter_assets/images/trees.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          Positioned(
            top: 910+ verticalPadding,
            right: 60,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Add any additional widgets you want to overlay on top of the image
                Text(
                  '00/00/00',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
