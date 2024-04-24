import 'Agent.dart';
import 'MissionDetail.dart';

class Mission{
  MissionDetail detail ;
  Agent agent;
  bool isActive;
  
  Mission({
    required this.detail,
    required this.agent,
    this.isActive = true,
  });
}