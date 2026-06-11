import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'views/auth/login_page.dart';

import 'views/admin/dashboard_admin.dart';
import 'views/parent/dashboard_parent.dart';
import 'views/enseignant/dashboard_enseignant.dart';
import 'views/eleve/dashboard_eleve.dart';

void main() {
  runApp(const ParentConnectApp());
}

class ParentConnectApp extends StatelessWidget {
  const ParentConnectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'ParentConnect',

      routerConfig: _router,
    );
  }
}