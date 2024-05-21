
import 'package:elections/mission/business/model/mission/CreateMissionRequest.dart';

abstract class MissionNetworkService{
  Future<bool> createMission(CreateMissionRequest data);
  Future<dynamic> getMission(String token);
  Future<List<dynamic>> getAllMission();
  //Future<bool> updateMission(UpdateMissionRequest data);
  Future<bool> disableAllMission();

}