import 'package:elections/mission/business/service/MissionNetworkService.dart';

class DisableMissionUseCase{
  MissionNetworkService service;

  DisableMissionUseCase({
    required this.service
  });

  Future<bool> run(){
    return service.disableAllMission();
  }
}