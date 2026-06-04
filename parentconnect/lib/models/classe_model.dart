class ClasseModel {
  final String id;
  final String nom;
  final String niveau;

  ClasseModel({
    required this.id,
    required this.nom,
    required this.niveau,
  });

  factory ClasseModel.fromJson(Map<String, dynamic> json) {
    return ClasseModel(
      id: json['id'],
      nom: json['nom'],
      niveau: json['niveau'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nom': nom,
      'niveau': niveau,
    };
  }
}