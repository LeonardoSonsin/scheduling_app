import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:scheduling_app/models/scheduling.dart';

class SchedulingService {
  Stream<List<Scheduling>> getAll() => FirebaseFirestore.instance
      .collection('scheduling')
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => Scheduling.fromJson(doc.data(), doc.id))
          .toList());

  Future createScheduling(
      {required String store,
      required String collaborator,
      required String service,
      required String day,
      required String hour}) async {
    final docScheduling =
        FirebaseFirestore.instance.collection('scheduling').doc();
    final scheduling = Scheduling(
        store: store,
        collaborator: collaborator,
        service: service,
        day: day,
        hour: hour);
    final json = scheduling.toJson();
    await docScheduling.set(json);
  }

  Future deleteScheduling(String schedulingId) async {
    final docScheduling = FirebaseFirestore.instance.collection('scheduling').doc(schedulingId);
    await docScheduling.delete();
  }
}
