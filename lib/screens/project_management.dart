import 'package:flutter/material.dart';

class ProjectTaskManagementScreen extends StatefulWidget {
  @override
  _ProjectTaskManagementScreenState createState() =>
      _ProjectTaskManagementScreenState();
}

class _ProjectTaskManagementScreenState
    extends State<ProjectTaskManagementScreen> {
  List<Map<String, String>> projects = [];
  List<Map<String, String>> tasks = [];

  void _showAddProjectDialog(BuildContext context) {
    final TextEditingController projectController = TextEditingController();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Add Project'),
        content: TextField(
          controller: projectController,
          decoration: InputDecoration(hintText: 'Project name'),
        ),
        actions: [
          TextButton(
            onPressed: () {
              final name = projectController.text.trim();
              if (name.isNotEmpty) {
                setState(() {
                  projects.add({'name': name});
                });
                Navigator.pop(context);
              }
            },
            child: Text('Add'),
          ),
        ],
      ),
    );
  }

  void _showAddTaskDialog(BuildContext context) {
    final TextEditingController taskController = TextEditingController();
    final TextEditingController noteController = TextEditingController();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Add Task'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: taskController,
              decoration: InputDecoration(hintText: 'Task name'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: noteController,
              decoration: InputDecoration(hintText: 'Notes (optional)'),
              maxLines: 3,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              final task = taskController.text.trim();
              final note = noteController.text.trim();
              if (task.isNotEmpty) {
                setState(() {
                  tasks.add({'task': task, 'note': note});
                });
                Navigator.pop(context);
              }
            },
            child: Text('Add'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Project & Task Manager")),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              title: Text('Add Project'),
              onTap: () {
                Navigator.pop(context);
                _showAddProjectDialog(context);
              },
            ),
            ListTile(
              title: Text('Add Task'),
              onTap: () {
                Navigator.pop(context);
                _showAddTaskDialog(context);
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (projects.isNotEmpty) ...[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Projects",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              ...projects.map(
                (project) => ListTile(
                  title: Text(project['name'] ?? ''),
                  leading: Icon(Icons.folder),
                ),
              ),
            ],
            if (tasks.isNotEmpty) ...[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Tasks",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              ...tasks.map(
                (task) => ListTile(
                  title: Text(task['task'] ?? ''),
                  subtitle: Text(task['note'] ?? ''),
                  leading: Icon(Icons.check_circle_outline),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
