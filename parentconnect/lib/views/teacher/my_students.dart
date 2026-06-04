import 'package:flutter/material.dart';
import '../../controllers/teacher_controller.dart';

class MyStudents extends StatefulWidget {
  const MyStudents({super.key});

  @override
  State<MyStudents> createState() => _MyStudentsState();
}

class _MyStudentsState extends State<MyStudents> {
  final controller = TeacherController();
  List students = [];

  Future<void> load() async {
    students = await controller.getMyStudents("teacher_id"); // remplace plus tard
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
      appBar: AppBar(title: const Text("Mes élèves")),

      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          final s = students[index];

          return ListTile(
            title: Text("${s['nom']} ${s['prenom']}"),
            subtitle: Text("Classe: ${s['classe_id']}"),
          );
        },
      ),
    );
  }
}