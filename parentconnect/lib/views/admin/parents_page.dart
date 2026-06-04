import 'package:flutter/material.dart';
import '../../controllers/admin_controller.dart';

class ParentsPage extends StatefulWidget {
  const ParentsPage({super.key});

  @override
  State<ParentsPage> createState() => _ParentsPageState();
}

class _ParentsPageState extends State<ParentsPage> {
  final controller = AdminController();

  final nameController = TextEditingController();
  final firstnameController = TextEditingController();
  final emailController = TextEditingController();

  Future<void> addParent() async {
   await controller.inviteUser(
    email: emailController.text,
    nom: nameController.text,
    prenom: firstnameController.text,
    role: 'parent',
  );

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Parents")),

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
              onPressed: addParent,
              child: const Text("Ajouter parent"),
            ),
          ],
        ),
      ),
    );
  }
}