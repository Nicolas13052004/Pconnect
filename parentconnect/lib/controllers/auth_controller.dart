import '../services/auth_service.dart';
import '../services/eleve_service.dart';
import '../models/user_model.dart';

class AuthController {
  final AuthService _authService = AuthService();
  final ProfileService _profileService = ProfileService();

  ProfileModel? currentUser;

  Future<String?> login(String email, String password) async {
    try {
      // 1. LOGIN VIA SERVICE
      final user = await _authService.login(email, password);

      if (user == null) return null;

      // 2. GET PROFILE
      final profile = await _profileService.getProfile(user.id);

      if (profile == null) return null;

      // 3. RETURN ROLE
      return profile['role'];
    } catch (e) {
      print("LOGIN ERROR: $e");
      return null;
    }
  }

  Future<void> logout() async {
    await _authService.logout();
    currentUser = null;
  }
}