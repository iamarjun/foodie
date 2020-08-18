import 'package:equatable/equatable.dart';
import "recipe.dart";

class RecipeDetail extends Equatable  {
	final Recipe recipe;

	RecipeDetail({this.recipe});

	factory RecipeDetail.fromJson(Map<String, dynamic> json) {
		return RecipeDetail(
			recipe: json['recipe'] != null ? new Recipe.fromJson(json['recipe']) : null,
		);
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.recipe != null) {
      data['recipe'] = this.recipe.toJson();
    }
		return data;
	}

	@override
	List<Object> get props => [
		this.recipe
	];
}
