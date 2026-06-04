import 'package:flutter/material.dart';
import '../../controllers/parent_controller.dart';

class MyNotes extends StatefulWidget {
  const MyNotes({super.key});

  @override
  State<MyNotes> createState() => _MyNotesState();
}

class _MyNotesState extends State<MyNotes> {
  final controller = ParentController(); // réutilise parent_controller
  List notes = [];

  Future<void> loadNotes() async {
    notes = await controller.getNotes("eleve_id"); // à remplacer dynamiquement
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    loadNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Mes notes")),

      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          final n = notes[index];

          return Card(
            child: ListTile(
              leading: const Icon(Icons.grade),
              title: Text("Note: ${n['note']}"),
              subtitle: Text("Matière: ${n['matiere_id']}"),
            ),
          );
        },
      ),
    );
  }
}