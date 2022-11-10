import 'package:flutter/material.dart';
import 'package:scheduling_app/screens/scheduling/scheduling_screen.dart';
import 'package:scheduling_app/screens/stores/widgets/store_card.dart';

import '../../models/store.dart';
import '../../data/store_service.dart';

class StoresScreen extends StatefulWidget {
  const StoresScreen({super.key});

  @override
  State<StoresScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<StoresScreen> {
  StoreService storeService = StoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stores')),
      drawer: Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                child: Text('T', style: TextStyle(fontSize: 30.0)),
              ),
              accountName: Text('Teste'),
              accountEmail: Text('teste@teste.com'),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (builder) => const SchedulingScreen()));
              },
              title: const Text('Agendamentos'),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pop();
              },
              title: const Text('Leave'),
            )
          ],
        ),
      ),
      body: StreamBuilder<List<Store>>(
          stream: storeService.getAll(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final stores = snapshot.data!;
              return ListView(
                children: stores.map(buildStoreCard).toList(),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'add-store');
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget buildStoreCard(Store store) => StoreCard(
      id: store.id,
      image: store.image,
      name: store.name,
      phone: store.phone,
      address: store.address);
}
