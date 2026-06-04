import 'package:supabase_flutter/supabase_flutter.dart';

class TeacherService {
  final supabase = Supabase.instance.client;

  // 📚 voir ses élèves
  Future<List> getMyStudents(String teacherId) async {
    return await supabase
        .from('eleves')
        .select()
        .eq('enseignant_id', teacherId);
  }

  // 📝 ajouter note
  Future<void> addNote(Map<String, dynamic> data) async {
    await supabase.from('notes').insert(data);
  }

  // ⚠️ marquer absence
  Future<void> addAbsence(Map<String, dynamic> data) async {
    await supabase.from('absences').insert(data);
  }

  // 💬 envoyer message parent
  Future<void> sendMessage(Map<String, dynamic> data) async {
    await supabase.from('messages').insert(data);
  }

  // 📢 voir annonces
  Future<List> getAnnonces() async {
    return await supabase.from('annonces').select();
  }
}