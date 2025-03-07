class CategoryItems {
  final String id;
  final String title;
  final String image;

  CategoryItems({required this.id, required this.title, required this.image});

  factory CategoryItems.fromJson(Map<String, dynamic> json) {
    return CategoryItems(
      id: json['id'],
      title: json['title'],
      image: json['image'],
    );
  }
}

class PopularItem {
  final String id;
  final String name;
  final String description;
  final String image;
  final int calories;

  PopularItem({required this.id, required this.name, required this.description, required this.image, required this.calories});

  factory PopularItem.fromJson(Map<String, dynamic> json) {
    return PopularItem(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
      calories: json['calories'],
    );
  }
}

class SpecialItem {
  final String id;
  final String name;
  final String description;
  final String image;
  final int calories;

  SpecialItem({required this.id, required this.name, required this.description, required this.image, required this.calories});

  factory SpecialItem.fromJson(Map<String, dynamic> json) {
    return SpecialItem(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
      calories: json['calories'],
    );
  }
}
