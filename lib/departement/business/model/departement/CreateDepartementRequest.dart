class CreateDepartementRequest{
  String nomComplet;
  String sexe;
  String dateNaissance;
  String etatCivil;
  String telephone;
  String email;
  String niveauEtude;
  String poste;

  CreateDepartementRequest({
    required this.nomComplet,
    this.sexe = "" ,
    this.dateNaissance = "" ,
    this.etatCivil = "" ,
    this.telephone = "" ,
    this.email = "" ,
    this.niveauEtude = "" ,
    this.poste =  "",
  });

  Map<String, dynamic> toJson() => {
    "nomComplet": nomComplet,
    "sexe": sexe,
    "dateNaissance": dateNaissance,
    "etatCivil": etatCivil,
    "telephone": telephone,
    "email": email,
    "niveauEtude": niveauEtude,
    "poste": poste,
  };
}