class Book {
  final String title, author, genre, imageFile, description;
  final double price;
  bool? isPurchased;

  Book({
    required this.title,
    required this.genre,
    required this.price,
    required this.author,
    required this.imageFile,
    required this.description,
    this.isPurchased,
  });
}
