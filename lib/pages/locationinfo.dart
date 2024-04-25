class Location {
  final String category, name, imagePath, kiloCaloriesBurnt, timeTaken;
  final String preparation;

  Location(
      {required this.category,
      required this.name,
      required this.imagePath,
      required this.kiloCaloriesBurnt,
      required this.timeTaken,
      required this.preparation});
}

final futureLocations = [
  Location(
      category: "Urban Ventures",
      name: "Barton Creek Trail",
      kiloCaloriesBurnt: "271",
      timeTaken: "15",
      imagePath: "assets/barton.jpg",
      preparation: '''lorem ipset'''),
  Location(
      category: "Urban Ventures",
      name: "Congress Avenue",
      kiloCaloriesBurnt: "271",
      timeTaken: "30",
      imagePath: "assets/congress.jpg",
      preparation: '''lorem ipset'''),
  Location(
      category: "Urban Ventures",
      name: "Mueller Lake Park",
      kiloCaloriesBurnt: "271",
      timeTaken: "30",
      imagePath: "assets/mueller.png",
      preparation: '''lorem ipset''')
];

final pastLocations = [
  Location(
      category: "Urban Ventures",
      name: "Cypress Waters",
      kiloCaloriesBurnt: "271",
      timeTaken: "28",
      imagePath: "assets/cypress-waters.jpg",
      preparation: '''lorem ipset'''),
  Location(
      category: "Urban Ventures",
      name: "The Plinth",
      kiloCaloriesBurnt: "271",
      timeTaken: "28",
      imagePath: "assets/plinth.jpg",
      preparation: '''lorem ipset'''),
  Location(
      category: "Urban Ventures",
      name: "Campion Trails",
      kiloCaloriesBurnt: "271",
      timeTaken: "35",
      imagePath: "assets/walking-trail.jpg",
      preparation: '''lorem ipset''')
];
