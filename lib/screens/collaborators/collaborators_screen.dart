import 'package:flutter/material.dart';
import 'package:scheduling_app/data/collaborator_service.dart';
import 'package:scheduling_app/models/collaborator.dart';
import 'package:scheduling_app/screens/collaborators/widget/collaborator_card.dart';

class CollaboratorsScreen extends StatefulWidget {
  const CollaboratorsScreen(
      {super.key,
      required this.storeId,
      required this.service,
      required this.store});

  @override
  State<CollaboratorsScreen> createState() => _MyHomePageState();

  final String storeId;
  final String store;
  final String service;
}

class _MyHomePageState extends State<CollaboratorsScreen> {
  CollaboratorService collaboratorService = CollaboratorService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Collaborators')),
      body: StreamBuilder<List<Collaborator>>(
          stream: collaboratorService.getAll(widget.storeId),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final collaborators = snapshot.data!;
              return ListView(
                children: collaborators.map(buildCollaboratorCard).toList(),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }

  Widget buildCollaboratorCard(Collaborator collaborator) => CollaboratorCard(
        id: collaborator.id,
        image: collaborator.image,
        name: collaborator.name,
        storeId: widget.storeId,
        store: widget.store,
        collaborator: collaborator.name,
        service: widget.service,
      );
}
