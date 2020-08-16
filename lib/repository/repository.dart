import 'package:foodie/models/recipe.dart';

abstract class Repository {
  Future<List<Recipe>> fetchRecipes(String recipe);
  Future<Recipe> fetchRecipeDetail(String recipeId);
}

class RecipeRepository extends Repository {
  @override
  Future<Recipe> fetchRecipeDetail(String recipeId) {
    // TODO: implement fetchRecipeDetail
    throw UnimplementedError();
  }

  @override
  Future<List<Recipe>> fetchRecipes(String recipe) {
    // TODO: implement fetchRecipes
    throw UnimplementedError();
  }
}
