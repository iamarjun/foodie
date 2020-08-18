import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:foodie/models/recipe.dart';
import 'package:foodie/repository/repository.dart';

part 'recipedetail_event.dart';
part 'recipedetail_state.dart';

class RecipeDetailBloc extends Bloc<RecipeDetailEvent, RecipeDetailState> {
  final Repository recipeRepository;
  RecipeDetailBloc(this.recipeRepository) : super(RecipeDetailInitial());

  @override
  Stream<RecipeDetailState> mapEventToState(
    RecipeDetailEvent event,
  ) async* {
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
}
