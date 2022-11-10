import 'package:get/get.dart';

class CollaboratorController extends GetxController {
  static CollaboratorController get instance => Get.find();

  String id = '';
  String name = '';
  String image = '';

  void buildCollaboratorController(String id, String name, String image, CollaboratorController collaboratorController)
  {
    collaboratorController.id = id;
    collaboratorController.name = name;
    collaboratorController.image = image;
  }
}
