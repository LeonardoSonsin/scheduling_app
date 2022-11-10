class Collaborator {
  String id;
  final String name;
  final String image;

  Collaborator({this.id = '', required this.name, required this.image});

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
      };

  static Collaborator fromJson(Map<String, dynamic> json, String id) =>
      Collaborator(
        id: id,
        name: json['name'],
        image: json['image'],
      );
}
