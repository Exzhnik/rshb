import 'package:flutter/material.dart';
import 'package:rsxb/config/colors.dart';

class ColorRating {
  Color colorRating(int value) {
    if (value >= 4) {
      return AppColors.green;
    } else if (value < 4 && value > 3) {
      return AppColors.yelColor;
    } else
      return AppColors.greyBlack;
  }
}
