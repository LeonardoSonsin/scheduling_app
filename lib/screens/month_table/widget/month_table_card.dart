import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scheduling_app/controllers/collaborator_controller.dart';
import 'package:scheduling_app/controllers/month_table_controller.dart';
import 'package:scheduling_app/controllers/service_controller.dart';
import 'package:scheduling_app/controllers/store_controller.dart';

import '../../hour_table/hour_table_screen.dart';

class MonthTableCard extends StatelessWidget {
  MonthTableCard({Key? key, required this.id,
    required this.index, required this.storeController, required this.serviceController, required this.collaboratorController,})
      : super(key: key);

  final String id;
  final int index;

  final StoreController storeController;
  final ServiceController serviceController;
  final CollaboratorController collaboratorController;
  final monthTableController = Get.put(MonthTableController());

  final DateTime today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        child: InkWell(
          onTap: () {
            monthTableController.buildCollaboratorController(id, index, monthTableController);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    HourTableScreen(
                        storeController: storeController,
                        collaboratorController: collaboratorController,
                        serviceController: serviceController,
                        monthTableController: monthTableController,
              ),
            ),);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ListTile(
                title: Row(
                  children: [
                    Text(
                      "${DateFormat('dd/MM').format(
                          today.add(Duration(days: index)))} - ${DateFormat(
                          'EEEE').format(today.add(Duration(days: index)))}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      "${DateFormat('dd/MM').format(
                          today.add(Duration(days: index)))} - ${DateFormat(
                          'EEEE').format(today.add(Duration(days: index)))}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
