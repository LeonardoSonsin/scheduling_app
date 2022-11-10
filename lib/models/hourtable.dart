class HourTable {
  String id;
  final String hour;
  final bool available;

  HourTable({this.id = '', required this.hour, required this.available});

  Map<String, dynamic> toJson() => {
    'id': id,
    'hour': hour,
    'available': available,
  };

  static HourTable fromJson(Map<String, dynamic> json, String id) => HourTable(
    id: id,
    hour: json['hour'],
    available: json['available'],
  );
}
