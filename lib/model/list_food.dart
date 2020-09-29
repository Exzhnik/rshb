class ListFood {
  ListFood({
    this.sections,
    this.categories,
    this.products,
    this.farmers,
    this.tours,
  });

  List<Farmer> sections;
  List<Category> categories;
  List<Product> products;
  List<Farmer> farmers;
  List<dynamic> tours;

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

class Category {
  Category({
    this.id,
    this.title,
    this.iconUri,
  });

  int id;
  String title;
  String iconUri;

  // ignore: sort_constructors_first
  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json['id'] as int,
        title: json['title'] as String,
        iconUri: json['iconUri'] == null ? null : json['iconUri'] as String,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        // ignore: prefer_if_null_operators
        'iconUri': iconUri == null ? null : iconUri,
      };
}

class Farmer {
  Farmer({
    this.id,
    this.title,
  });

  int id;
  String title;

  // ignore: sort_constructors_first
  factory Farmer.fromJson(Map<String, dynamic> json) => Farmer(
        id: json['id'] as int,
        title: json['title'] as String,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
      };
}

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

  int id;
  int categoryId;
  int farmerId;
  String title;
  String unit;
  double totalRating;
  int ratingCount;
  String image;
  String shortDescription;
  String description;
  double price;
  bool favorite;
  List<Characteristic> characteristics;

  // ignore: sort_constructors_first
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

class Characteristic {
  Characteristic({
    this.title,
    this.value,
  });

  String title;
  String value;

  // ignore: sort_constructors_first
  factory Characteristic.fromJson(Map<String, dynamic> json) => Characteristic(
        title: json['title'] as String,
        value: json['value'] as String,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'value': value,
      };
}
