import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rshb/config/colors.dart';
import 'package:rshb/config/styles.dart';

import 'package:rshb/model/list_food.dart';
import 'package:rshb/widget/add_favorites.dart';
import 'package:rshb/widget/rating.dart';

import '../model/list_food.dart';

class Food extends StatefulWidget {
  Food({Key key, this.listFood}) : super(key: key);
  final ListFood listFood;
  @override
  _FoodState createState() => _FoodState();
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<ListFood>('listFood', listFood));
  }
}

class _FoodState extends State<Food> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: widget.listFood.products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            childAspectRatio: MediaQuery.of(context).size.width / 650,
            crossAxisCount: 2),
        itemBuilder: (context, index) {
          var myData = widget.listFood.products;
          return Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.borderColor,
              ),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Stack(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Image.asset(
                      myData[index].image,
                      height: 110,
                      width: 103,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        children: [
                          Text(
                            myData[index].title,
                            style: AppStyle.gridTitle,
                          ),
                          Text(
                            ' / ${myData[index].unit}',
                            style: AppStyle.filter,
                          )
                        ],
                      ),
                    ),
                    Rating(
                      rating: myData[index].totalRating.toInt(),
                      countRating: myData[index].ratingCount.toInt(),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.44,
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        myData[index].shortDescription,
                        style: AppStyle.shortDecr,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '${myData[index].price.floor()} \u20BD',
                          style: AppStyle.price,
                        ),
                      ),
                    )
                  ],
                ),
                Positioned(
                    right: 8,
                    top: 8,
                    child: AddFavorites(
                      myData: myData,
                      index: index,
                    )),
              ],
            ),
          );
        },
      ),
    );
  }
}
