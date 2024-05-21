import 'package:elections/candidat/business/model/candidat/Candidat.dart';
import 'package:elections/candidat/business/model/candidat/CreateCandidatRequest.dart';

abstract class CandidatNetworkService{
  Future<bool> createCandidat(CreateCandidatRequest data);
  Future<dynamic> getCandidat(String token);
  Future<List<Candidat>> getAllCandidat();
  //Future<bool> updateCandidat(UpdateCandidatRequest data);
  Future<bool> disableCandidat(Candidat candidat);
  Future<bool> disableAllCandidat();

}