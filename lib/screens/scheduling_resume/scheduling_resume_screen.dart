import 'package:flutter/material.dart';
import 'package:scheduling_app/data/hourtable_service.dart';
import 'package:scheduling_app/data/scheduling_service.dart';
import 'package:scheduling_app/screens/stores/stores_screen.dart';

class SchedulingResumeScreen extends StatelessWidget {
  const SchedulingResumeScreen(
      {Key? key,
      required this.storeId,
      required this.collaboratorId,
      required this.store,
      required this.collaborator,
      required this.monthTableId,
      required this.hoursId,
      required this.service,
      required this.day,
      required this.hour})
      : super(key: key);

  final String storeId;
  final String collaboratorId;
  final String monthTableId;
  final String hoursId;

  final String store;
  final String collaborator;
  final String service;
  final String day;
  final String hour;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Agendamento')),
      body: Column(
        children: [
          storeListTile(),
          resumeListTile(),
          ElevatedButton(
              onPressed: () {
                SchedulingService()
                    .createScheduling(
                  store: store,
                  collaborator: collaborator,
                  service: service,
                  day: day,
                  hour: hour,
                ).then((value) {
                  HourTableService().updateAvailable(
                      storeId, collaboratorId, monthTableId, hoursId, false);
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

  Container resumeListTile() {
    return Container(
      height: 90,
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        child: ListTile(
          isThreeLine: true,
          title: Text(collaborator,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          subtitle: Text('$day - $hour \n$service',
              style: const TextStyle(fontSize: 14)),
        ),
      ),
    );
  }

  Container storeListTile() {
    return Container(
      height: 105,
      margin: const EdgeInsets.all(8.0),
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        child: ListTile(
          isThreeLine: true,
          title: Text(store,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          subtitle: const Text(
              '(14) 3434-3597 \nRua Amazonas, 55\nCascata - Marília - SP',
              style: TextStyle(fontSize: 14)),
        ),
      ),
    );
  }
}
