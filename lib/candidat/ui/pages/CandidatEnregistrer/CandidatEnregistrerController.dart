import 'package:elections/candidat/business/interactors/CandidatInteractor.dart';
import 'package:elections/candidat/business/interactors/CreateCandidatUseCase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "CandidatEnregistrerController.g.dart";

class CandidatEnregistrerController extends _$CandidatEnregistrerController {
  late CreateCandidatUseCase createCandidatUseCase;

  @override
  bool build(){
    var interactor = ref.watch(candidatInteractorProvider);
    createCandidatUseCase = interactor.createCandidatUseCase;
    return false;
  }

  Future<bool> submitForm(data) async{
    state = true;
    var res = await createCandidatUseCase.run(data);
    state = false;
    print("Candidat enregistrer");
    return res!="";
  }
}