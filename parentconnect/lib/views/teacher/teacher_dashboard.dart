import 'package:flutter/material.dart';

class TeacherDashboard extends StatelessWidget {
  const TeacherDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Teacher Dashboard")),

      body: GridView.count(
        padding: const EdgeInsets.all(16),
        crossAxisCount: 2,
        children: [

          _card(context, "Mes élèves", Icons.school, '/my_students'),
          _card(context, "Ajouter note", Icons.edit, '/add_note'),
          _card(context, "Absences", Icons.event_busy, '/mark_absence'),
          _card(context, "Messages", Icons.message, '/send_message'),
        ],
      ),
    );
  }

  Widget _card(BuildContext context, String title, IconData icon, String route) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, route),
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