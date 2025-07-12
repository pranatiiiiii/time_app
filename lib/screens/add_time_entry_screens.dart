import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
<<<<<<< HEAD
import '../providers/time_entry_provider.dart';
=======
import '../provider/time_entry_provider.dart';
>>>>>>> d4939ec27669460e3183e9274df55559628ffd34
import '../models/time_entry.dart';

class AddTimeEntryScreen extends StatefulWidget {
  const AddTimeEntryScreen({super.key});

  @override
  State<AddTimeEntryScreen> createState() => _AddTimeEntryScreenState();
}

class _AddTimeEntryScreenState extends State<AddTimeEntryScreen> {
  final _formKey = GlobalKey<FormState>();
  final _taskIdController = TextEditingController();
  DateTime? _startTime;
  DateTime? _endTime;

  void _submit() {
    if (_formKey.currentState!.validate() &&
        _startTime != null &&
        _endTime != null) {
      final newEntry = TimeEntry(
        id: const Uuid().v4(),
        taskId: _taskIdController.text,
        startTime: _startTime!,
        endTime: _endTime!,
      );

      Provider.of<TimeEntryProvider>(context, listen: false).addEntry(newEntry);
      Navigator.pop(context);
    }
  }

  Future<void> _pickTime(bool isStart) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      final now = DateTime.now();
      final time = DateTime(
        now.year,
        now.month,
        now.day,
        picked.hour,
        picked.minute,
      );
      setState(() {
        if (isStart) {
          _startTime = time;
        } else {
          _endTime = time;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Time Entry')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _taskIdController,
                decoration: const InputDecoration(labelText: 'Task ID'),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter task ID' : null,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  TextButton(
                    onPressed: () => _pickTime(true),
                    child: Text(
                      _startTime == null
                          ? 'Pick Start Time'
                          : 'Start: ${_startTime!.hour}:${_startTime!.minute}',
                    ),
                  ),
                  const SizedBox(width: 16),
                  TextButton(
                    onPressed: () => _pickTime(false),
                    child: Text(
                      _endTime == null
                          ? 'Pick End Time'
                          : 'End: ${_endTime!.hour}:${_endTime!.minute}',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submit,
                child: const Text('Add Entry'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
