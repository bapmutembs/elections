import 'package:elections/candidat/business/service/CandidatNetworkService.dart';

class CreateCandidatUseCase{
  CandidatNetworkService service;

  CreateCandidatUseCase({
    required this.service
  });

  Future<bool> run(data)async{
    return await service.createCandidat(data);
  }
}