import 'package:elections/departement/business/service/DepartementNetworkService.dart';
import 'package:elections/mission/business/service/MissionNetworkService.dart';

class GetAllMissionUseCase{
  MissionNetworkService service;

  GetAllMissionUseCase({
    required this.service
  });

  Future<List<dynamic>> run(){
    return service.getAllMission();
  }
}