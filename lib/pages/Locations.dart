import 'package:flutter/material.dart';

class Locations extends StatefulWidget {
  const Locations({super.key});

  @override
  State<Locations> createState() => _LocationsState();
}

class _LocationsState extends State<Locations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset('assets/backArrow.png'),
          onPressed: null, // Disabling the back button
        ),
        title: Text(
          '\nLocations',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Color(0xFF406440), // 406440 color
          ),
        ),
        centerTitle: false,
      ),
      body: NotesPage(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor:
            Colors.white, // we can change this if we want text under each icon
        unselectedItemColor: Colors.grey,
        backgroundColor: const Color(0xffFFA9A8),
        items: [
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Image.asset('assets/Home.png', width: 45, height: 45),
            ),
            label: '',
            backgroundColor: const Color(0xffFFA9A8),
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.fromLTRB(0, 8, 30, 0),
              child: Image.asset('assets/Photo.png', width: 50, height: 50),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 35, 0),
              child: Image.asset('assets/Map.png', width: 50, height: 50),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.fromLTRB(0, 5, 30, 0),
              child: Image.asset('assets/Health.png', width: 50, height: 50),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 30, 0),
              child: Image.asset('assets/Profile.png', width: 40, height: 40),
            ),
            label: '',
          ),
        ],
        onTap: (index) {
          // Handle button tap
        },
      ),
    );
  }
}

class NotesPage extends StatefulWidget {
  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  List<Note> notes = [
    Note(title: 'Location 1', imageURL: 'assets/Location1.png'),
    Note(title: 'Location 2', imageURL: 'assets/Location2.png'),
    Note(title: 'Location 3', imageURL: 'assets/Location3.png'),
    Note(title: 'Location 4', imageURL: 'assets/Location3.png'),
    Note(title: 'Location 5', imageURL: 'assets/Location3.png'),
    Note(title: 'Internal Oasis', imageURL: 'assets/Location3.png'),
    // Add more notes as needed
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: notes.length,
            itemBuilder: (context, index) {
              return NoteBox(
                note: notes[index],
                bookmarkChanged: (isBookmarked) {
                  setState(() {
                    notes[index].isBookmarked = isBookmarked;
                  });
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class Note {
  String title;
  String imageURL;
  bool isBookmarked;

  Note({
    required this.title,
    required this.imageURL,
    this.isBookmarked = false,
  });
}

class NoteBox extends StatelessWidget {
  final Note note;
  final ValueChanged<bool>? bookmarkChanged;

  NoteBox({required this.note, this.bookmarkChanged});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFFEDE9D7),
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 1.0, top: 5.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.asset(
                      note.imageURL,
                      width: 300.0,
                      height: 120.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Spacer(),
                Bookmark(
                  isBookmarked: note.isBookmarked,
                  bookmarkChanged: bookmarkChanged,
                )
              ],
            ),
            SizedBox(height: 16),
            Text(
              note.title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF406440), // 406440 color
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Bookmark extends StatefulWidget {
  final bool isBookmarked;
  final ValueChanged<bool>? bookmarkChanged;

  Bookmark({required this.isBookmarked, this.bookmarkChanged});

  @override
  _BookmarkState createState() => _BookmarkState();
}

class _BookmarkState extends State<Bookmark> {
  late bool _isBookmarked;

  @override
  void initState() {
    super.initState();
    _isBookmarked = widget.isBookmarked;
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        _isBookmarked ? Icons.bookmark : Icons.bookmark_border,
        size: 45,
      ),
      onPressed: () {
        setState(() {
          _isBookmarked = !_isBookmarked;
          widget.bookmarkChanged?.call(_isBookmarked);
        });
      },
    );
  }
}
