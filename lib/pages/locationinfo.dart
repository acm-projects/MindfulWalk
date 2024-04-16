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
      name: "Legacy West",
      kiloCaloriesBurnt: "271",
      timeTaken: "10",
      imagePath: "assets/urban-ventures.jpg",
      preparation: '''lorem ipset''')
];

final pastLocations = [];
