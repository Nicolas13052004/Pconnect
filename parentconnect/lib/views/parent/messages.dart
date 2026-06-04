import 'package:flutter/material.dart';
import '../../controllers/parent_controller.dart';

class ParentMessages extends StatefulWidget {
  const ParentMessages({super.key});

  @override
  State<ParentMessages> createState() => _ParentMessagesState();
}

class _ParentMessagesState extends State<ParentMessages> {
  final controller = ParentController();
  List messages = [];

  Future<void> load() async {
    messages = await controller.getMessages("user_id");
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
      appBar: AppBar(title: const Text("Messages")),

      body: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) {
          final m = messages[index];

          return Card(
            child: ListTile(
              title: Text(m['contenu']),
              subtitle: Text("De: ${m['sender_id']}"),
            ),
          );
        },
      ),
    );
  }
}