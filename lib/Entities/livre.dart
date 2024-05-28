class Book {
  final String title;
  final String description;
  final String image;

  Book({required this.title,required this.image, required this.description});

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      title: json['volumeInfo']['title'],
      description: json['volumeInfo']['description'] ?? 'No description available',
      image: json['volumeInfo']['imageLinks']['thumbnail'],
    );
  }
}
