import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:scheduling_app/models/monthtable.dart';

class MonthTableService {
  Stream<List<MonthTable>> getAll(String storeId, String collaboratorId) => FirebaseFirestore.instance
        .collection('stores').doc(storeId).collection('collaborators')
        .doc(collaboratorId)
        .collection('monthtable').orderBy('index')
        .snapshots()
        .map((snapshot) => snapshot.docs
        .map((doc) => MonthTable.fromJson(doc.data(), doc.id))
        .toList());
}
