import 'package:app_restaurante_gp3/models/favs_attr.dart';
import 'package:flutter/cupertino.dart';

/* Proovedor que remueve o limpia los archivos favoritos de la vista favoritos*/
class FavsProvider with ChangeNotifier {
  Map<String, FavsAttr> _favsItems = {};

  Map<String, FavsAttr> get getFavsItems {
    return {..._favsItems};
  }

  void addAndRemoveFromFav(
      String productId, double price, String title, String imageUrl) {
    if (_favsItems.containsKey(productId)) {
      removeItem(productId);
    } else {
      _favsItems.putIfAbsent(
          productId,
          () => FavsAttr(
              id: DateTime.now().toString(),
              title: title,
              price: price,
              imageUrl: imageUrl));
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _favsItems.remove(productId);
    notifyListeners();
  }

  void clearFavs() {
    _favsItems.clear();
    notifyListeners();
  }
}
