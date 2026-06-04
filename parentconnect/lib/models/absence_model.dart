class AbsenceModel {
  final String id;
  final String eleveId;
  final String date;
  final String? motif;
  final String statut;
  final String? enseignantId;

  AbsenceModel({
    required this.id,
    required this.eleveId,
    required this.date,
    this.motif,
    required this.statut,
    this.enseignantId,
  });

  factory AbsenceModel.fromJson(Map<String, dynamic> json) {
    return AbsenceModel(
      id: json['id'],
      eleveId: json['eleve_id'],
      date: json['date'],
      motif: json['motif'],
      statut: json['statut'],
      enseignantId: json['enseignant_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'eleve_id': eleveId,
      'date': date,
      'motif': motif,
      'statut': statut,
      'enseignant_id': enseignantId,
    };
  }
}