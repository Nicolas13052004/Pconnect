import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'classe_service.dart';

class AuthService {
  final _client = SupabaseService.client;

  

  Future<User?> login(String email, String password) async {
    try {
      final response = await _client.auth.signInWithPassword(
        email: email,
        password: password,
      );

      return response.user;
    } on AuthException catch (e) {
      debugPrint("LOGIN ERROR: ${e.message}");
      return null;
    }
  }

  Future<void> logout() async {
    await _client.auth.signOut();
  }


  // À la fin de ton fichier auth_service.dart existant, ajoute :

  // // ✅ NOUVEAU : Changer le mot de passe de l'utilisateur connecté
  // Future<void> updatePassword(String newPassword) async {
  //   await _client.auth.updateUser(
  //     UserAttributes(password: newPassword),
  //   );
  // }

  // // ✅ NOUVEAU : Réinitialiser le mot de passe (envoi email)
  // Future<void> resetPassword(String email) async {
  //   await _client.auth.resetPasswordForEmail(email);
  // }

  // // ✅ NOUVEAU : Mettre à jour l'email de l'utilisateur
  // Future<void> updateEmail(String newEmail) async {
  //   await _client.auth.updateUser(
  //     UserAttributes(email: newEmail),
  //   );
  // }

  
  User? getCurrentUser() {
    return _client.auth.currentUser;
  }
}




