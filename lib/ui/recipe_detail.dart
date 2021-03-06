import 'package:flutter/material.dart';
import 'package:foodie/models/recipe.dart';

class RecipeDetail extends StatelessWidget {
  final Recipe recipe;
  const RecipeDetail({this.recipe, key}) : super(key: key);

  final double _radius = 150.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  top: _radius / 2.0,
                ),

                ///here we create space for the circle avatar to get out of the box
                child: Container(
                  height: 300.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 8.0,
                        offset: Offset(0.0, 2.0),
                      ),
                    ],
                  ),
                  child: Padding(
                      padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: _radius / 2,
                          ),
                          Text(
                            recipe.title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16.0),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            'Ingredients',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 14.0,
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Flexible(
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  recipe.ingredients != null
                                      ? recipe.ingredients.join('\n')
                                      : '',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 14.0),
                            child: Container(),
                          ),
                        ],
                      )),
                ),
              ),

              ///Image Avatar
              Container(
                width: _radius,
                height: _radius,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8.0,
                      offset: Offset(0.0, 5.0),
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Center(
                    child: Container(
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(recipe.imageUrl),
                        radius: _radius,
                        backgroundColor: Colors.green[800],
                      ),

                      /// replace your image with the Icon
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
