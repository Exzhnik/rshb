import 'package:rshb/model/fermer.dart';
import 'package:rshb/model/product.dart';

import 'category.dart';

class ListFood {
  ListFood({
    this.sections,
    this.categories,
    this.products,
    this.farmers,
    this.tours,
  });

  final List<Farmer> sections;
  final List<Category> categories;
  List<Product> products;
  final List<Farmer> farmers;
  final List<dynamic> tours;

  // ignore: sort_constructors_first
  factory ListFood.fromJson(Map<String, dynamic> json) => ListFood(
        sections: List<Farmer>.from(json['sections']
                .map((x) => Farmer.fromJson(x as Map<String, dynamic>))
            as Iterable),
        categories: List<Category>.from(json['categories']
                .map((x) => Category.fromJson(x as Map<String, dynamic>))
            as Iterable),
        products: List<Product>.from(json['products']
                .map((x) => Product.fromJson(x as Map<String, dynamic>))
            as Iterable),
        farmers: List<Farmer>.from(json['farmers']
                .map((x) => Farmer.fromJson(x as Map<String, dynamic>))
            as Iterable),
        tours: List<dynamic>.from(json['tours'].map((x) => x) as Iterable),
      );

  Map<String, dynamic> toJson() => {
        'sections': List<dynamic>.from(sections.map((x) => x.toJson())),
        'categories': List<dynamic>.from(categories.map((x) => x.toJson())),
        'products': List<dynamic>.from(products.map((x) => x.toJson())),
        'farmers': List<dynamic>.from(farmers.map((x) => x.toJson())),
        'tours': List<dynamic>.from(tours.map((x) => x)),
      };
}
