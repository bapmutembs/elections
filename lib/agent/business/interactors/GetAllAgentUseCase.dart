import 'package:elections/agent/business/service/AgentNetworkService.dart';
import 'package:elections/departement/business/service/DepartementNetworkService.dart';

class GetAllAgentUseCase{
  AgentNetworkService service;

  GetAllAgentUseCase({
    required this.service
  });

  Future<List<dynamic>> run(){
    return service.getAllAgent();
  }
}