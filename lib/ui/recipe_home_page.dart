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
        child: Padding(
      padding: const EdgeInsets.only(
        top: 20,
        left: 16,
        right: 16,
      ),
      child: TextField(
        controller: _textController,
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
