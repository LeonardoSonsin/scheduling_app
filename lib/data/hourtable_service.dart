import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:scheduling_app/models/hourtable.dart';

class HourTableService {
  Stream<List<HourTable>> getAll(
          String storeId, String collaboratorId, String monthTableId) =>
      FirebaseFirestore.instance
          .collection('stores')
          .doc(storeId)
          .collection('collaborators')
          .doc(collaboratorId)
          .collection('monthtable')
          .doc(monthTableId)
          .collection('hours')
          .snapshots()
          .map((snapshot) => snapshot.docs
              .map((doc) => HourTable.fromJson(doc.data(), doc.id))
              .toList());

  void updateAvailable(String storeId, String collaboratorId, String monthTableId, String hoursId, bool available) {
    FirebaseFirestore.instance
        .collection('stores')
        .doc(storeId)
        .collection('collaborators')
        .doc(collaboratorId)
        .collection('monthtable')
        .doc(monthTableId)
        .collection('hours')
        .doc(hoursId)
        .update({'available': available});
  }
}
