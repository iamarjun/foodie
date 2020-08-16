import 'package:equatable/equatable.dart';

class Recipe extends Equatable {
  final String imageUrl;
  final double socialRank;
  final String id;
  final String publisher;
  final String sourceUrl;
  final String recipeId;
  final String publisherUrl;
  final String title;

  Recipe(
      {this.imageUrl,
      this.socialRank,
      this.id,
      this.publisher,
      this.sourceUrl,
      this.recipeId,
      this.publisherUrl,
      this.title});

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
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
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image_url'] = this.imageUrl;
    data['social_rank'] = this.socialRank;
    data['_id'] = this.id;
    data['publisher'] = this.publisher;
    data['source_url'] = this.sourceUrl;
    data['recipe_id'] = this.recipeId;
    data['publisher_url'] = this.publisherUrl;
    data['title'] = this.title;
    return data;
  }

  @override
  List<Object> get props => [
        this.imageUrl,
        this.socialRank,
        this.id,
        this.publisher,
        this.sourceUrl,
        this.recipeId,
        this.publisherUrl,
        this.title
      ];
}
