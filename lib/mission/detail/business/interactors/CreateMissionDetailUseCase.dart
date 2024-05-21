import 'package:elections/agent/business/service/AgentNetworkService.dart';
import 'package:elections/candidat/business/service/CandidatNetworkService.dart';
import 'package:elections/departement/business/service/DepartementNetworkService.dart';
import 'package:elections/mission/detail/business/service/MissionDetailNetworkService.dart';

class CreateMissionDetailUseCase{
  MissionDetailNetworkService service;

  CreateMissionDetailUseCase({
    required this.service
  });

  Future<bool> run(data){
    return service.createMissionDetail(data);
  }
}