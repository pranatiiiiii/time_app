import 'package:flutter/material.dart';

class ProjectTaskManagementScreen extends StatelessWidget {
  const ProjectTaskManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Projects & Tasks')),
      body: Center(child: Text('Project and Task management here')),
    );
  }
}
