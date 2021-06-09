import 'package:app_restaurante_gp3/models/recipe.dart';
import 'package:app_restaurante_gp3/provider/recipes.dart';
import 'package:app_restaurante_gp3/widget/feeds_recipes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriesFeedsScreen extends StatelessWidget {
  
  static const routeName = '/CategoriesFeedsScreen';
  @override
  Widget build(BuildContext context) {
    final recipesProvider = Provider.of<Recipes>(context, listen: false);
    final categoryName = ModalRoute.of(context).settings.arguments as String;
    print(categoryName);
    final recipesList= recipesProvider.findByCategory(categoryName);
    return Scaffold(
        body: GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 240 / 420,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      children: List.generate(recipesList.length, (index) {
        return ChangeNotifierProvider.value(
          value: recipesList[index],
          child: TipsRecipes(
          ),
        );
      }),
    ),
        );
  }
}
