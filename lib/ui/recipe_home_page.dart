import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodie/bloc/recipe_bloc.dart';
import 'package:foodie/models/recipe.dart';
import 'package:foodie/ui/recipe_item.dart';

class RecipeHomePage extends StatefulWidget {
  RecipeHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _RecipeHomePageState createState() => _RecipeHomePageState();
}

class _RecipeHomePageState extends State<RecipeHomePage> {
  final _scrollController = ScrollController();
  final _textController = TextEditingController();
  final _scrollThreshold = 200.0;
  Icon actionIcon = new Icon(
    Icons.search,
    color: Colors.white,
  );

  Widget appBarTitle = new Text(
    "Foodie",
    style: new TextStyle(color: Colors.white),
  );

  _RecipeHomePageState() {
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final recipeBloc = BlocProvider.of<RecipeBloc>(context);
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      recipeBloc.add(GetRecipeList(_textController.text));
    }
  }

  void submit(BuildContext context, String recipe) {
    final recipeBloc = BlocProvider.of<RecipeBloc>(context);
    recipeBloc.add(GetRecipeList(recipe));
  }

  Widget _initial() {
    return Center(
        child: TextField(
      controller: _textController,
      cursorColor: Colors.white,
      textInputAction: TextInputAction.search,
      onSubmitted: (query) => submit(context, query),
      style: TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          prefixIcon: Icon(Icons.search, color: Colors.white),
          hintText: "Chicken...",
          hintStyle: TextStyle(color: Colors.white)),
      textAlign: TextAlign.start,
    ));
  }

  Widget _loading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _recipeList(List<Recipe> recipes) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:
              (MediaQuery.of(context).orientation == Orientation.portrait)
                  ? 2
                  : 3),
      scrollDirection: Axis.vertical,
      controller: _scrollController,
      itemCount: recipes.length,
      itemBuilder: (context, postition) => RecipeItem(recipes[postition]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBarTitle,
        elevation: 0.0,
        actions: <Widget>[
          new IconButton(
            icon: actionIcon,
            onPressed: () {
              setState(() {
                if (this.actionIcon.icon == Icons.search) {
                  this.actionIcon = Icon(Icons.close);
                  this.appBarTitle = _initial();
                } else {
                  this.actionIcon = Icon(Icons.search);
                  this.appBarTitle = Text(widget.title);
                }
              });
            },
          ),
        ],
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
              return _recipeList(state.recipes);
            } else if (state is RecipeError) {
              return _initial();
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _textController.dispose();
    super.dispose();
  }
}
