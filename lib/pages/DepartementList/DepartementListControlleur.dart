import 'package:elections/business/Candidat.dart';
import 'package:elections/business/Departement.dart';

class DepartementListController{
  List<Departement> listDepartements = [];
  
  List<Departement> get(){
    Departement departement =
        Departement(id: 2, nom: "RH", dateCreation: "20/12/2023");
    Departement departement2 =
        Departement(id: 3, nom: "Informatique", dateCreation: "20/12/2022");
    Departement departement3 =
        Departement(id: 4, nom: "Finance", dateCreation: "20/12/2022");

    this.listDepartements.addAll([departement, departement2,departement3]);

    return this.listDepartements;
  }
}   
