import 'package:flutter/material.dart';
import '../../controllers/parent_controller.dart';

class ChildAbsences extends StatefulWidget {
  const ChildAbsences({super.key});

  @override
  State<ChildAbsences> createState() => _ChildAbsencesState();
}

class _ChildAbsencesState extends State<ChildAbsences> {
  final controller = ParentController();
  List absences = [];

  Future<void> load() async {
    absences = await controller.getAbsences("eleve_id");
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Absences")),

      body: ListView.builder(
        itemCount: absences.length,
        itemBuilder: (context, index) {
          final a = absences[index];

          return ListTile(
            leading: const Icon(Icons.warning),
            title: Text(a['date']),
            subtitle: Text(a['motif'] ?? "Aucun motif"),
          );
        },
      ),
    );
  }
}