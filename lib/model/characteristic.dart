class Characteristic {
  Characteristic({
    this.title,
    this.value,
  });
  factory Characteristic.fromJson(Map<String, dynamic> json) => Characteristic(
        title: json['title'] as String,
        value: json['value'] as String,
      );

  final String title;
  final String value;

  Map<String, dynamic> toJson() => {
        'title': title,
        'value': value,
      };
}
