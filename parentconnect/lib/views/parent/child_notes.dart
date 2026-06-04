import 'package:flutter/material.dart';
import '../../controllers/parent_controller.dart';

class ChildNotes extends StatefulWidget {
  const ChildNotes({super.key});

  @override
  State<ChildNotes> createState() => _ChildNotesState();
}

class _ChildNotesState extends State<ChildNotes> {
  final controller = ParentController();
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
      appBar: AppBar(title: const Text("Notes de l'enfant")),

      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          final n = notes[index];

          return Card(
            child: ListTile(
              title: Text("Note: ${n['note']}"),
              subtitle: Text("Matière: ${n['matiere_id']}"),
            ),
          );
        },
      ),
    );
  }
}