import '../services/note_service.dart';

class ParentController {
  final ParentService _service = ParentService();

  // 👶 enfants
  Future<List> getMyChildren(String parentId) async {
    return await _service.getMyChildren(parentId);
  }

  // 📝 notes
  Future<List> getNotes(String eleveId) async {
    return await _service.getNotes(eleveId);
  }

  // ⚠️ absences
  Future<List> getAbsences(String eleveId) async {
    return await _service.getAbsences(eleveId);
  }

  // 💬 messages
  Future<List> getMessages(String userId) async {
    return await _service.getMessages(userId);
  }

  // 📢 annonces
  Future<List> getAnnonces() async {
    return await _service.getAnnonces();
  }
}