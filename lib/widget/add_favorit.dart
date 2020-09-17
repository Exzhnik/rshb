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
  var myInt = <int>[];

  @override
  void initState() {
    super.initState();
    FavoriteContains().loadFavorit().then((value) => setState(() {
          myInt = value;
        }));
  }

  @override
  Widget build(BuildContext context) {
    var favorite = Provider.of<ChangeFavorite>(context);

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
        favorite.updateFavorite(
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
}
