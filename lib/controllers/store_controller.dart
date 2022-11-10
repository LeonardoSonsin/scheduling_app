import 'package:get/get.dart';

class StoreController extends GetxController {
  static StoreController get instance => Get.find();

  String id = '';
  String name = '';
  String image = '';
  String phone = '';
  String address = '';

  void buildStoreController(String id, String name, String image, String address, String phone, StoreController storeController)
  {
    storeController.id = id;
    storeController.name = name;
    storeController.image = image;
    storeController.address = address;
    storeController.phone = phone;
  }
}
