import 'package:app_restaurante_gp3/consts/my_icons.dart';
import 'package:app_restaurante_gp3/provider/favs_provider.dart';
import 'package:app_restaurante_gp3/services/global_method.dart';

import 'package:app_restaurante_gp3/widget/favorite_empty.dart';
import 'package:app_restaurante_gp3/widget/favorite_full.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/* Clase que se encarga de mostrar los favoritos del Usuario */
class FavoritesScreen extends StatelessWidget {
  static const routeName = '/FavoritesScreen';
  @override
  Widget build(BuildContext context) {
    GlobalMethods globalMethods =GlobalMethods();
    final favsProvider =Provider.of<FavsProvider>(context);
    return favsProvider.getFavsItems.isEmpty
        ? Scaffold(body: FavoriteEmpty())
        : Scaffold(
            appBar: AppBar(
              title: Text('Mis Recetas Favoritas (${favsProvider.getFavsItems.length})'),
              actions: [
                IconButton(
                  onPressed: () {
                     globalMethods.showDialogg(
                                  'Limpiar Favoritos!',
                                  'Se borraran todas las recetas favoritas',
                                  () => favsProvider
                                      .clearFavs(),context);
                    // cartProvider.clearCart();
                  },
                  icon: Icon(MyAppIcons.trash),
                )
              ],
            ),
            body: ListView.builder(
              itemCount: favsProvider.getFavsItems.length,
              itemBuilder: (BuildContext ctx, int index) {
                return ChangeNotifierProvider.value(
                  value: favsProvider.getFavsItems.values.toList()[index],
                  child: FavoriteFull(
                    productId: favsProvider.getFavsItems.keys.toList()[index],
                  ));
              },
            ),
          );
  }
}
