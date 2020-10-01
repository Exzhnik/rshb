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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var favorite = Provider.of<ChangeFavorites>(context);

    if (favorite.added(widget.myData, widget.index) == true) {
      widget.myData[widget.index].favorite = true;
    } else {
      widget.myData[widget.index].favorite = false;
    }

    return GestureDetector(
      onTap: () {
        setState(() {
          widget.myData[widget.index].favorite =
              !widget.myData[widget.index].favorite;
        });
        favorite.updateFavorites(
          product: widget.myData,
          index: widget.index,
        );
      },
      child: widget.myData[widget.index].favorite
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
    properties.add(IterableProperty<int>('myInt', myInt));
  }
}
