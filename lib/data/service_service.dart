import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:scheduling_app/models/service.dart';

class ServiceService {
  Stream<List<Service>> getAll(String storeId) => FirebaseFirestore.instance
      .collection('stores')
      .doc(storeId)
      .collection('services')
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => Service.fromJson(doc.data(), doc.id))
          .toList());

  Future createService(
      {required String title,
      required String description,
      required int price}) async {
    final docService = FirebaseFirestore.instance.collection('services').doc();
    final service = Service(
        id: docService.id,
        title: title,
        description: description,
        price: price);
    final json = service.toJson();
    await docService.set(json);
  }
}
