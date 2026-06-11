import 'package:flutter/material.dart';
import '../../controllers/matiere_controller.dart';

class LinkParentStudent extends StatefulWidget {
  const LinkParentStudent({super.key});

  @override
  State<LinkParentStudent> createState() => _LinkParentStudentState();
}

class _LinkParentStudentState extends State<LinkParentStudent> {
  final controller = AdminController();

  final eleveIdController = TextEditingController();
  final parentIdController = TextEditingController();

  Future<void> link() async {
    await controller.linkParent(
      eleveIdController.text,
      parentIdController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lier Parent - Élève")),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            TextField(
              controller: eleveIdController,
              decoration: const InputDecoration(labelText: "ID Élève"),
            ),

            TextField(
              controller: parentIdController,
              decoration: const InputDecoration(labelText: "ID Parent"),
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: link,
              child: const Text("Lier"),
            ),
          ],
        ),
      ),
    );
  }
}