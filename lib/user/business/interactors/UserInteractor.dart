import 'package:elections/user/business/interactors/AuthenticateUseCase.dart';
import 'package:elections/user/business/interactors/CreateUserUseCase.dart';
import 'package:elections/user/business/interactors/DisconnectUseCase.dart';
import 'package:elections/user/business/interactors/GetTokenUseCase.dart';
import 'package:elections/user/business/interactors/GetUserUseCase.dart';
import 'package:elections/user/business/interactors/SetNewPasswordUseCase.dart';
import 'package:elections/user/business/service/UserLocalService.dart';
import 'package:elections/user/business/service/UserNetworkService.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'UserInteractor.g.dart';

class UserInteractor {
  AuthenticateUseCase authenticateUseCase;
  SetNewPasswordUseCase setNewPasswordUseCase;
  GetTokenUseCase getTokenUseCase;
  DisconnectUseCase disconnectUseCase;
  CreateUserUseCase createUserUseCase;
  GetUserUseCase getUserUseCase;

  UserInteractor({
    required this.authenticateUseCase,
    required this.setNewPasswordUseCase,
    required this.getTokenUseCase,
    required this.disconnectUseCase,
    required this.createUserUseCase,
    required this.getUserUseCase,
  });

  factory UserInteractor.build(
    UserNetworkService networkService,
    UserLocalService localService,
  ) {
    return UserInteractor(
      authenticateUseCase: AuthenticateUseCase(
        service: networkService,
        local: localService,
      ),
      setNewPasswordUseCase: SetNewPasswordUseCase(service: networkService),
      getTokenUseCase: GetTokenUseCase(local: localService),
      disconnectUseCase: DisconnectUseCase(local: localService),
      createUserUseCase: CreateUserUseCase(service: networkService),
      getUserUseCase: GetUserUseCase(local: localService),
    );
  }
}

@Riverpod(keepAlive: true)
UserInteractor userInteractor(Ref ref) {
  throw UnimplementedError();
}
