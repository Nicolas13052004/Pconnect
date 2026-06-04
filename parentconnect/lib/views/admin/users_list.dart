import 'package:flutter/material.dart';
import '../../controllers/admin_controller.dart';

class UsersList extends StatefulWidget {
  const UsersList({super.key});

  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  final controller = AdminController();
  List users = [];

  Future<void> loadUsers() async {
    users = await controller.getUsers();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    loadUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Utilisateurs")),

      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final u = users[index];

          return ListTile(
            title: Text(u['nom'] ?? ''),
            subtitle: Text(u['email'] ?? ''),
            trailing: Text(u['role'] ?? ''),
          );
        },
      ),
    );
  }
}