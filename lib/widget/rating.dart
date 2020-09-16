import 'package:flutter/material.dart';
import 'package:rsxb/config/colors.dart';
import 'package:rsxb/config/styles.dart';
import 'package:rsxb/domain/color_rating.dart';

class Rating extends StatelessWidget {
  Rating({Key key, this.rating, this.countRating}) : super(key: key);
  final int rating;
  final int countRating;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 12, top: 20, bottom: 10),
      child: Row(
        children: [
          Container(
            height: 22,
            width: 22,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: ColorRating().colorRating(rating),
            ),
            child: Align(
              child: Text(
                rating.toString(),
                style: AppStyle.ratingContainer,
              ),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          countRating > 4
              ? Text(
                  '$countRating оценок',
                  style: AppStyle.shortDecr,
                )
              : Text('$countRating оценка', style: AppStyle.shortDecr),
        ],
      ),
    );
  }

  // String ratingCount(int countRating) {   //TODO: finish up
  //   if (countRating == 1) {
  //     return '$countRating оценка';
  //   } else if(countRating >1 && countRating<5){
  //     return '$countRating оценки';
  //   } els
  // }
}
