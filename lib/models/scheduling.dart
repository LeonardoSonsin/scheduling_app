class Scheduling {
  String id;
  final String store;
  final String collaborator;
  final String service;
  final String day;
  final String hour;

  Scheduling(
      {this.id = '',
      required this.store,
      required this.collaborator,
      required this.service,
      required this.day,
      required this.hour});

  Map<String, dynamic> toJson() => {
        'id': id,
        'store': store,
        'collaborator': collaborator,
        'service': service,
        'day': day,
        'hour': hour,
      };

  static Scheduling fromJson(Map<String, dynamic> json, String id) =>
      Scheduling(
        id: id,
        store: json['store'],
        collaborator: json['collaborator'],
        service: json['service'],
        day: json['day'],
        hour: json['hour'],
      );
}
