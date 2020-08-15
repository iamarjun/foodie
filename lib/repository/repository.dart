import 'package:foodie/models/recipe.dart';
import 'package:foodie/models/recipes.dart';

abstract class Repository {
  Future<Recipes> fetchRecipes(String recipe);
  Future<Recipe> fetchRecipeDetail(String recipeId);
}
