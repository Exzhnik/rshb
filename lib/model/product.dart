import 'characteristic.dart';

class Product {
  Product({
    this.id,
    this.categoryId,
    this.farmerId,
    this.title,
    this.unit,
    this.totalRating,
    this.ratingCount,
    this.image,
    this.shortDescription,
    this.description,
    this.price,
    this.favorite,
    this.characteristics,
  });
  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'] as int,
        categoryId: json['categoryId'] as int,
        farmerId: json['farmerId'] as int,
        title: json['title'] as String,
        unit: json['unit'] as String,
        totalRating: json['totalRating'].toDouble() as double,
        ratingCount: json['ratingCount'] as int,
        image: json['image'] as String,
        shortDescription: json['shortDescription'] as String,
        description: json['description'] as String,
        price: json['price'] as double,
        favorite: json['favorite'] as bool,
        characteristics: List<Characteristic>.from(json['characteristics']
                .map((x) => Characteristic.fromJson(x as Map<String, dynamic>))
            as Iterable),
      );
  final int id;
  final int categoryId;
  final int farmerId;
  final String title;
  final String unit;
  final double totalRating;
  final int ratingCount;
  final String image;
  final String shortDescription;
  final String description;
  final double price;
  final bool favorite;
  final List<Characteristic> characteristics;

  Map<String, dynamic> toJson() => {
        'id': id,
        'categoryId': categoryId,
        'farmerId': farmerId,
        'title': title,
        'unit': unit,
        'totalRating': totalRating,
        'ratingCount': ratingCount,
        'image': image,
        'shortDescription': shortDescription,
        'description': description,
        'price': price,
        'favorite': favorite,
        'characteristics':
            List<dynamic>.from(characteristics.map((x) => x.toJson())),
      };
}
