import 'package:equatable/equatable.dart';

class Recipe extends Equatable {
  final List<dynamic> ingredients;
  final String imageUrl;
  final double socialRank;
  final String id;
  final String publisher;
  final String sourceUrl;
  final String recipeId;
  final String publisherUrl;
  final String title;
  final int v;

  Recipe(
      {this.ingredients,
      this.imageUrl,
      this.socialRank,
      this.id,
      this.publisher,
      this.sourceUrl,
      this.recipeId,
      this.publisherUrl,
      this.title,
      this.v});

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      ingredients: json['ingredients'],
      imageUrl: json['image_url'],
      socialRank: json['social_rank'] is int
          ? 0.0 + json['social_rank']
          : json['social_rank'],
      id: json['_id'],
      publisher: json['publisher'],
      sourceUrl: json['source_url'],
      recipeId: json['recipe_id'],
      publisherUrl: json['publisher_url'],
      title: json['title'],
      v: json['__v'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ingredients'] = this.ingredients;
    data['image_url'] = this.imageUrl;
    data['social_rank'] = this.socialRank;
    data['_id'] = this.id;
    data['publisher'] = this.publisher;
    data['source_url'] = this.sourceUrl;
    data['recipe_id'] = this.recipeId;
    data['publisher_url'] = this.publisherUrl;
    data['title'] = this.title;
    data['__v'] = this.v;
    return data;
  }

  @override
  List<Object> get props => [
        this.ingredients,
        this.imageUrl,
        this.socialRank,
        this.id,
        this.publisher,
        this.sourceUrl,
        this.recipeId,
        this.publisherUrl,
        this.title,
        this.v
      ];
}
