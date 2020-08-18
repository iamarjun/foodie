import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:foodie/models/recipe.dart';
import 'package:foodie/repository/repository.dart';

part 'recipe_event.dart';
part 'recipe_state.dart';

class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  final Repository recipeRepository;
  var _pageNo = 1;

  RecipeBloc(this.recipeRepository) : super(RecipeInitial());

  @override
  Stream<RecipeState> mapEventToState(
    RecipeEvent event,
  ) async* {
    if (event is ResetEvent) {
      yield RecipeInitial();
    }

    if (event is GetRecipeList && !_hasReachedMax(state)) {
      try {
        if (state is RecipeInitial) {
          _pageNo = 1;
          final response = await recipeRepository.fetchRecipes(
              recipe: event.recipeName, pageNo: _pageNo);
          yield RecipeLoaded(recipes: response, hasReachedMax: false);
        }
        if (state is RecipeLoaded) {
          _pageNo++;
          final response = await recipeRepository.fetchRecipes(
              recipe: event.recipeName, pageNo: _pageNo);
          yield response.isEmpty || response.length < 30
              ? (state as RecipeLoaded).copyWith(hasReachedMax: true)
              : RecipeLoaded(
                  recipes: (state as RecipeLoaded).recipes + response,
                  hasReachedMax: false);
        }
      } catch (e) {
        yield RecipeError(e.toString());
      }
    }

    if (event is GetRecipeDetail) {
      yield RecipeDetailLoading();
      try {
        final response =
            await recipeRepository.fetchRecipeDetail(event.recipeId);
        yield RecipeDetailLoaded(recipe: response);
      } catch (e) {
        yield RecipeDetailError(e.toString());
      }
    }
  }

  bool _hasReachedMax(RecipeState state) =>
      state is RecipeLoaded && state.hasReachedMax;
}
