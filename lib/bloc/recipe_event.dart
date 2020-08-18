part of 'recipe_bloc.dart';

abstract class RecipeEvent extends Equatable {
  const RecipeEvent();
}

class ResetEvent extends RecipeEvent {
  const ResetEvent();

  @override
  List<Object> get props => [];
}

class GetRecipeList extends RecipeEvent {
  final String recipeName;

  const GetRecipeList(this.recipeName);

  @override
  List<Object> get props => [recipeName];
}

class GetRecipeDetail extends RecipeEvent {
  final String recipeId;

  const GetRecipeDetail(this.recipeId);

  @override
  List<Object> get props => [recipeId];
}
