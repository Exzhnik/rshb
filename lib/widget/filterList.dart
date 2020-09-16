import 'package:flutter/material.dart';
import 'package:rsxb/widget/filter_categoria.dart';

class FilterList extends StatelessWidget {
  const FilterList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16),
      child: SizedBox(
        height: 70,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            FilterCategoria(
              url: 'assets/sort.png',
              text: 'Сортировать',
            ),
            FilterCategoria(
              url: 'assets/vega.png',
              text: 'Овощи \nи фрукты',
            ),
            FilterCategoria(
              url: 'assets/meat.png',
              text: 'Хлеб \nи выпечка',
            ),
            FilterCategoria(
              url: 'assets/grocery.png',
              text: 'Молоко \nи яйца',
            ),
            FilterCategoria(
              url: 'assets/grocery.png',
              text: 'Молоко \nи яйца',
            ),
            FilterCategoria(
              url: 'assets/grocery.png',
              text: 'Молоко \nи яйца',
            )
          ],
        ),
      ),
    );
  }
}
