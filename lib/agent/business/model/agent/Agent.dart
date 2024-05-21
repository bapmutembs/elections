// To parse this JSON data, do
//
//     final agent = agentFromJson(jsonString);

import 'dart:convert';

import 'package:elections/departement/business/model/departement/Departement.dart';

Agent agentFromJson(String str) => Agent.fromJson(json.decode(str));

String agentToJson(Agent data) => json.encode(data.toJson());

class Agent {
    int id;
    Departement departement;
    String matricule;
    String nomComplet;
    String sexe;
    String etatCivil;
    String dateNaissance;
    String grade;
    int nombreEnfant;
    String telephone;
    String email;

    Agent({
        this.id = -1 ,
        required this.departement,
        this.matricule =  "",
        required this.nomComplet ,
        this.sexe =  "" ,
        this.etatCivil =  "" ,
        this.dateNaissance =  "" ,
        this.grade =  "" ,
        this.nombreEnfant = 0 ,
        this.telephone =  "" ,
        this.email =  "" ,
    });

    factory Agent.fromJson(Map<String, dynamic> json) => Agent(
        id: json["id"] ?? -1 ,
        departement: json["departement"] ?? null  ,
        matricule: json["matricule"] ?? "" ,
        nomComplet: json["nomComplet"] ?? "" ,
        sexe: json["sexe"] ?? "" ,
        etatCivil: json["etatCivil"] ?? "" ,
        dateNaissance: json["dateNaissance"] ?? "" ,
        grade: json["grade"] ?? "" ,
        nombreEnfant: json["nombreEnfant"] ?? 0 ,
        telephone: json["telephone"] ?? "" ,
        email: json["email"] ?? "",
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "matricule": matricule,
        "nomComplet": nomComplet,
        "sexe": sexe,
        "etatCivil": etatCivil,
        "dateNaissance": dateNaissance,
        "grade": grade,
        "nombreEnfant": nombreEnfant,
        "telephone": telephone,
        "email": email,
    };
}
