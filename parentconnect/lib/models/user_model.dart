class ProfileModel {
  final String id;
  final String nom;
  final String prenom;
  final String email;
  final String role;
  final String? telephone;
  final String? photo;

  ProfileModel({
    required this.id,
    required this.nom,
    required this.prenom,
    required this.email,
    required this.role,
    this.telephone,
    this.photo,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'],
      nom: json['nom'],
      prenom: json['prenom'],
      email: json['email'],
      role: json['role'],
      telephone: json['telephone'],
      photo: json['photo'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nom': nom,
      'prenom': prenom,
      'email': email,
      'role': role,
      'telephone': telephone,
      'photo': photo,
    };
  }
}