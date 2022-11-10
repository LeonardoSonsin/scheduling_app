import 'package:flutter/material.dart';
import 'package:scheduling_app/data/service_service.dart';
import 'package:scheduling_app/models/service.dart';
import 'package:scheduling_app/screens/services/widget/service_card.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key, required this.storeId, required this.store});

  @override
  State<ServicesScreen> createState() => _MyHomePageState();

  final String storeId;
  final String store;
}

class _MyHomePageState extends State<ServicesScreen> {
  ServiceService serviceService = ServiceService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Services')),
      body: StreamBuilder<List<Service>>(
          stream: serviceService.getAll(widget.storeId),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final services = snapshot.data!;
              return ListView(
                children: services.map(buildServiceCard).toList(),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }

  Widget buildServiceCard(Service service) => ServiceCard(
        id: widget.storeId,
        title: service.title,
        description: service.description,
        price: service.price,
        store: widget.store,
        service: service.title,
      );
}
