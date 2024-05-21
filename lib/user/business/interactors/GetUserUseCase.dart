import 'package:elections/user/business/model/user/User.dart';
import 'package:elections/user/business/service/UserLocalService.dart';

class GetUserUseCase{
  UserLocalService local;

  GetUserUseCase({required this.local});

  Future<User> run()async{
    User user = await local.getUser() ;
    return user;
  }
}