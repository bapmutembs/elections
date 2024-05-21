
import 'package:elections/user/business/model/user/User.dart';
import 'package:elections/user/business/service/UserNetworkService.dart';

class CreateUserUseCase{
  UserNetworkService service;

 CreateUserUseCase({
    required this.service
  });

  Future<String> run(data)async{
    var token = await service.createUser(data);
    //User user = await service.getUser(token);
    return token;
  }
}