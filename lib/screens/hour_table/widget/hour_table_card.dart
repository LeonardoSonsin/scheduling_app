import 'package:flutter/material.dart';
import 'package:scheduling_app/data/hourtable_service.dart';
import 'package:scheduling_app/screens/scheduling_resume/scheduling_resume_screen.dart';

class HourTableCard extends StatelessWidget {
  const HourTableCard(
      {Key? key,
      required this.storeId,
      required this.collaboratorId,
      required this.monthTableId,
      required this.hoursId,
      required this.store,
      required this.collaborator,
      required this.service,
      required this.day,
      required this.hour,
      required this.available})
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
  final bool available;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        child: InkWell(
          onLongPress: () {
            HourTableService().updateAvailable(storeId, collaboratorId, monthTableId, hoursId, true);
          },
          onTap: () {
            available
                ? Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SchedulingResumeScreen(
                        storeId: storeId,
                        collaboratorId: collaboratorId,
                        monthTableId: monthTableId,
                        hoursId: hoursId,
                        store: store,
                        collaborator: collaborator,
                        service: service,
                        day: day,
                        hour: hour,
                      ),
                    ),
                  )
                : null;
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
