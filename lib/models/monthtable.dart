class MonthTable {
  String id;
  final int index;

  MonthTable({this.id = '', required this.index});

  Map<String, dynamic> toJson() => {
        'id': id,
        'index': index,
      };

  static MonthTable fromJson(Map<String, dynamic> json, String id) => MonthTable(
        id: id,
        index: json['index'],
      );
}
