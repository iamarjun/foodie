import 'package:foodie/models/recipe.dart';
import 'package:foodie/service/api_service.dart';

abstract class Repository {
  Future<List<Recipe>> fetchRecipes(String recipe);
  Future<Recipe> fetchRecipeDetail(String recipeId);
}

class RecipeRepository extends Repository {
  final ApiService apiService;

  RecipeRepository(this.apiService);

  @override
  Future<Recipe> fetchRecipeDetail(String recipeId) {
    // TODO: implement fetchRecipeDetail
    throw UnimplementedError();
  }

  @override
  Future<List<Recipe>> fetchRecipes(String recipe) {
    return apiService.fetchRecipes(recipe);
  }
}
