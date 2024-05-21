import 'package:elections/departement/business/model/departement/Departement.dart';
import 'package:elections/departement/business/model/departement/CreateDepartementRequest.dart';

abstract class DepartementNetworkService{
  Future<bool> createDepartement(CreateDepartementRequest data);
  Future<dynamic> getDepartement(String token);
  Future<List<dynamic>> getAllDepartement();
  //Future<bool> updateDepartement(UpdateDepartementRequest data);
  Future<bool> disableAllDepartement();

}