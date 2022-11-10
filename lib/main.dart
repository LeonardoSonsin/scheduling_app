import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:scheduling_app/screens/add_store/add_store_screen.dart';
import 'package:scheduling_app/screens/stores/stores_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Scheduling App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, brightness: Brightness.dark),
      initialRoute: "stores",
      routes: {
        "stores": (context) => const StoresScreen(),
        "add-store": (context) => AddStoreScreen(),
      },
    );
  }
}
