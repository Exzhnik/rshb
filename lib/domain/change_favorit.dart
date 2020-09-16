import 'package:flutter/material.dart';
import 'package:rshb/domain/pref_save.dart';
import 'package:rshb/model/list_food.dart';

class ChangeFavorite extends ChangeNotifier {
  ChangeFavorite() {
    loadFavorit();
  }
  var favorites = <int>[];
  final _saved = Set<Product>();
  bool _isChange = false;

  bool get isChange => _isChange;

  set isChange(bool value) => _isChange = value;

  void addFavorite(List<Product> product, int index) {
    favorites.add(product[index].id);
    PrefSave().save('favorit', favorites);
    notifyListeners();
  }

  void removeFavorite(List<Product> product, int index) {
    favorites.remove(product[index].id);
    PrefSave().save('favorit', favorites);
    notifyListeners();
  }

  void updateFavorite({List<Product> product, int index}) {
    product[index].favorite = !product[index].favorite;
    _isChange = product[index].favorite;
    if (!isChange) {
      addFavorite(product, index);
      // added(product, index);
    } else {
      removeFavorite(product, index);
      // added(product, index);
    }
  }

  Future loadFavorit() async {
    var stringProduct = await PrefSave().read('favorit');
    favorites = List<int>.from(stringProduct);
  }

  bool added(List<Product> myProv, int index) {
    return favorites.contains(myProv[index].id);
  }
}
