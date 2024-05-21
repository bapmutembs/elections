// To parse this JSON data, do
//
//     final candidat = candidatFromJson(jsonString);

import 'dart:convert';

Candidat candidatFromJson(String str) => Candidat.fromJson(json.decode(str));

String candidatToJson(Candidat data) => json.encode(data.toJson());

class Candidat {
    int id;
    String nomComplet;
    String sexe;
    String dateNaissance;
    String etatCivil;
    String telephone;
    String email;
    String niveauEtude;
    String poste;
    String status;

    Candidat({
        this.id = 0,
        required this.nomComplet,
        this.sexe = "" ,
        this.dateNaissance = "" ,
        this.etatCivil = "" ,
        this.telephone = "" ,
        this.email = "" ,
        this.niveauEtude = "" ,
        this.poste =  "",
        this.status = "" ,
    });

    factory Candidat.fromJson(Map<String, dynamic> json) => Candidat(
        id: json["id"] ?? 0 ,
        nomComplet: json["nomComplet"] ?? "" ,
        sexe: json["sexe"] ?? "" ,
        dateNaissance: json["dateNaissance"] ?? "" ,
        etatCivil: json["etatCivil"] ?? "" ,
        telephone: json["telephone"] ?? "" ,
        email: json["email"] ?? "" ,
        niveauEtude: json["niveauEtude"] ?? "",
        poste: json["poste"] ?? "" ,
        status: json["status"] ?? "",
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nomComplet": nomComplet,
        "sexe": sexe,
        "dateNaissance": dateNaissance,
        "etatCivil": etatCivil,
        "telephone": telephone,
        "email": email,
        "niveauEtude": niveauEtude,
        "poste": poste,
        "status": status,
    };
}
