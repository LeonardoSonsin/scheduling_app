import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduling_app/controllers/collaborator_controller.dart';
import 'package:scheduling_app/controllers/service_controller.dart';
import 'package:scheduling_app/controllers/store_controller.dart';

import '../../month_table/month_table_screen.dart';

class CollaboratorCard extends StatelessWidget {
  CollaboratorCard(
      {Key? key,
      required this.image,
      required this.name,
      required this.id,
      required this.storeController,
      required this.serviceController})
      : super(key: key);

  final String id;
  final String image;
  final String name;

  final StoreController storeController;
  final ServiceController serviceController;
  final collaboratorController = Get.put(CollaboratorController());

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        child: InkWell(
          onTap: () {
            collaboratorController.buildCollaboratorController(id, name, image, collaboratorController);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MonthTableScreen(
                  storeController: storeController,
                  serviceController: serviceController,
                  collaboratorController: collaboratorController,
                ),
              ),
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(image),
                  backgroundColor: Colors.white,
                ),
                title: Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
