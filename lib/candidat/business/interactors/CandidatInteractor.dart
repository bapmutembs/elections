import 'package:elections/candidat/business/interactors/CreateCandidatUseCase.dart';
import 'package:elections/candidat/business/interactors/DisableAllCandidatUseCase.dart';
import 'package:elections/candidat/business/interactors/DisableCandidatUseCase.dart';
import 'package:elections/candidat/business/interactors/GetAllCandidatUseCase.dart';
import 'package:elections/candidat/business/service/CandidatLocalService.dart';
import 'package:elections/candidat/business/service/CandidatNetworkService.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'CandidatInteractor.g.dart';

class CandidatInteractor {
  CreateCandidatUseCase createCandidatUseCase;
  GetAllCandidatUseCase getAllCandidatUseCase;
  DisableAllCandidatUseCase disableAllCandidatUseCase;
  DisableCandidatUseCase disableCandidatUseCase;

  CandidatInteractor({
    required this.createCandidatUseCase,
    required this.getAllCandidatUseCase,
    required this.disableAllCandidatUseCase,
    required this.disableCandidatUseCase,
  });

  factory CandidatInteractor.build(CandidatNetworkService networkService) {
    return CandidatInteractor(
      createCandidatUseCase: CreateCandidatUseCase(service: networkService),
      getAllCandidatUseCase: GetAllCandidatUseCase(service: networkService),
      disableAllCandidatUseCase:
          DisableAllCandidatUseCase(service: networkService),
      disableCandidatUseCase: DisableCandidatUseCase(
        service: networkService,
      ),
    );
  }
}

@Riverpod(keepAlive: true)
CandidatInteractor candidatInteractor(Ref ref) {
  throw UnimplementedError();
}
