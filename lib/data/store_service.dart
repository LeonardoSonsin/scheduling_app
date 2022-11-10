import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:scheduling_app/models/store.dart';

class StoreService {
  Stream<List<Store>> getAll() => FirebaseFirestore.instance
      .collection('stores')
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => Store.fromJson(doc.data(), doc.id))
          .toList());

  Future createStore({required String name, required String image, required String phone, required String address}) async {
    final docStore = FirebaseFirestore.instance.collection('users').doc();
    final store = Store(id: docStore.id, name: name, image: image, phone: phone, address: address);
    final json = store.toJson();
    await docStore.set(json);
  }
}
