import 'package:flutter/material.dart';
import 'package:scheduling_app/controllers/collaborator_controller.dart';
import 'package:scheduling_app/controllers/month_table_controller.dart';
import 'package:scheduling_app/controllers/service_controller.dart';
import 'package:scheduling_app/controllers/store_controller.dart';
import 'package:scheduling_app/screens/hour_table/widget/hour_table_card.dart';
import '../../data/hourtable_service.dart';
import '../../models/hourtable.dart';

class HourTableScreen extends StatefulWidget {
  const HourTableScreen(
      {super.key,
      required this.storeController,
      required this.serviceController,
      required this.collaboratorController,
      required this.monthTableController});

  final StoreController storeController;
  final ServiceController serviceController;
  final CollaboratorController collaboratorController;
  final MonthTableController monthTableController;

  @override
  State<HourTableScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HourTableScreen> {
  HourTableService hourTableService = HourTableService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HourTable')),
      body: StreamBuilder<List<HourTable>>(
          stream: hourTableService.getAll(widget.storeController.id,
              widget.collaboratorController.id, widget.monthTableController.id),
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
        id: hourTable.id,
        hour: hourTable.hour,
        available: hourTable.available,
        storeController: widget.storeController,
        serviceController: widget.serviceController,
        collaboratorController: widget.collaboratorController,
        monthTableController: widget.monthTableController,
      );
}
