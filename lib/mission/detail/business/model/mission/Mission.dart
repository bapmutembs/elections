// To parse this JSON data, do
//
//     final mission = missionFromJson(jsonString);

import 'dart:convert';

import 'package:elections/agent/business/model/agent/Agent.dart';
import 'package:elections/business/MissionDetail.dart';

Mission missionFromJson(String str) => Mission.fromJson(json.decode(str));

String missionToJson(Mission data) => json.encode(data.toJson());

class Mission {
    Agent agent;
    MissionDetail detail;
    bool isActive;

    Mission({
      required this.agent,
      required this.detail,
      this.isActive = true ,
    });

    factory Mission.fromJson(Map<String, dynamic> json) => Mission(
      agent: json["agent"] ?? null ,
      detail: json["detail"] ?? null ,
      isActive: json["isActive"],
    );

    Map<String, dynamic> toJson() => {
      "agent" : agent,
      "detail" : detail,
      "isActive": isActive,
    };
}
