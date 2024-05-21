import 'package:elections/candidat/business/interactors/CandidatInteractor.dart';
import 'package:elections/candidat/business/interactors/DisableAllCandidatUseCase.dart';
import 'package:elections/candidat/business/interactors/DisableCandidatUseCase.dart';
import 'package:elections/candidat/business/interactors/GetAllCandidatUseCase.dart';
import 'package:elections/candidat/business/model/candidat/Candidat.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "CandidatListController.g.dart";

class CandidatListController extends _$CandidatListController  {
  late GetAllCandidatUseCase getAllCandidatUseCase;
  late DisableAllCandidatUseCase disableAllCandidatUseCase;
  late DisableCandidatUseCase disableCandidatUseCase;

  @override
  bool build(){
    var interactor = ref.watch(candidatInteractorProvider);
    getAllCandidatUseCase = interactor.getAllCandidatUseCase;
    disableAllCandidatUseCase = interactor.disableAllCandidatUseCase;
    disableCandidatUseCase = interactor.disableCandidatUseCase;
    return false;
  }

  Future<List<Candidat>> getList() async{
    // state = true;
    var res = await getAllCandidatUseCase.run();
    // state = false;
    return res;
  }

  Future<bool> disableAll() async{
    var res = await disableAllCandidatUseCase.run();
    return res;
  }

  Future<bool> disable(data) async{
    var res = await disableCandidatUseCase.run(data);
    return res;
  }
}