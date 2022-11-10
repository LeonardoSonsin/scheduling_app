import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scheduling_app/controllers/collaborator_controller.dart';
import 'package:scheduling_app/controllers/hour_table_controller.dart';
import 'package:scheduling_app/controllers/month_table_controller.dart';
import 'package:scheduling_app/controllers/service_controller.dart';
import 'package:scheduling_app/controllers/store_controller.dart';
import 'package:scheduling_app/data/hourtable_service.dart';
import 'package:scheduling_app/data/scheduling_service.dart';
import 'package:scheduling_app/screens/stores/stores_screen.dart';

class SchedulingResumeScreen extends StatelessWidget {
  const SchedulingResumeScreen(
      {Key? key,
      required this.storeController,
      required this.collaboratorController,
      required this.serviceController,
      required this.monthTableController,
      required this.hourTableController})
      : super(key: key);

  final StoreController storeController;
  final ServiceController serviceController;
  final CollaboratorController collaboratorController;
  final MonthTableController monthTableController;
  final HourTableController hourTableController;

  @override
  Widget build(BuildContext context) {
    String day = DateFormat('dd/MM').format(DateTime.now()
        .add(Duration(days: monthTableController.index)));

    return Scaffold(
      appBar: AppBar(title: const Text('Agendamento')),
      body: Column(
        children: [
          storeListTile(),
          resumeListTile(day),
          ElevatedButton(
              onPressed: () {
                SchedulingService()
                    .createScheduling(
                  store: storeController.name,
                  collaborator: collaboratorController.name,
                  service: serviceController.title,
                  day: day,
                  hour: hourTableController.hour,
                )
                    .then((value) {
                  HourTableService().updateAvailable(
                      storeController.id,
                      collaboratorController.id,
                      monthTableController.id,
                      hourTableController.id,
                      false);
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const StoresScreen()),
                      (Route<dynamic> route) => false);
                });
              },
              child: const Text('Confirmar'))
        ],
      ),
    );
  }

  Container resumeListTile(String day) {
    return Container(
      height: 90,
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        child: ListTile(
          isThreeLine: true,
          title: Text(collaboratorController.name,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          subtitle: Text(
              '$day - ${hourTableController.hour} \n${serviceController.title}',
              style: const TextStyle(fontSize: 14)),
        ),
      ),
    );
  }

  Container storeListTile() {
    return Container(
      height: 90,
      margin: const EdgeInsets.all(8.0),
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        child: ListTile(
          isThreeLine: true,
          title: Text(storeController.name,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          subtitle: Text(
              '${storeController.phone} \n${storeController.address}',
              style: const TextStyle(fontSize: 14)),
        ),
      ),
    );
  }
}
