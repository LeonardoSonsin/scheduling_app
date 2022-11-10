import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduling_app/controllers/service_controller.dart';
import 'package:scheduling_app/controllers/store_controller.dart';

import '../../collaborators/collaborators_screen.dart';

class ServiceCard extends StatelessWidget {
  ServiceCard(
      {Key? key,
      required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.storeController})
      : super(key: key);

  final String id;
  final String title;
  final String description;
  final int price;

  final StoreController storeController;
  final serviceController = Get.put(ServiceController());

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        child: InkWell(
          onTap: () {
            ServiceController().buildServiceController(id, title, description, price, serviceController);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CollaboratorsScreen(
                  storeController: storeController,
                  serviceController: serviceController,
                ),
              ),
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ListTile(
                isThreeLine: description.length > 35 ? true : false,
                title: Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                subtitle: Text(
                  description,
                ),
                trailing: Text('R\$ $price'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
