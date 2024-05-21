// To parse this JSON data, do
//
//     final missionDetail = missionDetailFromJson(jsonString);

import 'dart:convert';

MissionDetail missionDetailFromJson(String str) => MissionDetail.fromJson(json.decode(str));

String missionDetailToJson(MissionDetail data) => json.encode(data.toJson());

class MissionDetail {
    int id;
    String lieu;
    String dateDebut;
    String dateFin;
    String objectif;

    MissionDetail({
      this.id = -1 ,
      required this.lieu,
      required this.dateDebut ,
      required this.dateFin,
      this.objectif = "",
    });

    factory MissionDetail.fromJson(Map<String, dynamic> json) => MissionDetail(
      id: json["id"] ?? -1 ,
      lieu: json["lieu"] ?? "" ,
      dateDebut: json["dateDebut"] ?? "",
      dateFin: json["dateFin"] ?? "",
      objectif: json["objectif"] ?? "",
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "lieu": lieu,
        "dateDebut": dateDebut,
        "dateFin": dateFin,
        "objectif": objectif,
    };
}
