import 'package:elections/candidat/business/interactors/CandidatInteractor.dart';
import 'package:elections/candidat/business/interactors/CreateCandidatUseCase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "CandidatEnregistrerController.g.dart";

class CandidatEnregistrerState{
  // List<Candidat> data = [];
  bool isLoading = false;

  CandidatEnregistrerState({ this.isLoading = false });
}

class CandidatEnregistrerController extends _$CandidatEnregistrerController {
  // late CreateCandidatUseCase createCandidatUseCase;

  @override
  CandidatEnregistrerState build(){
    // var interactor = ref.watch(candidatInteractorProvider);
    // createCandidatUseCase = interactor.createCandidatUseCase;
    return CandidatEnregistrerState();
  }

  Future<bool> submitForm(data) async{
    state = CandidatEnregistrerState(isLoading: true);
    var interactor = ref.watch(candidatInteractorProvider);
    var res = await interactor.createCandidatUseCase.run(data);
    state = CandidatEnregistrerState( isLoading: false);
    print("Candidat enregistrer");
    return res!="";
  }
}