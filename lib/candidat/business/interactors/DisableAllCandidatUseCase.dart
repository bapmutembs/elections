import 'package:elections/candidat/business/service/CandidatNetworkService.dart';

class DisableAllCandidatUseCase{
  CandidatNetworkService service;

  DisableAllCandidatUseCase({
    required this.service
  });

  Future<bool> run()async{
    return await service.disableAllCandidat();
  }
}