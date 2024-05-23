import 'package:elections/candidat/business/interactors/CandidatInteractor.dart';
import 'package:elections/candidat/business/interactors/DisableAllCandidatUseCase.dart';
import 'package:elections/candidat/business/interactors/DisableCandidatUseCase.dart';
import 'package:elections/candidat/business/interactors/GetAllCandidatUseCase.dart';
import 'package:elections/candidat/business/model/candidat/Candidat.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "CandidatListController.g.dart";

class CandidatState{
  List<Candidat> data = [];
  bool isLoading = false;

  CandidatState({this.data = const [] , this.isLoading = false });
}

class CandidatListController extends _$CandidatListController  {
  // late GetAllCandidatUseCase getAllCandidatUseCase;
  // late DisableAllCandidatUseCase disableAllCandidatUseCase;
  // late DisableCandidatUseCase disableCandidatUseCase;

  @override
  CandidatState build(){
    //var interactor = ref.watch(candidatInteractorProvider);
    // getAllCandidatUseCase = interactor.getAllCandidatUseCase;
    // disableAllCandidatUseCase = interactor.disableAllCandidatUseCase;
    // disableCandidatUseCase = interactor.disableCandidatUseCase;

    return CandidatState();
  }

  Future<List<Candidat>> getList() async{
    state = CandidatState(data: state.data, isLoading: true);
    var interactor = ref.watch(candidatInteractorProvider);
    var res = await interactor.getAllCandidatUseCase.run();
    if(res.length == 0){
      state = CandidatState(data: res, isLoading: true);
    }else{
      state = CandidatState(data: res, isLoading: false);
    }
    return Future.value(res);
  }

  Future<bool> disableAll() async{
    var interactor = ref.watch(candidatInteractorProvider);
    var res = await interactor.disableAllCandidatUseCase.run();
    return res;
  }

  Future<bool> disable(data) async{
    var interactor = ref.watch(candidatInteractorProvider);
    var res = await interactor.disableCandidatUseCase.run(data);
    return res;
  }
}