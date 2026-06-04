import 'package:flutter/material.dart';

class ParentDashboard extends StatelessWidget {
  const ParentDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Parent Dashboard")),

      body: GridView.count(
        padding: const EdgeInsets.all(16),
        crossAxisCount: 2,
        children: [

          _card(context, "Notes enfant", Icons.grade, '/child_notes'),
          _card(context, "Absences", Icons.event_busy, '/child_absences'),
          _card(context, "Messages", Icons.message, '/messages'),
          _card(context, "Annonces", Icons.campaign, '/annonces'),
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