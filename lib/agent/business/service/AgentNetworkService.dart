import 'package:elections/agent/business/model/agent/CreateAgentRequest.dart';

abstract class AgentNetworkService{
  Future<bool> createAgent(CreateAgentRequest data);
  Future<dynamic> getAgent(String token);
  Future<List<dynamic>> getAllAgent();
  //Future<bool> updateAgent(UpdateAgentRequest data);
  Future<bool> disableAllAgent();

}