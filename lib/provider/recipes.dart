import 'package:app_restaurante_gp3/models/recipe.dart';
import 'package:app_restaurante_gp3/widget/popular_recipes.dart';
import 'package:flutter/cupertino.dart';

/* Proovedor que llena de datos crudos la aplicacion */
class Recipes with ChangeNotifier {
  List<Recipe> _recipes = [
    Recipe(
        id: 'Soup1',
        imageUrl:
            'https://static01.nyt.com/images/2018/02/21/dining/00RICEGUIDE8/00RICEGUIDE8-articleLarge.jpg',
        name: 'Sopa',
        videoUrl: 'https://youtu.be/fx6xZDhv_ps',
        time: '2 hours',
        ingredients:  'Water, Spices, vegetables',
        quantity: 3,
        preparation:
            'Para preparar esta sopa...',
        recipeCategoryName: 'Sopas',
        isPopular: true),
        Recipe(
        id: 'Soup2',
        imageUrl:
            'https://static01.nyt.com/images/2018/02/21/dining/00RICEGUIDE8/00RICEGUIDE8-articleLarge.jpg',
        name: 'Arroz',
        videoUrl: 'https://youtu.be/fx6xZDhv_ps',
        time: '1 hora',
        ingredients:  'Water, Spices, vegetables',
        quantity: 3,
        preparation:
            'Para preparar este arroz...',
        recipeCategoryName: 'Plato Fuerte',
        isPopular: true),
        Recipe(
        id: 'Soup3',
        imageUrl:
            'https://static01.nyt.com/images/2018/02/21/dining/00RICEGUIDE8/00RICEGUIDE8-articleLarge.jpg',
        name: 'Ensaladas',
        videoUrl: 'https://youtu.be/fx6xZDhv_ps',
        time: '30 minutos',
        ingredients:  'Water, Spices, vegetables',
        quantity: 3,
        preparation:
            'Para preparar esta ensalada...',
        recipeCategoryName: 'Entradas',
        isPopular: false),
        Recipe(
        id: 'Soup4',
        imageUrl:
            'https://static01.nyt.com/images/2018/02/21/dining/00RICEGUIDE8/00RICEGUIDE8-articleLarge.jpg',
        name: 'Helado',
        videoUrl: 'https://youtu.be/fx6xZDhv_ps',
        time: '3 horas',
        ingredients:  'Water, Spices, vegetables',
        quantity: 3,
        preparation:
            'Para preparar este helado...',
        recipeCategoryName: 'Postres',
        isPopular: true),
  ];

  List<Recipe> get recipes {
    return [..._recipes];
  }

  List<Recipe> get popularRecipes {
    return _recipes.where((element) => element.isPopular).toList();
  }

  Recipe findById(String recipeId) {
    return _recipes.firstWhere((element) => element.id == recipeId);
  }

  List<Recipe> findByCategory(String categoryName) {
    List _categoryList = _recipes
        .where((element) => element.recipeCategoryName
            .toLowerCase()
            .contains(categoryName.toLowerCase()))
        .toList();
    return _categoryList;
  }

  List<Recipe> findByBrand(String brandName) {
    List _categoryList = _recipes
        .where((element) =>
            element.recipeCategoryName.toLowerCase().contains(brandName.toLowerCase()))
        .toList();
    return _categoryList;
  }
}
