import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotesPage extends StatefulWidget {
  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  List<Note> notes = [
    Note(
        title:
            'Today was a good day. I saw a lot of trees on my walk and it started off great. Towards the end of the walk it got really hot outside and made me tired.',
        rating: 3),
    Note(
        title:
            'I really enjoyed my walk today! I went to a new lake and saw so many ducks and squirrels. I was able to feel more life. ',
        rating: 4),
    Note(
        title:
            'This was the best walk I went on in a while. I said good morning to everyone I walked past and they reciprocated. I felt appreciated. ',
        rating: 5),
    Note(
        title:
            'I thought a lot about my future during this walk. When I walked by this poster about a play near me, inspiration hit. I realized I should go back to school to study animation. ',
        rating: 5),
    Note(
        title:
            'This walk could have been better. In the middle of my walk I stepped in some mud and ruined my brand new shoes. But I know I should not be angry and that these things happen.',
        rating: 1),
    Note(
        title:
            'I ran into someone I knew from a long time ago. We caught up with each other and I loved its! ',
        rating: 5),
    // Add more notes as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset('assets/backArrow.png',
                        width: 40, height: 40)),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Notes',
                  style: GoogleFonts.raleway(
                    textStyle: TextStyle(
                      color: Color(0xFF406440),
                      fontWeight: FontWeight.w800,
                      fontSize: 45,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
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
            index < _rating ? Icons.star_rounded : Icons.star_border_rounded,
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
