class Category {
  Category({
    this.id,
    this.title,
    this.iconUri,
  });

  final int id;
  final String title;
  final String iconUri;

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
