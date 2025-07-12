import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_app/screens/add_time_entry_screens.dart';
import 'package:time_app/screens/home_screen.dart';
import 'package:time_app/screens/task_management.dart';
<<<<<<< HEAD
import 'package:providers/time_entry_provider';
=======
import 'provider/time_entry_provider.dart';
>>>>>>> d4939ec27669460e3183e9274df55559628ffd34

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => TimeEntryProvider())],
      child: MyApp(), // ✅ This must match the class name in app.dart
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Time Tracker',
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/add': (context) => AddTimeEntryScreen(),
        '/manage': (context) => ProjectTaskManagementScreen(),
      },
    );
  }
}
