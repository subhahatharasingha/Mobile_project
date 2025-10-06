class Category {
  final String categoryId;
  final String name;

  Category({required this.categoryId, required this.name});

  factory Category.fromJson(Map<String, dynamic> json) =>
      Category(categoryId: json['categoryId'] as String, name: json['name'] as String);

  Map<String, dynamic> toJson() => {'categoryId': categoryId, 'name': name};
}
