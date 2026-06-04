import 'package:flutter/material.dart';
import '../../controllers/teacher_controller.dart';

class SendMessage extends StatefulWidget {
  const SendMessage({super.key});

  @override
  State<SendMessage> createState() => _SendMessageState();
}

class _SendMessageState extends State<SendMessage> {
  final controller = TeacherController();

  final receiverId = TextEditingController();
  final message = TextEditingController();

  Future<void> send() async {
    await controller.sendMessage(
      senderId: "teacher_id",
      receiverId: receiverId.text,
      contenu: message.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Messages")),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            TextField(
              controller: receiverId,
              decoration: const InputDecoration(labelText: "ID Parent"),
            ),

            TextField(
              controller: message,
              decoration: const InputDecoration(labelText: "Message"),
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: send,
              child: const Text("Envoyer"),
            ),
          ],
        ),
      ),
    );
  }
}