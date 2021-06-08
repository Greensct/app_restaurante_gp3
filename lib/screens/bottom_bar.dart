import 'package:app_restaurante_gp3/consts/my_icons.dart';
import 'package:app_restaurante_gp3/screens/search.dart';
import 'package:app_restaurante_gp3/screens/user.dart';
import 'package:app_restaurante_gp3/screens/favorites.dart';
import 'package:flutter/material.dart';

import 'tips.dart';
import 'recipe.dart';
/* Vista del bottom bar, que muestra los 4 menus principales */
class BottomBarScreen extends StatefulWidget {
  @override
  _BottomBarScreenState createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        'page': Recipe(),
      },
      {
        'page': Tips(),
      },
      {
        'page': Search(),
      },
      {
        'page': FavoritesScreen(),
      },
      {
        'page': User(),
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomAppBar(
        // color: Colors.white,
        shape: CircularNotchedRectangle(),
        notchMargin: 0.01,
        clipBehavior: Clip.antiAlias,
        child: Container(
          height: kBottomNavigationBarHeight * 0.98,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(
                  color: Colors.grey,
                  width: 0.5,
                ),
              ),
            ),
            child: BottomNavigationBar(
              onTap: _selectPage,
              backgroundColor: Theme.of(context).primaryColor,
              unselectedItemColor: Theme.of(context).textSelectionColor,
              selectedItemColor: Colors.green,
              currentIndex: _selectedPageIndex,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(MyAppIcons.home),
                  title: Text('Recetas'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(MyAppIcons.rss),
                  title: Text('Tips'),
                ),
                BottomNavigationBarItem(
                  activeIcon: null,
                  icon: Icon(null),
                  title: Text('Buscar'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    MyAppIcons.star,
                  ),
                  title: Text('Favoritos'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(MyAppIcons.user),
                  title: Text('Usuario'),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          backgroundColor: Colors.green,
          hoverElevation: 10,
          splashColor: Colors.grey,
          tooltip: 'Buscar',
          elevation: 4,
          child: Icon(MyAppIcons.search),
          onPressed: () => setState(() {
            _selectedPageIndex = 2;
          }),
        ),
      ),
    );
  }
}
