import 'package:flutter/material.dart';
import 'screens/project_management.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Time Tracker',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: HomeWithSidebar(),
    );
  }
}

class HomeWithSidebar extends StatefulWidget {
  @override
  State<HomeWithSidebar> createState() => _HomeWithSidebarState();
}

class _HomeWithSidebarState extends State<HomeWithSidebar> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    ProjectTaskManagementScreen(),
    Center(child: Text('Tasks Screen Coming Soon')),
    Center(child: Text('Notes Screen Coming Soon')),
  ];

  final List<String> _titles = ['Projects', 'Tasks', 'Notes'];

  void _onSelectDrawerItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pop(context); // Close drawer
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_titles[_selectedIndex])),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.deepPurple),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: Icon(Icons.folder),
              title: Text('Projects'),
              onTap: () => _onSelectDrawerItem(0),
            ),
            ListTile(
              leading: Icon(Icons.task),
              title: Text('Tasks'),
              onTap: () => _onSelectDrawerItem(1),
            ),
            ListTile(
              leading: Icon(Icons.note),
              title: Text('Notes'),
              onTap: () => _onSelectDrawerItem(2),
            ),
          ],
        ),
      ),
      body: _screens[_selectedIndex],
    );
  }
}
