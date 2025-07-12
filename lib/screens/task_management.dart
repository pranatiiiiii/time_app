import 'package:flutter/material.dart';

class ProjectTaskManagementScreen extends StatefulWidget {
  const ProjectTaskManagementScreen({super.key});

  @override
  State<ProjectTaskManagementScreen> createState() =>
      _ProjectTaskManagementScreenState();
}

class _ProjectTaskManagementScreenState
    extends State<ProjectTaskManagementScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Projects & Tasks'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          tabs: const [
            Tab(icon: Icon(Icons.folder), text: 'Projects'),
            Tab(icon: Icon(Icons.assignment), text: 'Tasks'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [_buildProjectsTab(), _buildTasksTab()],
      ),
    );
  }

  Widget _buildProjectsTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blue.shade100,
                child: Icon(Icons.work, color: Colors.blue.shade700),
              ),
              title: const Text('Website Redesign'),
              subtitle: const Text('Main company website project'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // TODO: Navigate to project details
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.green.shade100,
                child: Icon(
                  Icons.mobile_friendly,
                  color: Colors.green.shade700,
                ),
              ),
              title: const Text('Mobile App'),
              subtitle: const Text('Flutter time tracking app'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // TODO: Navigate to project details
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.orange.shade100,
                child: Icon(Icons.bug_report, color: Colors.orange.shade700),
              ),
              title: const Text('Bug Fixes'),
              subtitle: const Text('General bug fixing tasks'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // TODO: Navigate to project details
              },
            ),
          ),
          const Spacer(),
          ElevatedButton.icon(
            onPressed: () {
              // TODO: Add new project
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Add Project feature coming soon!'),
                ),
              );
            },
            icon: const Icon(Icons.add),
            label: const Text('Add Project'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 48),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTasksTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.purple.shade100,
                child: Icon(Icons.code, color: Colors.purple.shade700),
              ),
              title: const Text('Frontend Development'),
              subtitle: const Text('Website Redesign • 2h 30m logged'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // TODO: Navigate to task details
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.indigo.shade100,
                child: Icon(
                  Icons.design_services,
                  color: Colors.indigo.shade700,
                ),
              ),
              title: const Text('UI Design'),
              subtitle: const Text('Mobile App • 1h 15m logged'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // TODO: Navigate to task details
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.red.shade100,
                child: Icon(Icons.build, color: Colors.red.shade700),
              ),
              title: const Text('Login Bug Fix'),
              subtitle: const Text('Bug Fixes • 45m logged'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // TODO: Navigate to task details
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.cyan.shade100,
                child: Icon(Icons.meeting_room, color: Colors.cyan.shade700),
              ),
              title: const Text('Team Meeting'),
              subtitle: const Text('General • 1h logged'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // TODO: Navigate to task details
              },
            ),
          ),
          const Spacer(),
          ElevatedButton.icon(
            onPressed: () {
              // TODO: Add new task
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Add Task feature coming soon!')),
              );
            },
            icon: const Icon(Icons.add),
            label: const Text('Add Task'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 48),
            ),
          ),
        ],
      ),
    );
  }
}
