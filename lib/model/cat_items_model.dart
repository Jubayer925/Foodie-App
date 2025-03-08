class CatItem {
  final String id;
  final String name;
  final String description;
  final String image;
  final int calories;
  final String category;

  CatItem({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.calories,
    required this.category,
  });

  // Factory method to create an instance from JSON
  factory CatItem.fromJson(Map<String, dynamic> json) {
    return CatItem(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
      calories: json['calories'],
      category: json['category'],
    );
  }
}
