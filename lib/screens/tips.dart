import 'package:app_restaurante_gp3/models/recipe.dart';
import 'package:app_restaurante_gp3/provider/recipes.dart';
import 'package:app_restaurante_gp3/widget/feeds_recipes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Tips extends StatelessWidget {
  static const routeName = '/Tips';
  @override
  Widget build(BuildContext context) {
    final popular= ModalRoute.of(context).settings.arguments as String;
    final recipesProvider = Provider.of<Recipes>(context);
    List<Recipe> recipesList = recipesProvider.products;
    if(popular =='popular'){
      recipesList=recipesProvider.popularProducts;
    }
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 240 / 420,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        children: List.generate(recipesList.length, (index) {
          return ChangeNotifierProvider.value(
            value: recipesList[index],
            child: TipsRecipes(),
          );
        }),
      ),
    );
  }
}
