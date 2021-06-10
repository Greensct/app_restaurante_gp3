import 'package:app_restaurante_gp3/consts/theme_data.dart';
import 'package:app_restaurante_gp3/inner_screens/recipe_details.dart';
import 'package:app_restaurante_gp3/provider/dark_theme_provider.dart';
import 'package:app_restaurante_gp3/provider/recipes.dart';
import 'package:app_restaurante_gp3/screens/bottom_bar.dart';
import 'package:app_restaurante_gp3/screens/favorites.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'inner_screens/categories_navigation_rail.dart';
import 'inner_screens/categories_feeds.dart';
import 'provider/favs_provider.dart';
import 'screens/tips.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreferences.getTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) {
            return themeChangeProvider;
          }),
          ChangeNotifierProvider(
            create: (_) => Recipes(),
          ),
          ChangeNotifierProvider(
            create: (_) => FavsProvider(),
          ),
        ],
        child:
            Consumer<DarkThemeProvider>(builder: (context, themeData, child) {
          return MaterialApp(
            title: 'DAMII App Restaurante Grupo 3',
            theme: Styles.themeData(themeChangeProvider.darkTheme, context),
            home: BottomBarScreen(),
            //initialRoute: '/',
            routes: {
              //   '/': (ctx) => LandingPage(),
              CategoryNavigationRailScreen.routeName: (ctx) =>
                  CategoryNavigationRailScreen(),

              Tips.routeName: (ctx) => Tips(),
              FavoritesScreen.routeName: (ctx) => FavoritesScreen(),
              RecipeDetails.routeName: (ctx) => RecipeDetails(),
              CategoriesFeedsScreen.routeName: (ctx) => CategoriesFeedsScreen(),
            },
          );
        }));
  }
}
