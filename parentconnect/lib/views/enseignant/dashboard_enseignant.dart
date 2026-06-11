import 'package:flutter/material.dart';
import 'eleves_page.dart';
import 'notes_page.dart';
import 'absences_page.dart';
import 'messages_page.dart';

class DashboardEnseignant extends StatelessWidget {
  const DashboardEnseignant({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard Enseignant"),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16),
        children: [

          _menuItem(context, "Élèves", Icons.school, const ElevesPage()),
          _menuItem(context, "Notes", Icons.grade, const NotesPage()),
          _menuItem(context, "Absences", Icons.event_busy, const AbsencesPage()),
          _menuItem(context, "Messages", Icons.message, const MessagesPage()),
        ],
      ),
    );
  }

  Widget _menuItem(BuildContext context, String title, IconData icon, Widget page) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => page),
      ),
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40),
            const SizedBox(height: 10),
            Text(title),
          ],
        ),
      ),
    );
  }
}