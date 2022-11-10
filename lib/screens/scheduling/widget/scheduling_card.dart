import 'package:flutter/material.dart';
import 'package:scheduling_app/utils/dialog_delete_scheduling.dart';

class SchedulingCard extends StatelessWidget {
  const SchedulingCard(
      {Key? key,
      required this.store,
      required this.collaborator,
      required this.service,
      required this.day,
      required this.hour,
      required this.schedulingId})
      : super(key: key);

  final String store;
  final String collaborator;
  final String service;
  final String day;
  final String hour;

  final String schedulingId;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () {
        dialogDeleteScheduling(context, schedulingId);
      },
      child: Card(
        child: Column(
          children: [
            Card(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
              child: ListTile(
                isThreeLine: true,
                title: Text(store,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18)),
                subtitle: const Text(
                    '(14) 3434-3597 \nRua Amazonas, 55\nCascata - Marília - SP',
                    style: TextStyle(fontSize: 14)),
              ),
            ),
            Card(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
              child: ListTile(
                isThreeLine: true,
                title: Text(collaborator,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18)),
                subtitle: Text('$day - $hour \n$service',
                    style: const TextStyle(fontSize: 14)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
