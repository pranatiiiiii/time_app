import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/time_entry_provider.dart';
import '../models/time_entry.dart';
import 'add_time_entry_screens.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final entries = Provider.of<TimeEntryProvider>(context).entries;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Time Tracker'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            // Header
            Container(
              width: double.infinity,
              height: 120,
              decoration: const BoxDecoration(
                color: Color(0xFF4DB6AC), // Teal color matching your image
              ),
              child: const Center(
                child: Text(
                  'Menu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            // Menu Items
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  ListTile(
                    leading: const Icon(
                      Icons.folder,
                      color: Colors.black87,
                      size: 28,
                    ),
                    title: const Text(
                      'Projects',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/manage');
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.assignment,
                      color: Colors.black87,
                      size: 28,
                    ),
                    title: const Text(
                      'Tasks',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/manage');
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.access_time,
                      color: Colors.black87,
                      size: 28,
                    ),
                    title: const Text(
                      'Time Entries',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      // Already on home screen
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.bar_chart,
                      color: Colors.black87,
                      size: 28,
                    ),
                    title: const Text(
                      'Reports',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      // TODO: Navigate to reports screen
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Reports coming soon!')),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: entries.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.access_time,
                    size: 64,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'No time entries yet.',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Tap the + button to add your first entry',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: entries.length,
              itemBuilder: (context, index) {
                final entry = entries[index];
                final duration = entry.endTime.difference(entry.startTime);
                final hours = duration.inHours;
                final minutes = duration.inMinutes % 60;
                
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.teal.shade100,
                      child: Icon(
                        Icons.work,
                        color: Colors.teal.shade700,
                      ),
                    ),
                    title: Text(
                      'Task: ${entry.taskId}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${TimeOfDay.fromDateTime(entry.startTime).format(context)} - ${TimeOfDay.fromDateTime(entry.endTime).format(context)}',
                        ),
                        Text(
                          'Duration: ${hours}h ${minutes}m',
                          style: TextStyle(
                            color: Colors.teal.shade700,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        Provider.of<TimeEntryProvider>(context, listen: false)
                            .removeEntry(entry.id);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Entry deleted')),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        child: const Icon(Icons.add, color: Colors.white),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddTimeEntryScreen()),
          );
        },
      ),
    );
  }
}