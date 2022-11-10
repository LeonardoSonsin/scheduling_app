import 'package:flutter/material.dart';
import 'package:scheduling_app/controllers/store_controller.dart';
import 'package:scheduling_app/data/service_service.dart';
import 'package:scheduling_app/models/service.dart';
import 'package:scheduling_app/screens/services/widget/service_card.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key, required this.storeController});

  final StoreController storeController;

  @override
  State<ServicesScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ServicesScreen> {
  ServiceService serviceService = ServiceService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Services')),
      body: StreamBuilder<List<Service>>(
          stream: serviceService.getAll(widget.storeController.id),
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
        id: widget.storeController.id,
        title: service.title,
        description: service.description,
        price: service.price,
        storeController: widget.storeController,
      );
}
