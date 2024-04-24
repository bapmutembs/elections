import 'Departement.dart';

class Agent {
  int id;
  Departement departement;
  String matricule;
  String nom;
  String prenom;
  String sexe;
  String etatCivil;
  String dateNaissance;
  String grade;
  String nombreEnfant;
  String telephone;
  String email;

  Agent({
    required this.departement,
    required this.id,
    this.matricule = "",
    this.nom = "",
    this.prenom = "",
    this.sexe = "",
    this.etatCivil = "",
    this.dateNaissance="",
    this.grade = "",
    this.nombreEnfant = "",
    this.telephone = "",
    this.email = "",
  });
}
