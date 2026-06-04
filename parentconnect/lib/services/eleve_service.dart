import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/user_model.dart';

class ProfileService {  
  final supabase = Supabase.instance.client;

  Future<Map<String, dynamic>?> getProfile(String userId) async {
    final profile = await supabase
    .from('profiles')
    .select()
    .eq('id', userId)
    .maybeSingle();

    if (profile == null) {
      print("Profil introuvable");
    }

    return profile;
  }

  // 📥 Get all users
  Future<List<ProfileModel>> getAllUsers() async {
    final data = await supabase.from('profiles').select();

    return (data as List)
        .map((e) => ProfileModel.fromJson(e))
        .toList();
  }

  // 📥 Get user by id
  Future<ProfileModel> getUserById(String id) async {
    final data =
        await supabase.from('profiles').select().eq('id', id).single();

    return ProfileModel.fromJson(data);
  }

  // ➕ Create user
  Future<void> createUser(Map<String, dynamic> data) async {
    await supabase.from('profiles').insert(data);
  }

  // ✏️ Update user
  Future<void> updateUser(String id, Map<String, dynamic> data) async {
    await supabase.from('profiles').update(data).eq('id', id);
  }

  // ❌ Delete user
  Future<void> deleteUser(String id) async {
    await supabase.from('profiles').delete().eq('id', id);
  }
}