import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:rshb/domain/favorites_db.dart';

class ChangeFavorites extends ChangeNotifier {
  ChangeFavorites() {
    readId();
  }
  var favorites = <int>[];

  void updateFavorites({int id}) {
    if (favorites.contains(id)) {
      FavoritesDB().removeId(id);
      favorites.remove(id);
    } else {
      FavoritesDB().addId(id);
      favorites.add(id);
    }
    notifyListeners();
  }

  Future<void> readId() async {
    var box = Hive.box<int>('favorites');
    var listId = <int>[];
    for (var i = 0; i < box.length; i++) {
      listId.add(box.getAt(i));
    }
    favorites = listId;
    notifyListeners();
  }
}
