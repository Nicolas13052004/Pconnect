class EleveModel {
  final String id;
  final String nom;
  final String prenom;
  final String? dateNaissance;
  final String? classeId;
  final String? parentId;

  EleveModel({
    required this.id,
    required this.nom,
    required this.prenom,
    this.dateNaissance,
    this.classeId,
    this.parentId,
  });

  factory EleveModel.fromJson(Map<String, dynamic> json) {
    return EleveModel(
      id: json['id'],
      nom: json['nom'],
      prenom: json['prenom'],
      dateNaissance: json['date_naissance'],
      classeId: json['classe_id'],
      parentId: json['parent_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nom': nom,
      'prenom': prenom,
      'date_naissance': dateNaissance,
      'classe_id': classeId,
      'parent_id': parentId,
    };
  }
}