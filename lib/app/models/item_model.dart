class Item {
  final String id;
  final String title;
  final String description;
  final String? category;
  final double price;
  final String imageUrl;
  final double rating;

  Item({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.imageUrl,
    required this.rating,
  });
}
