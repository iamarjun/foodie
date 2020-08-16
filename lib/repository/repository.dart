import 'package:foodie/models/recipe.dart';
import 'package:foodie/models/recipes.dart';

abstract class Repository {
  Future<Recipes> fetchRecipes(String recipe);
  Future<Recipe> fetchRecipeDetail(String recipeId);
}


class RecipeRepository extends Repository {
  @override
  Future<Recipe> fetchRecipeDetail(String recipeId) {
      // TODO: implement fetchRecipeDetail
      throw UnimplementedError();
    }
  
    @override
    Future<Recipes> fetchRecipes(String recipe) {
    // TODO: implement fetchRecipes
    throw UnimplementedError();
  }

}