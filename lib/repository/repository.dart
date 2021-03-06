import 'package:foodie/models/recipe.dart';
import 'package:foodie/service/api_service.dart';

abstract class Repository {
  Future<List<Recipe>> fetchRecipes({String recipe, int pageNo});
  Future<Recipe> fetchRecipeDetail(String recipeId);
}

class RecipeRepository extends Repository {
  final ApiService apiService;

  RecipeRepository(this.apiService);

  @override
  Future<Recipe> fetchRecipeDetail(String recipeId) {
    return apiService.fetchRecipeDetail(recipeId: recipeId);
  }

  @override
  Future<List<Recipe>> fetchRecipes({String recipe, int pageNo}) {
    return apiService.fetchRecipes(recipe: recipe, pageNo: pageNo);
  }
}
