import 'package:flutter/material.dart';
import '../../controllers/matiere_controller.dart';

class TeachersPage extends StatefulWidget {
  const TeachersPage({super.key});

  @override
  State<TeachersPage> createState() => _TeachersPageState();
}

class _TeachersPageState extends State<TeachersPage> {
  final AdminController controller = AdminController();

  final nameController = TextEditingController();
  final firstnameController = TextEditingController();
  final emailController = TextEditingController();

  Future<void> addTeacher() async {
    await controller.inviteUser(
    email: emailController.text,
    nom: nameController.text,
    prenom: firstnameController.text,
    role: 'teacher',
  );

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Enseignants")),

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
              onPressed: addTeacher,
              child: const Text("Ajouter enseignant"),
            ),
          ],
        ),
      ),
    );
  }
}