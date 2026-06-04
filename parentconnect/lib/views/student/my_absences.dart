import 'package:flutter/material.dart';
import '../../controllers/parent_controller.dart';

class MyAbsences extends StatefulWidget {
  const MyAbsences({super.key});

  @override
  State<MyAbsences> createState() => _MyAbsencesState();
}

class _MyAbsencesState extends State<MyAbsences> {
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
      appBar: AppBar(title: const Text("Mes absences")),

      body: ListView.builder(
        itemCount: absences.length,
        itemBuilder: (context, index) {
          final a = absences[index];

          return Card(
            child: ListTile(
              leading: const Icon(Icons.warning),
              title: Text(a['date']),
              subtitle: Text(a['motif'] ?? "Aucun motif"),
            ),
          );
        },
      ),
    );
  }
}