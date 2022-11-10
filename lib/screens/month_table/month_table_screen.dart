import 'package:flutter/material.dart';
import 'package:scheduling_app/data/monthtable_service.dart';
import 'package:scheduling_app/models/monthtable.dart';
import 'package:scheduling_app/screens/month_table/widget/month_table_card.dart';

class MonthTableScreen extends StatefulWidget {
  const MonthTableScreen(
      {super.key,
      required this.storeId,
      required this.collaboratorId,
      required this.store,
      required this.service,
      required this.collaborator});

  @override
  State<MonthTableScreen> createState() => _MyHomePageState();

  final String storeId;
  final String collaboratorId;

  final String store;
  final String collaborator;
  final String service;
}

class _MyHomePageState extends State<MonthTableScreen> {
  MonthTableService monthTableService = MonthTableService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MonthTable')),
      body: StreamBuilder<List<MonthTable>>(
          stream:
              monthTableService.getAll(widget.storeId, widget.collaboratorId),
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
        index: monthTable.index,
        storeId: widget.storeId,
        collaboratorId: widget.collaboratorId,
        monthTableId: monthTable.id,
        store: widget.store,
        collaborator: widget.collaborator,
        service: widget.service,
      );
}
