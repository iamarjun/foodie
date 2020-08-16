import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodie/bloc/recipe_bloc.dart';

class RecipeHomePage extends StatefulWidget {
  RecipeHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _RecipeHomePageState createState() => _RecipeHomePageState();
}

class _RecipeHomePageState extends State<RecipeHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void submit(BuildContext context, String recipe) {
    final recipeBloc = BlocProvider.of<RecipeBloc>(context);
    recipeBloc.add(GetRecipeList(recipe));
  }

  Widget _initial() {
    return Center(
        child: Padding(
      padding: const EdgeInsets.only(
        top: 20,
        left: 16,
        right: 16,
      ),
      child: TextField(
        textInputAction: TextInputAction.search,
        onSubmitted: (query) => submit(context, query),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(
            left: 20,
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          hintText: 'Chicken....',
          suffixIcon: Icon(Icons.search),
          hintStyle: new TextStyle(
            color: Colors.grey[500],
            fontSize: 12,
          ),
        ),
        textAlign: TextAlign.start,
      ),
    ));
  }

  Widget _loading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        elevation: 0.0,
      ),
      body: BlocListener<RecipeBloc, RecipeState>(
        listener: (context, state) {
          if (state is RecipeError) {
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text(
                state.message,
              ),
            ));
          }
        },
        child: BlocBuilder<RecipeBloc, RecipeState>(
          builder: (context, state) {
            if (state is RecipeInitial) {
              return _initial();
            } else if (state is RecipeLoading) {
              return _loading();
            } else if (state is RecipeLoaded) {
              print(state.recipes.map((e) => e.toJson()));
            } else if (state is RecipeError) {
              return _initial();
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
