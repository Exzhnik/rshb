class Farmer {
  Farmer({
    this.id,
    this.title,
  });

  final int id;
  final String title;

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
