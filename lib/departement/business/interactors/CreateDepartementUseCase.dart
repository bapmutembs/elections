import 'package:elections/candidat/business/service/CandidatNetworkService.dart';
import 'package:elections/departement/business/service/DepartementNetworkService.dart';

class CreateDepartementUseCase{
  DepartementNetworkService service;

  CreateDepartementUseCase({
    required this.service
  });

  Future<bool> run(data){
    return service.createDepartement(data);
  }
}