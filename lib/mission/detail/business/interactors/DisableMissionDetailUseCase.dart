import 'package:elections/mission/detail/business/service/MissionDetailNetworkService.dart';

class DisableMissionDetailUseCase{
  MissionDetailNetworkService service;

  DisableMissionDetailUseCase({
    required this.service
  });

  Future<bool> run(){
    return service.disableAllMissionDetail();
  }
}