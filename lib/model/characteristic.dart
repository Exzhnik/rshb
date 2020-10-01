class Characteristic {
  Characteristic({
    this.title,
    this.value,
  });

  final String title;
  final String value;

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
