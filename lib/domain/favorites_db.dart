import 'package:hive/hive.dart';

class FavoritesDB {
  Future<void> addId(int id) async {
    var box = Hive.box<int>('favorites');
    await box.add(id);
  }

  Future<void> removeId(int id) async {
    var box = Hive.box<int>('favorites');
    for (var i = 0; i < box.values.length; i++) {
      if (box.getAt(i) == id) {
        await box.deleteAt(i);
      }
    }
  }
}
