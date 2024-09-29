class Manga {
  final String title;
  final String description;
  List<String> reviews;

  Manga(
      {required this.title,
      required this.description,
      this.reviews = const []});
}
