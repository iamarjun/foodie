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
