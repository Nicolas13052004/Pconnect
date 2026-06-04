class AnnonceModel {
  final String id;
  final String titre;
  final String contenu;
  final String? auteurId;
  final String createdAt;

  AnnonceModel({
    required this.id,
    required this.titre,
    required this.contenu,
    this.auteurId,
    required this.createdAt,
  });

  factory AnnonceModel.fromJson(Map<String, dynamic> json) {
    return AnnonceModel(
      id: json['id'],
      titre: json['titre'],
      contenu: json['contenu'],
      auteurId: json['auteur_id'],
      createdAt: json['created_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'titre': titre,
      'contenu': contenu,
      'auteur_id': auteurId,
      'created_at': createdAt,
    };
  }
}