part of 'recipe_bloc.dart';

abstract class RecipeState extends Equatable {
  const RecipeState();
}

class RecipeInitial extends RecipeState {
  const RecipeInitial();

  @override
  List<Object> get props => [];
}

class RecipeLoading extends RecipeState {
  const RecipeLoading();

  @override
  List<Object> get props => [];
}

class RecipeLoaded extends RecipeState {
  final Recipe recipe;
  const RecipeLoaded(this.recipe);

  @override
  List<Object> get props => [recipe];
}

class RecipeError extends RecipeState {
  final String message;
  const RecipeError(this.message);

  @override
  List<Object> get props => [message];
}
