import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rshb/config/colors.dart';
import 'package:rshb/config/styles.dart';

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
              color: AppColors.greenLike,
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

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(IntProperty('rating', rating))
      ..add(IntProperty('countRating', countRating));
  }
}
