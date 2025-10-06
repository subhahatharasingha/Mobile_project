import 'package:flutter/material.dart';
import 'models/category.dart';
import 'models/ingredient.dart';
import 'models/recipe.dart';
import 'models/step_model.dart';
import 'models/user.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe Demo',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const RecipeListPage(),
    );
  }
}

class RecipeListPage extends StatefulWidget {
  const RecipeListPage({super.key});
  @override
  State<RecipeListPage> createState() => _RecipeListPageState();
}

class _RecipeListPageState extends State<RecipeListPage> {
  late User user;
  late List<Recipe> recipes;

  @override
  void initState() {
    super.initState();

    user = User(userId: 'u1', name: 'Dhananji', email: 'd@example.com', password: '1234');

    recipes = [
      Recipe(
        recipeId: 'r1',
        name: 'Pancakes',
        imageUrl: '',
        category: Category(categoryId: 'c1', name: 'Breakfast'),
        ingredients: [Ingredient(name: 'Flour', quantity: '2 cups')],
        steps: [StepModel(stepNumber: 1, description: 'Mix ingredients')],
      ),
      Recipe(
        recipeId: 'r2',
        name: 'Scrambled Eggs',
        imageUrl: '',
        category: Category(categoryId: 'c1', name: 'Breakfast'),
        ingredients: [Ingredient(name: 'Eggs', quantity: '3')],
        steps: [StepModel(stepNumber: 1, description: 'Beat eggs')],
      ),
    ];
  }

  void toggleFavorite(Recipe r) {
    setState(() {
      if (user.favorites.any((f) => f.recipeId == r.recipeId)) {
        user.removeFavorite(r.recipeId);
      } else {
        user.addFavorite(r);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipes'),
        actions: [Padding(padding: const EdgeInsets.all(8.0), child: Center(child: Text('Favs: ${user.favorites.length}')))],
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, i) {
          final r = recipes[i];
          final isFav = user.favorites.any((f) => f.recipeId == r.recipeId);
          return ListTile(
            title: Text(r.name),
            subtitle: Text(r.category.name),
            trailing: IconButton(
              icon: Icon(isFav ? Icons.favorite : Icons.favorite_border),
              color: isFav ? Colors.red : null,
              onPressed: () => toggleFavorite(r),
            ),
          );
        },
      ),
    );
  }
}
