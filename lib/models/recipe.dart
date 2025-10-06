import 'category.dart';
import 'ingredient.dart';
import 'step_model.dart';

class Recipe {
  final String recipeId;
  final String name;
  final String imageUrl;
  final Category category;
  final List<Ingredient> ingredients;
  final List<StepModel> steps;

  Recipe({
    required this.recipeId,
    required this.name,
    required this.imageUrl,
    required this.category,
    required this.ingredients,
    required this.steps,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      recipeId: json['recipeId'] as String,
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
      category: Category.fromJson(json['category'] as Map<String, dynamic>),
      ingredients: (json['ingredients'] as List<dynamic>)
          .map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
          .toList(),
      steps: (json['steps'] as List<dynamic>)
          .map((e) => StepModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'recipeId': recipeId,
        'name': name,
        'imageUrl': imageUrl,
        'category': category.toJson(),
        'ingredients': ingredients.map((e) => e.toJson()).toList(),
        'steps': steps.map((e) => e.toJson()).toList(),
      };
}
