import '../services/user_service.dart';

class AdminController {
  final AdminService _adminService = AdminService();

  // 👨‍🏫 inviter enseignant / parent / student
  Future<void> inviteUser({
    required String email,
    required String nom,
    required String prenom,
    required String role,
  }) async {
    await _adminService.inviteUser(
      email: email,
      nom: nom,
      prenom: prenom,
      role: role,
    );
  }

  // 🎓 élève
  Future<void> createEleve(Map<String, dynamic> data) async {
    await _adminService.createEleve(data);
  }

  // 🔗 lien parent-élève
  Future<void> linkParent(String eleveId, String parentId) async {
    await _adminService.linkParent(eleveId, parentId);
  }

  // 👥 users
  Future<List> getUsers() async {
    return await _adminService.getUsers();
  }

  // 🧑‍🎓 élèves
  Future<List> getEleves() async {
    return await _adminService.getEleves();
  }
}