import 'package:elections/user/business/interactors/AuthenticateUseCase.dart';
import 'package:elections/user/business/interactors/CreateUserUseCase.dart';
import 'package:elections/user/business/interactors/DisconnectUseCase.dart';
import 'package:elections/user/business/interactors/GetTokenUseCase.dart';
import 'package:elections/user/business/interactors/GetUserUseCase.dart';
import 'package:elections/user/business/interactors/UserInteractor.dart';
import 'package:elections/user/business/model/user/AuthenticateUserRequest.dart';
import 'package:elections/user/business/model/user/CreateUserRequest.dart';
import 'package:elections/user/business/model/user/User.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "LoginController.g.dart";

@riverpod
class LoginController extends _$LoginController {
  late AuthenticateUseCase authenticateUseCase;
  late GetTokenUseCase getTokenUseCase;
  late DisconnectUseCase disconnectUseCase;
  late CreateUserUseCase createUserUseCase;
  late GetUserUseCase getUserUseCase;

  @override
  bool build(){
    var interactor = ref.watch(userInteractorProvider);
    authenticateUseCase = interactor.authenticateUseCase; 
    getTokenUseCase = interactor.getTokenUseCase;
    disconnectUseCase = interactor.disconnectUseCase;
    createUserUseCase = interactor.createUserUseCase;
    getUserUseCase = interactor.getUserUseCase;
    return false;
  }

  Future<bool> submitForm(AuthenticateUserRequest data) async{
    if(data.username != 'bapmutembs@gmail.com' || data.password != '1346'){
      return false;
    }
    state = true;
    var token = await authenticateUseCase.run(data);
    state = false;
    //print("Token recu $token");
    return token!= "";
  }

  Future<bool> createUser(CreateUserRequest data) async{
    if(data.password != data.confirmPassword){
      return false;
    }
    //state = true;
    var token = await createUserUseCase.run(data);
    //state = false;
    return true;
  }

  Future<String?> getTheToken()async{
    String? token = await getTokenUseCase.run();
    print(token);
    return token;
  }

  Future<User> getTheUser()async{
    User user = await getUserUseCase.run();
    return user;
  }

  void disconnect()async{
    await disconnectUseCase.run();
  }
}