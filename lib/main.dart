import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodie/bloc/recipe_bloc.dart';
import 'package:foodie/repository/repository.dart';
import 'package:foodie/service/api_service.dart';
import 'package:foodie/ui/recipe_home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider(
        create: (context) => RecipeBloc(RecipeRepository(ApiService())),
        child: RecipeHomePage(title: 'Foodie'),
      ),
    );
  }
}
