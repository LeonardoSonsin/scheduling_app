import 'package:get/get.dart';

class HourTableController extends GetxController {
  static HourTableController get instance => Get.find();

  String id = '';
  String hour = '';
  bool available = true;

  void buildHourTableController(String id, String hour, bool available,
      HourTableController hourTableController) {
    hourTableController.id = id;
    hourTableController.hour = hour;
    hourTableController.available = available;
  }
}
