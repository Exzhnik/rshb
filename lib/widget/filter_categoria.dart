import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rshb/resource/styles.dart';

class FilterCategoria extends StatelessWidget {
  FilterCategoria({Key key, this.text, this.url}) : super(key: key);
  final String text, url;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 25),
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
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty('text', text))
      ..add(StringProperty('url', url));
  }
}
