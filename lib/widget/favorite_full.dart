import 'package:app_restaurante_gp3/consts/colors.dart';
import 'package:app_restaurante_gp3/models/favs_attr.dart';
import 'package:app_restaurante_gp3/provider/favs_provider.dart';
import 'package:app_restaurante_gp3/services/global_method.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteFull extends StatefulWidget {
  final String recipeId;

  const FavoriteFull({this.recipeId});
  @override
  _FavoriteFullState createState() => _FavoriteFullState();
}

class _FavoriteFullState extends State<FavoriteFull> {
  @override
  Widget build(BuildContext context) {
    final favsAttr = Provider.of<FavsAttr>(context);
    return Stack(
      children: <Widget>[
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(right: 30.0, bottom: 10.0),
          child: Material(
            color: Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.circular(5.0),
            elevation: 3.0,
            child: InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 80,
                      child: Image.network(favsAttr.imageUrl),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            favsAttr.title,
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            favsAttr.recipeCategoryName,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18.0),
                          ),
                          Text(
                            favsAttr.time,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18.0),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        positionedRemove(widget.recipeId),
      ],
    );
  }

  Widget positionedRemove(String recipeId) {
    final favsProvider = Provider.of<FavsProvider>(context);
    GlobalMethods globalMethods = GlobalMethods();
    return Positioned(
      top: 20,
      right: 15,
      child: Container(
        height: 30,
        width: 30,
        child: MaterialButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            padding: EdgeInsets.all(0.0),
            color: ColorsConsts.favColor,
            child: Icon(
              Icons.clear,
              color: Colors.white,
            ),
            onPressed: () => {
                  globalMethods.showDialogg(
                      'Remover Favorito!',
                      'Esta receta sera eliminada de su lista',
                      () => favsProvider.removeItem(recipeId),
                      context),
                }),
      ),
    );
  }
}
