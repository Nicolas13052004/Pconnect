import 'package:flutter/material.dart';
import '../../controllers/parent_controller.dart';

class ParentAnnonces extends StatefulWidget {
  const ParentAnnonces({super.key});

  @override
  State<ParentAnnonces> createState() => _ParentAnnoncesState();
}

class _ParentAnnoncesState extends State<ParentAnnonces> {
  final controller = ParentController();
  List annonces = [];

  Future<void> load() async {
    annonces = await controller.getAnnonces();
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
      appBar: AppBar(title: const Text("Annonces école")),

      body: ListView.builder(
        itemCount: annonces.length,
        itemBuilder: (context, index) {
          final a = annonces[index];

          return Card(
            child: ListTile(
              title: Text(a['titre']),
              subtitle: Text(a['contenu']),
            ),
          );
        },
      ),
    );
  }
}