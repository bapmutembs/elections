import 'package:elections/business/Candidat.dart';

class CandidatListController{
  List<Candidat> listCandidats = [];
  
  List<Candidat> get(){
    Candidat candidat = Candidat(id: 2, nom_complet: "Baptiste", poste: "Developper Full-Stack");
    Candidat candidat2 = Candidat(id: 3, nom_complet: "Yum Yum", poste: "IT");

    this.listCandidats.addAll([candidat, candidat2]);

    return this.listCandidats;
  }
}   
