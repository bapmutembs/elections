import 'package:elections/user/business/service/UserLocalService.dart';

class GetTokenUseCase{
  UserLocalService local;

  GetTokenUseCase({required this.local});

  Future<String?> run()async{
    var token = await local.getToken() ;
    return token;
  }
}