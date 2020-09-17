import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rshb/config/colors.dart';
import 'package:rshb/config/styles.dart';
import 'package:rshb/domain/change_favorit.dart';
import 'package:rshb/domain/food_api.dart';
import 'package:rshb/model/list_food.dart';
import 'package:rshb/widget/add_favorit.dart';
import 'package:rshb/widget/rating.dart';

class Food extends StatefulWidget {
  Food({Key key}) : super(key: key);

  @override
  _FoodState createState() => _FoodState();
}

class _FoodState extends State<Food> {
  // bool isFavorited = false;

  Future<ListFood> future;
  @override
  void initState() {
    super.initState();
    future = FoodApi.listFood();
  }

  @override
  Widget build(BuildContext context) {
    final favorite = Provider.of<ChangeFavorite>(context);
    return FutureBuilder<ListFood>(
        future: future,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: GridView.builder(
                    itemCount: snapshot.data.products.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        childAspectRatio: 0.65,
                        crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      var myData = snapshot.data.products;
                      return Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.borderColor,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: Image.asset(
                                    myData[index].image,
                                    height: 110,
                                    width: 103,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 11, right: 11),
                                  child: Align(
                                      alignment: Alignment.topRight,
                                      child: AddFavorit(
                                        myData: myData,
                                        index: index,
                                      )),
                                ),
                              ],
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
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
                      );
                    },
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        });
  }
}
