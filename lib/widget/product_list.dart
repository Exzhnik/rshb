import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rshb/config/colors.dart';
import 'package:rshb/config/styles.dart';
import 'package:rshb/model/list_food.dart';
import 'package:rshb/widget/add_favorites.dart';
import 'package:rshb/extension/string_ext.dart';

class ProductList extends StatelessWidget {
  ProductList({this.listProduct});
  final List<Product> listProduct;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        itemCount: listProduct.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            childAspectRatio: width / 650,
            crossAxisCount: 2),
        itemBuilder: (context, index) {
          var myData = listProduct;
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
                          myData[index].price.floor().toString().unicodeRuble(),
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

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IterableProperty<Product>('listProduct', listProduct));
  }
}
