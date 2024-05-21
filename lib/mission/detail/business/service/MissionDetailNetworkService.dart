
import 'package:elections/mission/detail/business/model/mission/CreateMissionDetailRequest.dart';

abstract class MissionDetailNetworkService{
  Future<bool> createMissionDetail(CreateMissionDetailRequest data);
  Future<dynamic> getMissionDetail(String token);
  Future<List<dynamic>> getAllMissionDetail();
  //Future<bool> updateMissionDetail(UpdateMissionDetailRequest data);
  Future<bool> disableAllMissionDetail();

}