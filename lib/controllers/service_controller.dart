import 'package:get/get.dart';

class ServiceController extends GetxController {
  static ServiceController get instance => Get.find();

  String id = '';
  String title = '';
  String description = '';
  int price = 0;

  void buildServiceController(String id, String title, String description, int price, ServiceController serviceController)
  {
    serviceController.id = id;
    serviceController.title = title;
    serviceController.description = description;
    serviceController.price = price;
  }
}
