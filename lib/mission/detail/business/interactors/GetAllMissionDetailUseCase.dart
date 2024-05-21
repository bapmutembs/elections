import 'package:elections/departement/business/service/DepartementNetworkService.dart';
import 'package:elections/mission/detail/business/service/MissionDetailNetworkService.dart';

class GetAllMissionDetailUseCase{
  MissionDetailNetworkService service;

  GetAllMissionDetailUseCase({
    required this.service
  });

  Future<List<dynamic>> run(){
    return service.getAllMissionDetail();
  }
}