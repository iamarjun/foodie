import 'package:flutter/material.dart';
import 'package:foodie/models/recipe.dart';

class RecipeItem extends StatelessWidget {
  const RecipeItem(this._recipe, {Key key}) : super(key: key);
  static const double _radius = 50;
  final Recipe _recipe;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(_radius),
            bottomLeft: Radius.circular(_radius),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: _radius,
                ),
                CircleAvatar(
                  radius: _radius - 5,
                  backgroundImage: NetworkImage(_recipe.imageUrl),
                ),
              ],
            ),
            SizedBox(
              width: 10,
            ),
            Flexible(
              child: Text(
                '${_recipe.title}',
                style: TextStyle(fontSize: 18),
              ),
            )
          ],
        ),
      ),
    );
  }
}
