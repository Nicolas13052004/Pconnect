class AppConstants {
  // 🔗 App name
  static const String appName = "SchoolApp";

  // 👤 Roles
  static const String roleAdmin = "admin";
  static const String roleTeacher = "teacher";
  static const String roleParent = "parent";
  static const String roleStudent = "student";

  // 📡 API timeout
  static const int requestTimeout = 30;

  // 🔐 Shared keys (session storage)
  static const String userTokenKey = "user_token";
  static const String userRoleKey = "user_role";
  static const String userIdKey = "user_id";
}