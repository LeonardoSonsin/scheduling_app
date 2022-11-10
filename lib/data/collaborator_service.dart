import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:scheduling_app/models/collaborator.dart';

class CollaboratorService {
  Stream<List<Collaborator>> getAll(String storeId) => FirebaseFirestore.instance
      .collection('stores').doc(storeId).collection('collaborators')
      .snapshots()
      .map((snapshot) => snapshot.docs
      .map((doc) => Collaborator.fromJson(doc.data(), doc.id))
      .toList());

  Future createCollaborator({required String name, required String image}) async {
    final docStore = FirebaseFirestore.instance.collection('collaborators').doc();
    final store = Collaborator(id: docStore.id, name: name, image: image);
    final json = store.toJson();
    await docStore.set(json);
  }
}
