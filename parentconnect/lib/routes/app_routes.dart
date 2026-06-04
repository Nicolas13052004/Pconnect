import 'package:flutter/material.dart';

// AUTH
import '../views/auth/login_view.dart';

// ADMIN
import '../views/admin/admin_dashboard.dart';
import '../views/admin/teachers_page.dart';
import '../views/admin/parents_page.dart';
import '../views/admin/students_page.dart';
import '../views/admin/users_list.dart';
import '../views/admin/link_parent_student.dart';

// TEACHER
import '../views/teacher/teacher_dashboard.dart';
import '../views/teacher/my_students.dart';
import '../views/teacher/add_note.dart';
import '../views/teacher/mark_absence.dart';
import '../views/teacher/send_message.dart';

// PARENT
import '../views/parent/parent_dashboard.dart';
import '../views/parent/child_notes.dart';
import '../views/parent/child_absences.dart';
import '../views/parent/messages.dart';
import '../views/parent/annonces.dart';

// STUDENT
import '../views/student/student_dashboard.dart';
import '../views/student/my_notes.dart';
import '../views/student/my_absences.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {

    // AUTH
    '/login': (context) => const LoginView(),

    // ADMIN
    '/admin': (context) => const AdminDashboard(),
    '/teachers': (context) => const TeachersPage(),
    '/parents': (context) => const ParentsPage(),
    '/students': (context) => const StudentsPage(),
    '/users': (context) => const UsersList(),
    '/link': (context) => const LinkParentStudent(),

    // TEACHER
    '/teacher': (context) => const TeacherDashboard(),
    '/my_students': (context) => const MyStudents(),
    '/add_note': (context) => const AddNote(),
    '/mark_absence': (context) => const MarkAbsence(),
    '/send_message': (context) => const SendMessage(),

    // PARENT
    '/parent': (context) => const ParentDashboard(),
    '/child_notes': (context) => const ChildNotes(),
    '/child_absences': (context) => const ChildAbsences(),
    '/messages': (context) => const ParentMessages(),
    '/annonces': (context) => const ParentAnnonces(),

    // STUDENT
    '/student': (context) => const StudentDashboard(),
    '/my_notes': (context) => const MyNotes(),
    '/my_absences': (context) => const MyAbsences(),
  };
}