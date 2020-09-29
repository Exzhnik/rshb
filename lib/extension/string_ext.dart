import 'package:intl/intl.dart';

extension StringExt on String {
  String trimMargin() => split('\n').map((e) => e.trimLeft()).join('\n');
}

extension IntSpacePrice on int {
  String priceSpace() {
    var numberFormat = NumberFormat();

    return numberFormat
        .format(this)
        .replaceAll(numberFormat.symbols.GROUP_SEP, ' ');
  }
}

extension StringExtensionRuble on String {
  String unicodeRuble() {
    return '$this \u20BD';
  }
}

extension DoubleParse on double {
  String parseDouble() {
    var numberFormat = NumberFormat();
    return numberFormat
        .format(this)
        .replaceAll(numberFormat.symbols.GROUP_SEP, ' ');
  }
}

extension FloorParse on String {
  String parseFloor() {
    return double.parse(this).floor().toString();
  }
}

extension ParseNumbers on String {
  int parseInt() {
    return int.parse(this);
  }
}

void extImport() {}
