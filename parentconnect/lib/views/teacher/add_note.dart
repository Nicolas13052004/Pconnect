import 'package:flutter/material.dart';
import '../../controllers/teacher_controller.dart';

class AddNote extends StatefulWidget {
  const AddNote({super.key});

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  final controller = TeacherController();

  final eleveId = TextEditingController();
  final matiereId = TextEditingController();
  final note = TextEditingController();

  Future<void> saveNote() async {
    await controller.addNote(
      eleveId: eleveId.text,
      matiereId: matiereId.text,
      enseignantId: "teacher_id",
      note: double.parse(note.text),
      coefficient: 1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ajouter Note")),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            TextField(
              controller: eleveId,
              decoration: const InputDecoration(labelText: "ID Élève"),
            ),

            TextField(
              controller: matiereId,
              decoration: const InputDecoration(labelText: "ID Matière"),
            ),

            TextField(
              controller: note,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Note"),
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: saveNote,
              child: const Text("Enregistrer"),
            ),
          ],
        ),
      ),
    );
  }
}