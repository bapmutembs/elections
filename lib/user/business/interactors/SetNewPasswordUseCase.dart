
import 'package:elections/user/business/service/UserNetworkService.dart';

class SetNewPasswordUseCase{
  UserNetworkService service;

 SetNewPasswordUseCase({
    required this.service
  });

  Future<dynamic> run(data){
    return service.setNewPassword(data);
  }
}