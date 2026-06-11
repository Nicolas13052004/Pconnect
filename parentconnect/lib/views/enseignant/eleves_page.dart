import 'package:flutter/material.dart';
import '../../controllers/eleve_controller.dart';

class ElevesPage extends StatefulWidget {
  const ElevesPage({super.key});

  @override
  State<ElevesPage> createState() => _ElevesPageState();
}

class _ElevesPageState extends State<ElevesPage> {

  final controller = EleveController();
  List eleves = [];

  @override
  void initState() {
    super.initState();
    loadEleves();
  }

  Future loadEleves() async {
    final data = await controller.getAll();
    setState(() {
      eleves = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Mes élèves")),
      body: ListView.builder(
        itemCount: eleves.length,
        itemBuilder: (context, index) {

          final e = eleves[index];

          return ListTile(
            leading: const Icon(Icons.person),
            title: Text("${e['nom']} ${e['prenom']}"),
            subtitle: Text("Classe: ${e['classId']}"),
          );
        },
      ),
    );
  }
}