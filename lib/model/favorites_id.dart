import 'package:hive/hive.dart';
part 'favorites_id.g.dart';

@HiveType(typeId: 0)
class FavoritesId extends HiveObject {
  @HiveField(0)
  int id;
}
