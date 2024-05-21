// To parse this JSON data, do
//
//     final departement = departementFromJson(jsonString);

import 'dart:convert';

Departement departementFromJson(String str) => Departement.fromJson(json.decode(str));

String departementToJson(Departement data) => json.encode(data.toJson());

class Departement {
    int id;
    String nom;
    String dateCreation;

    Departement({
        this.id = -1,
        required this.nom ,
        this.dateCreation = "" ,
    });

    factory Departement.fromJson(Map<String, dynamic> json) => Departement(
        id: json["id"] ?? -1 ,
        nom: json["nom"] ?? "" ,
        dateCreation: json["dateCreation"] ?? "",
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nom": nom,
        "dateCreation": dateCreation,
    };
}
