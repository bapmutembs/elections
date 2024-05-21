import 'package:elections/candidat/business/service/CandidatNetworkService.dart';

class DisableCandidatUseCase{
  CandidatNetworkService service;

  DisableCandidatUseCase({
    required this.service
  });

  Future<bool> run(candidat)async{
    return await service.disableCandidat(candidat);
  }
}