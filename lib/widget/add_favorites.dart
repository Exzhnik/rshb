import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rshb/domain/change_favorites.dart';
import 'package:rshb/model/product.dart';

class AddFavorites extends StatefulWidget {
  AddFavorites({Key key, this.myData, this.index}) : super(key: key);
  final List<Product> myData;
  final int index;

  @override
  _AddFavoritState createState() => _AddFavoritState();
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(IterableProperty<Product>('myData', myData))
      ..add(IntProperty('index', index));
  }
}

class _AddFavoritState extends State<AddFavorites> {
  var myInt = <int>[];
  ChangeFavorites favorites;

  @override
  void didChangeDependencies() {
    favorites = Provider.of<ChangeFavorites>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          favorites.updateFavorites(id: widget.myData[widget.index].id),
      child: favorites.favorites.contains(widget.myData[widget.index].id)
          ? Image.asset(
              'assets/favorit.png',
              height: 32,
              width: 32,
            )
          : Image.asset(
              'assets/notFavorit.png',
              height: 32,
              width: 32,
            ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(IterableProperty<int>('myInt', myInt))
      ..add(DiagnosticsProperty<ChangeFavorites>('favorites', favorites));
  }
}
