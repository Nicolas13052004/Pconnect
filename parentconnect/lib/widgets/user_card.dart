import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String role;

  const UserCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.role,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.person),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: Text(role),
      ),
    );
  }
}