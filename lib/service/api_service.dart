import 'dart:convert';
import 'dart:io';

import 'package:foodie/models/recipe.dart';
import 'package:foodie/models/recipe_detail.dart';
import 'package:foodie/models/recipes.dart';
import 'package:foodie/service/api_exceptions.dart';
import 'package:http/http.dart';

class ApiService {
  static final ApiService _instance = ApiService._in();

  factory ApiService() => _instance;

  ApiService._in();

  Future<List<Recipe>> fetchRecipes({String recipe, int pageNo}) async {
    var recipes;

    try {
      final response = await get(
          'https://recipesapi.herokuapp.com/api/search?q=$recipe&pageNo=$pageNo');
      print(pageNo);
      recipes = Recipes.fromJson(_returnResponse(response)).recipes;
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }

    return recipes;
  }

  Future<Recipe> fetchRecipeDetail({String recipeId}) async {
    var recipe;
    try {
      final response =
          await get('http://recipesapi.herokuapp.com/api/get?rId=$recipeId');
      recipe = RecipeDetail.fromJson(_returnResponse(response)).recipe;
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }

    return recipe;
  }

  dynamic _returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
