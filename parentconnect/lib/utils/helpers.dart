class Helpers {

  // 🔐 vérifier si string est vide
  static bool isEmpty(String value) {
    return value.trim().isEmpty;
  }

  // 📧 validation email simple
  static bool isEmailValid(String email) {
    return email.contains("@") && email.contains(".");
  }

  // 📅 format date simple
  static String formatDate(DateTime date) {
    return "${date.day}/${date.month}/${date.year}";
  }

  // 🚨 message erreur simple
  static String errorMessage(String field) {
    return "$field ne peut pas être vide";
  }
}