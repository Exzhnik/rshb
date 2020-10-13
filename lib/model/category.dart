class Category {
  Category({
    this.id,
    this.title,
    this.iconUri,
  });
  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json['id'] as int,
        title: json['title'] as String,
        iconUri: json['iconUri'] == null ? null : json['iconUri'] as String,
      );
  final int id;
  final String title;
  final String iconUri;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        // ignore: prefer_if_null_operators
        'iconUri': iconUri == null ? null : iconUri,
      };
}
