import 'package:flutter/material.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Dashboard"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 2,
          children: [

            _menuCard(
              context,
              "Enseignants",
              Icons.school,
              '/teachers',
            ),

            _menuCard(
              context,
              "Parents",
              Icons.family_restroom,
              '/parents',
            ),

            _menuCard(
              context,
              "Élèves",
              Icons.person,
              '/students',
            ),

            _menuCard(
              context,
              "Utilisateurs",
              Icons.list,
              '/users',
            ),
          ],
        ),
      ),
    );
  }

  Widget _menuCard(BuildContext context, String title, IconData icon, String route) {
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