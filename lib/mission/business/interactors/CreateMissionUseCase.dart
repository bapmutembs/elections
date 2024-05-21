import 'package:elections/agent/business/service/AgentNetworkService.dart';
import 'package:elections/candidat/business/service/CandidatNetworkService.dart';
import 'package:elections/departement/business/service/DepartementNetworkService.dart';
import 'package:elections/mission/business/service/MissionNetworkService.dart';

class CreateMissionUseCase{
  MissionNetworkService service;

  CreateMissionUseCase({
    required this.service
  });

  Future<bool> run(data){
    return service.createMission(data);
  }
}