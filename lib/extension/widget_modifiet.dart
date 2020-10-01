import 'package:flutter/material.dart';

extension WidgetModifier on Widget {
  Widget background(Color color) {
    return DecoratedBox(
      decoration: BoxDecoration(color: color),
      child: this,
    );
  }

  Widget boxSize({
    double height,
    double width,
  }) {
    return SizedBox(
      height: height,
      width: width,
    );
  }
}
