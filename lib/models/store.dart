class Store {
  String id;
  final String name;
  final String image;
  final String phone;
  final String address;

  Store(
      {this.id = '',
      required this.name,
      required this.image,
      required this.phone,
      required this.address});

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
        'phone': phone,
        'address': address,
      };

  static Store fromJson(Map<String, dynamic> json, String id) => Store(
        id: id,
        name: json['name'],
        image: json['image'],
        phone: json['phone'],
        address: json['address'],
      );
}
