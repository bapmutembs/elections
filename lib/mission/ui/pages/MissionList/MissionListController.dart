import 'package:elections/agent/business/model/agent/Agent.dart';
import 'package:elections/departement/business/model/departement/Departement.dart';
import 'package:elections/mission/business/model/mission/Mission.dart';
import 'package:elections/business/MissionDetail.dart';

class MissionListController {
  List<Mission> listMissions = [];
  
  List<Mission> get(){
    MissionDetail missionDetail = MissionDetail(
      id: 1,
      lieu: "Matadi",
      dateDebut: "20/05/2024",
      dateFin: "25/06/2024",
      objectif: "Signature nouveau contrat",
    );
    MissionDetail missionDetail2 = MissionDetail(
      id: 1,
      lieu: "Dubai",
      dateDebut: "20/05/2024",
      dateFin: "25/06/2024",
      objectif: "Collaboration",
    );
    Departement departement =
        Departement(id: 2, nom: "RH", dateCreation: "20/12/2023");
    Agent agent = Agent(id: 2, nomComplet: "Bap", departement: departement);
    Agent agent2 = Agent(id: 2, nomComplet: "Yup", departement: departement);
    Mission mission = Mission(detail: missionDetail, agent: agent);
    Mission mission2 = Mission(detail: missionDetail2, agent: agent2);

    this.listMissions.addAll([mission, mission2]);

    return this.listMissions;
  }
}