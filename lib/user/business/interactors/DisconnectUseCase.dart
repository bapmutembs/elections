import 'package:elections/user/business/service/UserLocalService.dart';

class DisconnectUseCase{
  UserLocalService local;

  DisconnectUseCase({required this.local});

  Future<void> run()async{
    await local.disconnect() ;
  }
}