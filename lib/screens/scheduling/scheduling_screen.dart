import 'package:flutter/material.dart';
import 'package:scheduling_app/data/scheduling_service.dart';
import 'package:scheduling_app/models/scheduling.dart';
import 'package:scheduling_app/screens/scheduling/widget/scheduling_card.dart';

class SchedulingScreen extends StatefulWidget {
  const SchedulingScreen({super.key});

  @override
  State<SchedulingScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<SchedulingScreen> {
  SchedulingService schedulingService = SchedulingService();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Agendamentos')),
      body: StreamBuilder<List<Scheduling>>(
          stream: schedulingService.getAll(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final scheduling = snapshot.data!;
              return ListView(
                children: scheduling.map(buildSchedulingCard).toList(),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }

  Widget buildSchedulingCard(Scheduling scheduling) => SchedulingCard(
        store: scheduling.store,
        collaborator: scheduling.collaborator,
        service: scheduling.service,
        day: scheduling.day,
        hour: scheduling.hour,
        schedulingId: scheduling.id,
      );
}
