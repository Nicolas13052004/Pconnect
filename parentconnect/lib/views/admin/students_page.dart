import 'package:flutter/material.dart';
import '../../controllers/matiere_controller.dart';

class StudentsPage extends StatefulWidget {
  const StudentsPage({super.key});

  @override
  State<StudentsPage> createState() => _StudentsPageState();
}

class _StudentsPageState extends State<StudentsPage> {
  final controller = AdminController();

  final nameController = TextEditingController();
  final firstnameController = TextEditingController();
  final emailController = TextEditingController();

  Future<void> addStudent() async {
    await controller.inviteUser(
  email: emailController.text,
  nom: nameController.text,
  prenom: firstnameController.text,
  role: 'eleves',
);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Élèves")),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: "Nom"),
            ),

            TextField(
              controller: firstnameController,
              decoration: const InputDecoration(labelText: "Prenom"),
            ),

            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: "Email"),
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: addStudent,
              child: const Text("Ajouter élève"),
            ),
          ],
        ),
      ),
    );
  }
}