import 'package:flutter/material.dart';
import 'package:rsxb/config/styles.dart';

class FilterCategoria extends StatelessWidget {
  FilterCategoria({Key key, this.text, this.url}) : super(key: key);
  final String text, url;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25),
      child: SizedBox(
        height: 76,
        child: Column(
          children: [
            Image.asset(
              url,
              height: 40,
            ),
            Text(
              text,
              style: AppStyle.filter,
            )
          ],
        ),
      ),
    );
  }
}
