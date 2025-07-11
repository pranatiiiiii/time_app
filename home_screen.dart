import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_app/screens/add_time_entry_screens.dart';
import '../providers/time_entry_provider.dart';
import '../models/time_entry.dart';
import 'add_time_entry_screens.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final entries = Provider.of<TimeEntryProvider>(context).entries;

    return Scaffold(
      appBar: AppBar(title: const Text('Time Tracker')),
      body: entries.isEmpty
          ? const Center(child: Text('No time entries yet.'))
          : ListView.builder(
              itemCount: entries.length,
              itemBuilder: (context, index) {
                final entry = entries[index];
                return ListTile(
                  title: Text('Task: ${entry.taskId}'),
                  subtitle: Text(
                    '${entry.startTime} - ${entry.endTime} (${entry.endTime.difference(entry.startTime).inMinutes} min)',
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => AddTimeEntryScreen()),
          );
        },
      ),
    );
  }
}
