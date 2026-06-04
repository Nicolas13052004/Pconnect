import 'package:supabase_flutter/supabase_flutter.dart';

class ParentService {
  final supabase = Supabase.instance.client;

  // 👶 voir enfants
  Future<List> getMyChildren(String parentId) async {
    return await supabase
        .from('eleves')
        .select()
        .eq('parent_id', parentId);
  }

  // 📝 voir notes enfant
  Future<List> getNotes(String eleveId) async {
    return await supabase
        .from('notes')
        .select()
        .eq('eleve_id', eleveId);
  }

  // ⚠️ voir absences
  Future<List> getAbsences(String eleveId) async {
    return await supabase
        .from('absences')
        .select()
        .eq('eleve_id', eleveId);
  }

  // 💬 voir messages
  Future<List> getMessages(String userId) async {
    return await supabase
        .from('messages')
        .select()
        .eq('receiver_id', userId);
  }

  // 📢 annonces
  Future<List> getAnnonces() async {
    return await supabase.from('annonces').select();
  }
}