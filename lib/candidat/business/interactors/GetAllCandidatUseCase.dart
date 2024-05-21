import 'package:elections/candidat/business/model/candidat/Candidat.dart';
import 'package:elections/candidat/business/service/CandidatNetworkService.dart';

class GetAllCandidatUseCase{
  CandidatNetworkService service;

  GetAllCandidatUseCase({
    required this.service
  });

  Future<List<Candidat>> run(){
    return service.getAllCandidat();
  }
}