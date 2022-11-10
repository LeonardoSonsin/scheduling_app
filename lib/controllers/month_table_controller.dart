import 'package:get/get.dart';

class MonthTableController extends GetxController {
  static MonthTableController get instance => Get.find();

  String id = '';
  int index = 0;

  void buildCollaboratorController(String id, int index, MonthTableController monthTableController) {
    monthTableController.id = id;
    monthTableController.index = index;
  }
}
