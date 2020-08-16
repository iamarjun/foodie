import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:foodie/models/recipe.dart';
import 'package:foodie/repository/repository.dart';

part 'recipe_event.dart';
part 'recipe_state.dart';

class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  final Repository recipeRepository;

  RecipeBloc(this.recipeRepository) : super(RecipeInitial());

  @override
  Stream<RecipeState> mapEventToState(
    RecipeEvent event,
  ) async* {
    yield RecipeLoading();
    if (event is GetRecipeList) {
      try {
        final response = await recipeRepository.fetchRecipes(event.recipeName);
        yield RecipeLoaded(response);
      } catch (e) {
        yield RecipeError(e.message);
      }
    }
  }
}
