import 'package:app_restaurante_gp3/provider/recipes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'categories_rail_widget.dart';

class CategoryNavigationRailScreen extends StatefulWidget {
  CategoryNavigationRailScreen({Key key}) : super(key: key);

  static const routeName = '/categories_navigation_rail';
  @override
  _CategoryNavigationRailScreenState createState() =>
      _CategoryNavigationRailScreenState();
}

class _CategoryNavigationRailScreenState extends State<CategoryNavigationRailScreen> {
  int _selectedIndex = 0;
  final padding = 8.0;
  String routeArgs;
  String category;
  @override
  void didChangeDependencies() {
    routeArgs = ModalRoute.of(context).settings.arguments.toString();
    _selectedIndex = int.parse(
      routeArgs.substring(1, 2),
    );
    print(routeArgs.toString());
    if (_selectedIndex == 0) {
      setState(() {
        category = 'Entradas';
      });
    }
    if (_selectedIndex == 1) {
      setState(() {
        category = 'Sopas';
      });
    }
    if (_selectedIndex == 2) {
      setState(() {
        category = 'Plato Fuerte';
      });
    }
    if (_selectedIndex == 3) {
      setState(() {
        category = 'Postres';
      });
    }
    if (_selectedIndex == 4) {
      setState(() {
        category = 'Nike';
      });
    }
    
    if (_selectedIndex == 4) {
      setState(() {
        category = 'All';
      });
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          LayoutBuilder(
            builder: (context, constraint) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraint.maxHeight),
                  child: IntrinsicHeight(
                    child: NavigationRail(
                      minWidth: 56.0,
                      groupAlignment: 1.0,
                      selectedIndex: _selectedIndex,
                      onDestinationSelected: (int index) {
                        setState(() {
                          _selectedIndex = index;
                          if (_selectedIndex == 0) {
                            setState(() {
                              category = 'Entradas';
                            });
                          }
                          if (_selectedIndex == 1) {
                            setState(() {
                              category = 'Sopas';
                            });
                          }
                          if (_selectedIndex == 2) {
                            setState(() {
                              category = 'Plato Fuerte';
                            });
                          }
                          if (_selectedIndex == 3) {
                            setState(() {
                              category = 'Postres';
                            });
                          }
                         
                          if (_selectedIndex == 4) {
                            setState(() {
                              category = 'All';
                            });
                          }
                          print(category);
                        });
                      },
                      labelType: NavigationRailLabelType.all,
                      leading: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: CircleAvatar(
                              radius: 16,
                              backgroundImage: NetworkImage(
                                  "https://cdn4.iconfinder.com/data/icons/user-people-2/48/6-512.png"),
                            ),
                          ),
                          SizedBox(
                            height: 80,
                          ),
                        ],
                      ),
                      selectedLabelTextStyle: TextStyle(
                        color: Color(0xffffe6bc97),
                        fontSize: 20,
                        letterSpacing: 1,
                        decoration: TextDecoration.underline,
                        decorationThickness: 2.5,
                      ),
                      unselectedLabelTextStyle: TextStyle(
                        fontSize: 15,
                        letterSpacing: 0.8,
                      ),
                      destinations: [
                        buildRotatedTextRailDestination('Entradas', padding),
                        buildRotatedTextRailDestination("Sopas", padding),
                        buildRotatedTextRailDestination("Plato Fuerte", padding),
                        buildRotatedTextRailDestination("Postres", padding),
                        buildRotatedTextRailDestination("All", padding),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          // This is the main content.

          ContentSpace(context, category)
        ],
      ),
    );
  }
}

NavigationRailDestination buildRotatedTextRailDestination(
    String text, double padding) {
  return NavigationRailDestination(
    icon: SizedBox.shrink(),
    label: Padding(
      padding: EdgeInsets.symmetric(vertical: padding),
      child: RotatedBox(
        quarterTurns: -1,
        child: Text(text),
      ),
    ),
  );
}

class ContentSpace extends StatelessWidget {
  // final int _selectedIndex;

  final String category;
  ContentSpace(BuildContext context, this.category);

  @override
  Widget build(BuildContext context) {
    final recipesData = Provider.of<Recipes>(context, listen: false);
    final recipesCategory = recipesData.findByCatAll(category);
    if(category=='All'){
      for(int i=0; i<recipesData.recipes.length;i++){
        recipesCategory.add(recipesData.recipes[i]);
      }
    }
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 8, 0, 0),
        child: MediaQuery.removePadding(
          removeTop: true,
          context: context,
          child: ListView.builder(
            itemCount: recipesCategory.length,
            itemBuilder: (BuildContext context, int index) =>
                ChangeNotifierProvider.value(
                    value: recipesCategory[index], child: CategoriesNavigationRail()),
          ),
        ),
      ),
    );
  }
}
