import 'package:flutter/material.dart';
import 'package:rsxb/domain/pref_save.dart';
import 'package:rsxb/model/list_food.dart';

class ChangeFavorit extends ChangeNotifier {
  ChangeFavorit() {
    loadFavorit();
  }
  var favorites = <Product>[];
  final _saved = Set<Product>();
  bool _isChange = false;

  bool get isChange => _isChange;

  set isChange(bool value) => _isChange = value;

  void addFavorite(List<Product> product, int index) {
    favorites.add(product[index]);
    PrefSave().save('favorit', favorites);
    notifyListeners();
  }

  void removeFavorite(List<Product> product, int index) {
    favorites.remove(product[index]);
    PrefSave().save('favorit', favorites);
    notifyListeners();
  }

  void updateFavorite({List<Product> product, int index}) {
    product[index].favorite = !product[index].favorite;
    _isChange = product[index].favorite;
    if (!isChange) {
      addFavorite(product, index);
    } else {
      removeFavorite(product, index);
    }
  }

  Future<List<Product>> loadFavorit() async {
    var stringProduct = await PrefSave().read('favorit');
    favorites = List<Product>.from(
        stringProduct.map((e) => Product.fromJson(e as Map<String, dynamic>)));
    return favorites;
  }

  bool added(List<Product> myProv, int index) {
    // myProv.forEach((element)=>element.id==widget.myData[widget.index].id);
    if ((favorites.singleWhere((it) => it.id == myProv[index].id,
            orElse: () => null)) !=
        null) {
      return true;
    } else {
      return false;
    }
  }
}
