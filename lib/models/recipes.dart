import 'package:equatable/equatable.dart';

class Recipes extends Equatable {
  final int count;
  final List<Recipes> recipes;

  Recipes({this.count, this.recipes});

  factory Recipes.fromJson(Map<String, dynamic> json) {
    return Recipes(
      count: json['count'],
      recipes: json['recipes'] != null
          ? json['recipes'].map((v) => new Recipes.fromJson(v)).toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    if (this.recipes != null) {
      data['recipes'] = this.recipes.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  List<Object> get props => [this.count, this.recipes];
}
