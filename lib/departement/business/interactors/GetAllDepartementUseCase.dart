import 'package:elections/departement/business/service/DepartementNetworkService.dart';

class GetAllDepartementUseCase{
  DepartementNetworkService service;

  GetAllDepartementUseCase({
    required this.service
  });

  Future<List<dynamic>> run(){
    return service.getAllDepartement();
  }
}