import 'package:flutter/material.dart';
import '../../controllers/teacher_controller.dart';

class MarkAbsence extends StatefulWidget {
  const MarkAbsence({super.key});

  @override
  State<MarkAbsence> createState() => _MarkAbsenceState();
}

class _MarkAbsenceState extends State<MarkAbsence> {
  final controller = TeacherController();

  final eleveId = TextEditingController();
  final motif = TextEditingController();

  Future<void> saveAbsence() async {
    await controller.addAbsence(
      eleveId: eleveId.text,
      enseignantId: "teacher_id",
      date: DateTime.now().toIso8601String(),
      motif: motif.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Absences")),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            TextField(
              controller: eleveId,
              decoration: const InputDecoration(labelText: "ID Élève"),
            ),

            TextField(
              controller: motif,
              decoration: const InputDecoration(labelText: "Motif"),
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: saveAbsence,
              child: const Text("Marquer absent"),
            ),
          ],
        ),
      ),
    );
  }
}