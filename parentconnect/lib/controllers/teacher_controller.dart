import '../services/message_service.dart';

class TeacherController {
  final TeacherService _service = TeacherService();

  // 📚 voir élèves
  Future<List> getMyStudents(String teacherId) async {
    return await _service.getMyStudents(teacherId);
  }

  // 📝 ajouter note
  Future<void> addNote({
    required String eleveId,
    required String matiereId,
    required String enseignantId,
    required double note,
    required double coefficient,
    String? trimestre,
  }) async {
    await _service.addNote({
      'eleve_id': eleveId,
      'matiere_id': matiereId,
      'enseignant_id': enseignantId,
      'note': note,
      'coefficient': coefficient,
      'trimestre': trimestre,
    });
  }

  // ⚠️ absence
  Future<void> addAbsence({
    required String eleveId,
    required String enseignantId,
    required String date,
    String? motif,
  }) async {
    await _service.addAbsence({
      'eleve_id': eleveId,
      'enseignant_id': enseignantId,
      'date': date,
      'motif': motif,
      'statut': 'absent',
    });
  }

  // 💬 message parent
  Future<void> sendMessage({
    required String senderId,
    required String receiverId,
    required String contenu,
  }) async {
    await _service.sendMessage({
      'sender_id': senderId,
      'receiver_id': receiverId,
      'contenu': contenu,
    });
  }

  // 📢 annonces
  Future<List> getAnnonces() async {
    return await _service.getAnnonces();
  }
}