import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rshb/domain/change_favorit.dart';
import 'package:rshb/model/list_food.dart';

class AddFavorit extends StatefulWidget {
  AddFavorit({Key key, this.myData, this.index}) : super(key: key);
  final List<Product> myData;
  final int index;

  @override
  _AddFavoritState createState() => _AddFavoritState();
}

class _AddFavoritState extends State<AddFavorit> {
  var isFavorited = false;
  var favoritLoad = false;
  var mySave = <Product>[];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var favorite = Provider.of<ChangeFavorite>(context);
    isFavorited = favorite.added(widget.myData, widget.index);
    favoritLoad = widget.myData[widget.index].favorite;
    return GestureDetector(
      onTap: () {
        setState(() {
          favoritLoad = !favoritLoad;
          isFavorited = favoritLoad;
        });
        favorite.added(widget.myData, widget.index);
        favorite.updateFavorite(
          product: widget.myData,
          index: widget.index,
        );
      },
      child: isFavorited
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
}
