class Candidat{
  int id;
  String nom_complet;
  String sexe;
  String dateNaissance;
  String etatCivil;
  String telephone;
  String email;
  String niveauEtude;
  String poste;
  String status;
  
  Candidat({
    required this.id,
    this.nom_complet="",
    this.sexe="",
    this.dateNaissance="",
    this.etatCivil="",
    this.telephone="",
    this.email="",
    this.niveauEtude="",
    this.poste="",
    this.status="",
  });
}