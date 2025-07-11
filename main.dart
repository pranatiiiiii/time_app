import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_app/screens/add_time_entry_screens.dart';
import 'package:time_app/screens/home_screen.dart';
import 'package:time_app/screens/task_management.dart';
import 'providers/time_entry_provider.dart';
import 'app.dart'; // ✅ no longer needs full package path

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => TimeEntryProvider())],
      child: MyApp(), // ✅ This must match the class name in app.dart
    ),
  );
}

class MyApp extends StatelessWidget {
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
