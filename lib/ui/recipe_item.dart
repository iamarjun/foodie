import 'package:flutter/material.dart';
import 'package:foodie/models/recipe.dart';
import 'package:foodie/ui/recipe_detail.dart';

class RecipeItem extends StatelessWidget {
  const RecipeItem(this._recipe, {Key key}) : super(key: key);
  static const double _radius = 8;
  final Recipe _recipe;

  @override
  Widget build(BuildContext context) {
    Widget bottomSheet() {
      showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) => RecipeDetail(),
      );
    }

    return InkWell(
      onTap: () => bottomSheet(),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_radius),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(_radius),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(
                _recipe.imageUrl,
                fit: BoxFit.cover,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 50,
                  width: double.infinity,
                  color: const Color(0xFF000000).withOpacity(0.5),
                  child: Center(
                    child: Text(
                      _recipe.title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
