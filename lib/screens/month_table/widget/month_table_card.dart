import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../hour_table/hour_table_screen.dart';

class MonthTableCard extends StatelessWidget {
  MonthTableCard(
      {Key? key,
      required this.storeId,
      required this.collaboratorId,
      required this.monthTableId,
      required this.index,
      required this.store,
      required this.collaborator,
      required this.service})
      : super(key: key);

  final String storeId;
  final String collaboratorId;
  final String monthTableId;
  final int index;

  final String store;
  final String collaborator;
  final String service;

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
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HourTableScreen(
                  storeId: storeId,
                  collaboratorId: collaboratorId,
                  monthTableId: monthTableId,
                  store: store,
                  collaborator: collaborator,
                  service: service,
                  day: DateFormat('dd/MM').format(today.add(Duration(days: index))),
                ),
              ),
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ListTile(
                title: Row(
                  children: [
                    Text(
                      "${DateFormat('dd/MM').format(today.add(Duration(days: index)))} - ${DateFormat('EEEE').format(today.add(Duration(days: index)))}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      "${DateFormat('dd/MM').format(today.add(Duration(days: index)))} - ${DateFormat('EEEE').format(today.add(Duration(days: index)))}",
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
