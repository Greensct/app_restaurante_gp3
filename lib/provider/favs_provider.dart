import 'package:app_restaurante_gp3/models/favs_attr.dart';
import 'package:flutter/cupertino.dart';

/* Proovedor que remueve o limpia los archivos favoritos de la vista favoritos*/
class FavsProvider with ChangeNotifier {
  Map<String, FavsAttr> _favsItems = {};

  Map<String, FavsAttr> get getFavsItems {
    return {..._favsItems};
  }

  void addAndRemoveFromFav(
      String recipeId, String time, String title, String imageUrl, String recipeCategoryName) {
    if (_favsItems.containsKey(recipeId)) {
      removeItem(recipeId);
    } else {
      _favsItems.putIfAbsent(
          recipeId,
          () => FavsAttr(
              id: DateTime.now().toString(),
              title: title,
              time: time,
              imageUrl: imageUrl,
              recipeCategoryName: recipeCategoryName));
    }
    notifyListeners();
  }

  void removeItem(String recipeId) {
    _favsItems.remove(recipeId);
    notifyListeners();
  }

  void clearFavs() {
    _favsItems.clear();
    notifyListeners();
  }
}
