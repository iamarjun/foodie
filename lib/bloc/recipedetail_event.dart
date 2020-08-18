part of 'recipedetail_bloc.dart';

abstract class RecipeDetailEvent extends Equatable {
  const RecipeDetailEvent();

  @override
  List<Object> get props => [];
}

class GetRecipeDetail extends RecipeDetailEvent {
  final String recipeId;

  const GetRecipeDetail(this.recipeId);

  @override
  List<Object> get props => [recipeId];
}

