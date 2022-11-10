import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduling_app/controllers/collaborator_controller.dart';
import 'package:scheduling_app/controllers/hour_table_controller.dart';
import 'package:scheduling_app/controllers/month_table_controller.dart';
import 'package:scheduling_app/controllers/service_controller.dart';
import 'package:scheduling_app/controllers/store_controller.dart';
import 'package:scheduling_app/data/hourtable_service.dart';
import 'package:scheduling_app/screens/scheduling_resume/scheduling_resume_screen.dart';

class HourTableCard extends StatelessWidget {
  HourTableCard(
      {Key? key,
      required this.id,
      required this.hour,
      required this.available,
      required this.storeController,
      required this.serviceController,
      required this.collaboratorController,
      required this.monthTableController})
      : super(key: key);

  final String id;
  final String hour;
  final bool available;

  final StoreController storeController;
  final ServiceController serviceController;
  final CollaboratorController collaboratorController;
  final MonthTableController monthTableController;

  final hourTableController = Get.put(HourTableController());

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        child: InkWell(
          onLongPress: () {
            HourTableService().updateAvailable(storeController.id,
                collaboratorController.id, monthTableController.id, id, true);
          },
          onTap: () {
            if (available) {
              hourTableController.buildHourTableController(
                  id, hour, available, hourTableController);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SchedulingResumeScreen(
                    storeController: storeController,
                    serviceController: serviceController,
                    collaboratorController: collaboratorController,
                    monthTableController: monthTableController,
                    hourTableController: hourTableController,
                  ),
                ),
              );
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ListTile(
                title: Text(
                  hour,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: available ? Colors.white : Colors.red),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
