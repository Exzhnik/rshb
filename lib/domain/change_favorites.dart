import 'package:flutter/material.dart';
import 'package:rshb/domain/pref_save.dart';
import 'package:rshb/model/product.dart';

class ChangeFavorites extends ChangeNotifier {
  ChangeFavorites() {
    loadFavorites();
  }
  var favorites = <int>[];
  bool _isChange = false;

  void addFavorites(List<Product> product, int index) {
    favorites.add(product[index].id);
    PrefSave().save('favorites', favorites);
    notifyListeners();
  }

  void removeFavorites(List<Product> product, int index) {
    favorites.remove(product[index].id);
    PrefSave().save('favorites', favorites);
    notifyListeners();
  }

  void updateFavorites({List<Product> product, int index}) {
    product[index].favorite = !product[index].favorite;
    _isChange = product[index].favorite;
    if (!_isChange) {
      addFavorites(product, index);
    } else {
      removeFavorites(product, index);
    }
  }

  Future loadFavorites() async {
    var stringProduct = await PrefSave().read('favorit');
    favorites = List<int>.from(stringProduct);
  }

  bool added(List<Product> myProv, int index) {
    return favorites.contains(myProv[index].id);
  }
}
