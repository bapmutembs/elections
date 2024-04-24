import 'Agent.dart';

class MissionDetail{
  int id;
  String lieu;
  String dateDebut;
  String dateFin;
  String objectif;
  bool isActive;

  MissionDetail({
    required this.id,
    this.lieu = "",
    this.dateDebut = "",
    this.dateFin = "",
    this.objectif = "",
    this.isActive = true,
  });
}