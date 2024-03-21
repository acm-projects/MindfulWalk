import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NotesPage(),
    );
  }
}

class NotesPage extends StatefulWidget {
  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  List<Note> notes = [
    Note(title: 'Description of the location Lorem ipsum dolor sit amet, consectetur adipiscing elit', rating: 3),
    Note(title: 'Description of the location Lorem ipsum dolor sit amet, consectetur adipiscing elit. ', rating: 4),
    Note(title: 'Description of the location Lorem ipsum dolor sit amet, consectetur adipiscing elit. ', rating: 5),
    Note(title: 'Description of the location Lorem ipsum dolor sit amet, consectetur adipiscing elit. ', rating: 5),
    Note(title: 'Description of the location Lorem ipsum dolor sit amet, consectetur adipiscing elit. ', rating: 5),
    Note(title: 'Description of the location Lorem ipsum dolor sit amet, consectetur adipiscing elit. ', rating: 5),
    // Add more notes as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset('assets/BackArrow.png'),
          onPressed: null, // Disabling the back button
        ),
        title: Text(
          '\nNotes',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Color(0xFF406440), // 406440 color
          ),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return NoteBox(
                  note: notes[index],
                  onDelete: () {
                    setState(() {
                      notes.removeAt(index);
                    });
                  },
                  onRatingChanged: (newRating) {
                    setState(() {
                      notes[index].rating = newRating;
                    });
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Note {
  String title;
  int rating;

  Note({required this.title, required this.rating});
}

class NoteBox extends StatelessWidget {
  final Note note;
  final Function() onDelete;
  final ValueChanged<int>? onRatingChanged;

  NoteBox({required this.note, required this.onDelete, this.onRatingChanged});

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
                RatingStars(
                  rating: note.rating,
                  onRatingChanged: onRatingChanged,
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: onDelete,
                ),
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

class RatingStars extends StatefulWidget {
  final int rating;
  final ValueChanged<int>? onRatingChanged;

  RatingStars({required this.rating, this.onRatingChanged});

  @override
  _RatingStarsState createState() => _RatingStarsState();
}

class _RatingStarsState extends State<RatingStars> {
  late int _rating;

  @override
  void initState() {
    super.initState();
    _rating = widget.rating;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        5,
            (index) => IconButton(
          icon: Icon(
            index < _rating
                ? Icons.star_rounded
                : Icons.star_border_rounded,
            color: index < _rating ? Colors.green : null,
            size: 30,
          ),
          onPressed: () {
            setState(() {
              _rating = index + 1;
              widget.onRatingChanged?.call(_rating);
            });
          },
        ),
      ),
    );
  }
}
