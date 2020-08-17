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
  final List<Recipe> recipes;
  final bool hasReachedMax;
  const RecipeLoaded({this.recipes, this.hasReachedMax});

  RecipeLoaded copyWith({
    List<Recipe> recipes,
    bool hasReachedMax,
  }) {
    return RecipeLoaded(
        recipes: recipes ?? this.recipes,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax);
  }

  @override
  List<Object> get props => [recipes, hasReachedMax];
}

class RecipeError extends RecipeState {
  final String message;
  const RecipeError(this.message);

  @override
  List<Object> get props => [message];
}

class RecipeDetailInitial extends RecipeState {
  const RecipeDetailInitial();

  @override
  List<Object> get props => [];
}

class RecipeDetailLoading extends RecipeState {
  const RecipeDetailLoading();

  @override
  List<Object> get props => [];
}

class RecipeDetailLoaded extends RecipeState {
  final Recipe recipe;
  const RecipeDetailLoaded({this.recipe});

  @override
  List<Object> get props => [recipe];
}

class RecipeDetailError extends RecipeState {
  final String message;
  const RecipeDetailError(this.message);

  @override
  List<Object> get props => [message];
}
