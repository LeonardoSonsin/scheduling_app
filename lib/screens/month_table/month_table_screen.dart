import 'package:flutter/material.dart';
import 'package:scheduling_app/controllers/collaborator_controller.dart';
import 'package:scheduling_app/controllers/service_controller.dart';
import 'package:scheduling_app/controllers/store_controller.dart';
import 'package:scheduling_app/data/monthtable_service.dart';
import 'package:scheduling_app/models/monthtable.dart';
import 'package:scheduling_app/screens/month_table/widget/month_table_card.dart';

class MonthTableScreen extends StatefulWidget {
  const MonthTableScreen({super.key,required this.storeController,required this.collaboratorController,required this.serviceController});

  final StoreController storeController;
  final ServiceController serviceController;
  final CollaboratorController collaboratorController;

  @override
  State<MonthTableScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MonthTableScreen> {
  MonthTableService monthTableService = MonthTableService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MonthTable')),
      body: StreamBuilder<List<MonthTable>>(
          stream: monthTableService.getAll(widget.storeController.id, widget.collaboratorController.id),
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

  Widget buildTimeTableCard(MonthTable monthTable) => MonthTableCard(
        id: monthTable.id,
        index: monthTable.index,
        storeController: widget.storeController,
        collaboratorController: widget.collaboratorController,
        serviceController: widget.serviceController,
      );
}
