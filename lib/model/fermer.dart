class Farmer {
  Farmer({
    this.id,
    this.title,
  });
  factory Farmer.fromJson(Map<String, dynamic> json) => Farmer(
        id: json['id'] as int,
        title: json['title'] as String,
      );

  final int id;
  final String title;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
      };
}
