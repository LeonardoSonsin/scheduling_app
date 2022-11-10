class Service {
  String id;
  final String title;
  final String description;
  final int price;

  Service(
      {this.id = '',
      required this.title,
      required this.description,
      required this.price});

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'price': price,
      };

  static Service fromJson(Map<String, dynamic> json, String id) => Service(
      id: id,
      title: json['title'],
      description: json['description'],
      price: json['price']);
}
