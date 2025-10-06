import 'recipe.dart';

class User {
  final String userId;
  String name;
  String email;
  String password; // in production don't store plaintext passwords!
  List<Recipe> favorites;

  User({
    required this.userId,
    required this.name,
    required this.email,
    required this.password,
    List<Recipe>? favorites,
  }) : favorites = favorites ?? [];

  bool login(String email, String password) => this.email == email && this.password == password;

  // signup is usually a backend operation — keep as a stub for UI.
  bool signup() => true;

  void addFavorite(Recipe recipe) {
    if (!favorites.any((r) => r.recipeId == recipe.recipeId)) favorites.add(recipe);
  }

  void removeFavorite(String recipeId) {
    favorites.removeWhere((r) => r.recipeId == recipeId);
  }

  factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json['userId'] as String,
        name: json['name'] as String,
        email: json['email'] as String,
        password: json['password'] as String,
        favorites: (json['favorites'] as List<dynamic>?)
                ?.map((e) => Recipe.fromJson(e as Map<String, dynamic>))
                .toList() ??
            [],
      );

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'name': name,
        'email': email,
        'password': password,
        'favorites': favorites.map((f) => f.toJson()).toList(),
      };
}
