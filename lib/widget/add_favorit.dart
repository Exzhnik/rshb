import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rsxb/domain/change_favorit.dart';
import 'package:rsxb/model/list_food.dart';

class AddFavorit extends StatefulWidget {
  AddFavorit({Key key, this.myData, this.index}) : super(key: key);
  final List<Product> myData;
  final int index;

  @override
  _AddFavoritState createState() => _AddFavoritState();
}

class _AddFavoritState extends State<AddFavorit> {
  bool isFavorited = false;
  var mySave = <Product>[];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var changeFavorit = Provider.of<ChangeFavorit>(context);
    isFavorited = changeFavorit.added(widget.myData, widget.index);

    return GestureDetector(
      onTap: () => {
        setState(() {
          isFavorited = changeFavorit.isChange;
        }),
        changeFavorit.updateFavorite(
          product: widget.myData,
          index: widget.index,
        ),
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

  bool added(List<Product> myProv) {
    // myProv.forEach((element)=>element.id==widget.myData[widget.index].id);
    if ((myProv.singleWhere((it) => it.id == widget.myData[widget.index].id,
            orElse: () => null)) !=
        null) {
      return true;
    } else {
      return false;
    }
  }
}
