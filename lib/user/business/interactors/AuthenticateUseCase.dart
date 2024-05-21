import 'package:elections/user/business/model/user/User.dart';
import 'package:elections/user/business/service/UserLocalService.dart';
import 'package:elections/user/business/service/UserNetworkService.dart';

class AuthenticateUseCase{
  UserNetworkService service;
  UserLocalService local;

  AuthenticateUseCase({required this.service, required this.local});

  Future<String> run(data)async{
    var token = await service.authenticate(data) ;
    local.saveToken(token);
    User user = await service.getUser(token);
    local.saveUser(user);
    return token;
  }
}