import 'package:elections/agent/business/service/AgentNetworkService.dart';
import 'package:elections/candidat/business/service/CandidatNetworkService.dart';
import 'package:elections/departement/business/service/DepartementNetworkService.dart';

class CreateAgentUseCase{
  AgentNetworkService service;

  CreateAgentUseCase({
    required this.service
  });

  Future<bool> run(data){
    return service.createAgent(data);
  }
}