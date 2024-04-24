class Presence{
  int id;
  String nom;
  String heureArrivee;
  String heureDepart;
  String dateArrivee;
  String dateDepart;
  Presence(
  {
    required this.id,
    required this.nom,
    this.heureArrivee="",
    this.heureDepart="",
    this.dateArrivee="",
    this.dateDepart="",
}

      );

}