import 'package:elections/departement/business/service/DepartementNetworkService.dart';

class DisableDepartementUseCase{
  DepartementNetworkService service;

  DisableDepartementUseCase({
    required this.service
  });

  Future<bool> run(){
    return service.disableAllDepartement();
  }
}