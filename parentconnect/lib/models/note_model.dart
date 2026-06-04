class NoteModel {
  final String id;
  final String eleveId;
  final String matiereId;
  final String enseignantId;
  final double note;
  final double coefficient;
  final String? trimestre;

  NoteModel({
    required this.id,
    required this.eleveId,
    required this.matiereId,
    required this.enseignantId,
    required this.note,
    required this.coefficient,
    this.trimestre,
  });

  factory NoteModel.fromJson(Map<String, dynamic> json) {
    return NoteModel(
      id: json['id'],
      eleveId: json['eleve_id'],
      matiereId: json['matiere_id'],
      enseignantId: json['enseignant_id'],
      note: (json['note'] as num).toDouble(),
      coefficient: (json['coefficient'] as num).toDouble(),
      trimestre: json['trimestre'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'eleve_id': eleveId,
      'matiere_id': matiereId,
      'enseignant_id': enseignantId,
      'note': note,
      'coefficient': coefficient,
      'trimestre': trimestre,
    };
  }
}