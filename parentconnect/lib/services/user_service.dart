import 'package:supabase_flutter/supabase_flutter.dart';

class AdminService {
  final supabase = Supabase.instance.client;

  // 🚀 INVITE USER VIA EDGE FUNCTION
  Future<void> inviteUser({
    required String email,
    required String nom,
    required String prenom,
    required String role,
  }) async {
    final response = await supabase.functions.invoke(
      'invite-user',
      body: {
        'email': email,
        'nom': nom,
        'prenom': prenom,
        'role': role,
      },
    );

    if (response.status != 200) {
      throw Exception(response.data);
    }
  }

  Future<void> createEleve(Map<String, dynamic> data) async {
    await supabase.from('eleves').insert(data);
  }

  Future<void> linkParent(String eleveId, String parentId) async {
    await supabase.from('eleves').update({
      'parent_id': parentId,
    }).eq('id', eleveId);
  }

  Future<List> getUsers() async {
    return await supabase.from('profiles').select();
  }

  Future<List> getEleves() async {
    return await supabase.from('eleves').select();
  }
}