import 'package:flutter/material.dart';
import 'package:scheduling_app/screens/hour_table/widget/hour_table_card.dart';
import '../../data/hourtable_service.dart';
import '../../models/hourtable.dart';

class HourTableScreen extends StatefulWidget {
  const HourTableScreen(
      {super.key,
      required this.storeId,
      required this.collaboratorId,
      required this.monthTableId,
      required this.store,
      required this.collaborator,
      required this.service,
      required this.day});

  @override
  State<HourTableScreen> createState() => _MyHomePageState();

  final String storeId;
  final String collaboratorId;
  final String monthTableId;

  final String store;
  final String collaborator;
  final String service;
  final String day;
}

class _MyHomePageState extends State<HourTableScreen> {
  HourTableService hourTableService = HourTableService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HourTable')),
      body: StreamBuilder<List<HourTable>>(
          stream: hourTableService.getAll(
              widget.storeId, widget.collaboratorId, widget.monthTableId),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final hours = snapshot.data!;
              return ListView(
                children: hours.map(buildTimeTableCard).toList(),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }

  Widget buildTimeTableCard(HourTable hourTable) => HourTableCard(
        store: widget.store,
        collaborator: widget.collaborator,
        service: widget.service,
        day: widget.day,
        hour: hourTable.hour,
        available: hourTable.available,
        storeId: widget.storeId,
        collaboratorId: widget.collaboratorId,
        monthTableId: widget.monthTableId,
        hoursId: hourTable.id,
      );
}
